

import 'package:dart_guard/app/shared/failures/failure.dart';

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
} 

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
