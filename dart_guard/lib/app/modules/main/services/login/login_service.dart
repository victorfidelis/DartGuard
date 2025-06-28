import 'package:dart_guard/app/modules/main/models/user.dart';
import 'package:dart_guard/app/modules/main/repositories/auth/auth_repository.dart';
import 'package:dart_guard/app/modules/main/repositories/user/user_repository.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/auth_failures.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';

class LoginService {
  AuthRepository authRepository;
  UserRepository userRepository;

  LoginService({required this.authRepository, required this.userRepository});

  Future<Either<Failure, User>> signIn({required String document, required String password}) async {
    final userEither = await userRepository.getUserByDocument((document));
    if (userEither.isLeft) {
      return Either.left(Failure(userEither.left!.message));
    }

    final user = userEither.right!;
    final authEither = await authRepository.signInEmailPassword(email: user.email, password: password);
    if (authEither.isLeft) {
      return Either.left(Failure(authEither.left!.message));
    }

    return Either.right(user);
  }

  Future<Either<Failure, Unit>> registerUser({required User user, required String password}) async {
    final validityEither = await _validityUserToRegister(user);
    if (validityEither.isLeft) {
      return Either.left(Failure(validityEither.left!.message));
    }

    final insertUserEither = await userRepository.insert(user);
    if (insertUserEither.isLeft) {
      return Either.left(Failure(insertUserEither.left!.message));
    }
    final userId = insertUserEither.right!;

    final createUserEither = await authRepository.createUserEmailPassword(email: user.email, password: password);
    if (createUserEither.isLeft) {
      await userRepository.delete(userId);
      return Either.left(Failure(createUserEither.left!.message));
    }

    return Either.right(unit);
  }

  Future<Either<Failure, Unit>> _validityUserToRegister(User user) async {
    final emailEither = await userRepository.getUserByEmail(user.email);
    if (emailEither.isRight) {
      return Either.left(UserAlredyExists('E-mail já cadastrado.'));
    }
    if (emailEither.left! is UserNotFoundFailure) {
      return Either.left(Failure(emailEither.left!.message));
    }

    final documentEither = await userRepository.getUserByDocument(user.document);
    if (documentEither.isRight) {
      return Either.left(UserAlredyExists('CPF já cadastrado.'));
    }
    if (documentEither.left! is UserNotFoundFailure) {
      return Either.left(Failure(emailEither.left!.message));
    }

    return Either.right(unit);
  }
}
