import 'package:dart_guard/app/modules/main/models/login_storage.dart';
import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';

abstract class LoginStorageRepository {
  Future<Either<Failure, Unit>> saveCredentials(LoginStorage loginStorage);
  Future<Either<Failure, LoginStorage>> getSavedCredentials();
  Future<Either<Failure, Unit>> clearCredentials();
}
