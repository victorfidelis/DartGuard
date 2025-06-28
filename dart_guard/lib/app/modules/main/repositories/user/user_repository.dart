import 'package:dart_guard/app/shared/either/either.dart';
import 'package:dart_guard/app/shared/failures/failure.dart';
import 'package:dart_guard/app/modules/main/models/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserByDocument(String document);
  Future<Either<Failure, User>> getUserByEmail(String email);
  Future<Either<Failure, String>> insert(User user);
  Future<Either<Failure, Unit>> update(User user);
  Future<Either<Failure, Unit>> delete(String userId);
} 