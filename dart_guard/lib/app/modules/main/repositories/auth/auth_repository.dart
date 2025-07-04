import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInEmailPassword({required String email, required String password});

  Future<Either<Failure, Unit>> createUserEmailPassword({required String email, required String password});

  Future<Either<Failure, Unit>> sendPasswordResetEmail({required String email});

  Future<Either<Failure, Unit>> signOut();
}
