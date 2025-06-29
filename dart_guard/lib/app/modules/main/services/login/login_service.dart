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
      return Either.left(userEither.left!);
    }

    final user = userEither.right!;
    final authEither = await authRepository.signInEmailPassword(email: user.email, password: password);
    if (authEither.isLeft) {
      return Either.left(authEither.left!);
    }

    return Either.right(user);
  }

  Future<Either<Failure, Unit>> registerUser({required User user, required String password}) async {
    final validityEither = await _validityUserToRegister(user);
    if (validityEither.isLeft) {
      return Either.left(validityEither.left!);
    }

    final insertUserEither = await userRepository.insert(user);
    if (insertUserEither.isLeft) {
      return Either.left(insertUserEither.left!);
    }
    final userId = insertUserEither.right!;

    final createUserEither = await authRepository.createUserEmailPassword(email: user.email, password: password);
    if (createUserEither.isLeft) {
      await userRepository.delete(userId);
      return Either.left(createUserEither.left!);
    }

    return Either.right(unit);
  }

  Future<Either<Failure, Unit>> _validityUserToRegister(User user) async {
    final emailEither = await userRepository.getUserByEmail(user.email);
    if (emailEither.isRight) {
      return Either.left(UserAlredyExists('E-mail já cadastrado.'));
    }
    if (emailEither.left is! UserNotFoundFailure) {
      return Either.left(emailEither.left!);
    }

    final documentEither = await userRepository.getUserByDocument(user.document);
    if (documentEither.isRight) {
      return Either.left(UserAlredyExists('CPF já cadastrado.'));
    }
    if (documentEither.left is! UserNotFoundFailure) {
      return Either.left(emailEither.left!);
    }

    return Either.right(unit);
  }

  Future<Either<Failure, String>> sendPasswordResetEmail({required String document}) async {
    final userEither = await userRepository.getUserByDocument(document);
    if (userEither.isLeft) {
      return Either.left(userEither.left);
    }

    final user = userEither.right!;
    final sendEmailEither = await authRepository.sendPasswordResetEmail(email: user.email);
    if (sendEmailEither.isLeft) {
      return Either.left(sendEmailEither.left);
    }

    return Either.right(user.email);
  }
}
