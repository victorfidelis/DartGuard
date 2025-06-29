import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/auth_repository.dart';
import 'package:dart_guard/app/modules/main/repositories/user/user_repository.dart';
import 'package:dart_guard/app/modules/main/services/login/login_service.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/auth_failures.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late LoginService service;
  late MockAuthRepository mockAuthRepository;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockUserRepository = MockUserRepository();
    service = LoginService(authRepository: mockAuthRepository, userRepository: mockUserRepository);
  });

  group('signIn', () {
    final testUser = User(
      id: '1',
      name: 'Victor',
      email: 'victor@email.com',
      document: '12345678901',
      profilePicture: '',
    );

    test('deve retornar um usuário ao fazer login com sucesso', () async {
      when(() => mockUserRepository.getUserByDocument('12345678901')).thenAnswer((_) async => Either.right(testUser));

      when(
        () => mockAuthRepository.signInEmailPassword(email: testUser.email, password: '123456'),
      ).thenAnswer((_) async => Either.right(unit));

      final result = await service.signIn(document: '12345678901', password: '123456');

      expect(result.isRight, true);
      expect(result.right, testUser);
    });

    test('deve retornar falha se não encontrar o usuário', () async {
      when(
        () => mockUserRepository.getUserByDocument('12345678901'),
      ).thenAnswer((_) async => Either.left(UserNotFoundFailure('Usuário não encontrado')));

      final result = await service.signIn(document: '12345678901', password: '123456');

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
    });

    test('deve retornar falha se o login falhar', () async {
      when(() => mockUserRepository.getUserByDocument('12345678901')).thenAnswer((_) async => Either.right(testUser));

      when(
        () => mockAuthRepository.signInEmailPassword(email: testUser.email, password: '123456'),
      ).thenAnswer((_) async => Either.left(Failure('Senha inválida')));

      final result = await service.signIn(document: '12345678901', password: '123456');

      expect(result.isLeft, true);
      expect(result.left!.message, 'Senha inválida');
    });
  });

  group('registerUser', () {
    final newUser = User(id: '', name: 'Victor Novo', email: 'victornovo@email.com', document: '98765432101', profilePicture: '');

    test('deve registrar usuário com sucesso', () async {
      when(
        () => mockUserRepository.getUserByEmail(newUser.email),
      ).thenAnswer((_) async => Either.left(UserNotFoundFailure('')));

      when(
        () => mockUserRepository.getUserByDocument(newUser.document),
      ).thenAnswer((_) async => Either.left(UserNotFoundFailure('')));

      when(() => mockUserRepository.insert(newUser)).thenAnswer((_) async => Either.right('generatedId'));

      when(
        () => mockAuthRepository.createUserEmailPassword(email: newUser.email, password: '123456'),
      ).thenAnswer((_) async => Either.right(unit));

      final result = await service.registerUser(user: newUser, password: '123456');

      expect(result.isRight, true);
    });

    test('deve retornar erro se email já estiver cadastrado', () async {
      when(() => mockUserRepository.getUserByEmail(newUser.email)).thenAnswer((_) async => Either.right(newUser));

      final result = await service.registerUser(user: newUser, password: '123456');

      expect(result.isLeft, true);
      expect(result.left, isA<UserAlredyExists>());
    });

    test('deve remover usuário se criar auth falhar', () async {
      when(
        () => mockUserRepository.getUserByEmail(newUser.email),
      ).thenAnswer((_) async => Either.left(UserNotFoundFailure('')));
      when(
        () => mockUserRepository.getUserByDocument(newUser.document),
      ).thenAnswer((_) async => Either.left(UserNotFoundFailure('')));
      when(() => mockUserRepository.insert(newUser)).thenAnswer((_) async => Either.right('generatedId'));

      when(
        () => mockAuthRepository.createUserEmailPassword(email: newUser.email, password: '123456'),
      ).thenAnswer((_) async => Either.left(Failure('Falha ao criar conta')));

      when(() => mockUserRepository.delete('generatedId')).thenAnswer((_) async => Either.right(unit));

      final result = await service.registerUser(user: newUser, password: '123456');

      expect(result.isLeft, true);
      expect(result.left!.message, 'Falha ao criar conta');
    });
  });
}
