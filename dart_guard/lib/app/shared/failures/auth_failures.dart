import 'package:dart_guard/app/shared/failures/failure.dart';

class UserNotFoundFailure extends Failure {
  UserNotFoundFailure(super.message);
}

class InvalidCredentialFailure extends Failure {
  InvalidCredentialFailure(super.message);
}

class TooManyRequestsFailure extends Failure {
  TooManyRequestsFailure(super.message);
}

class EmailNotVerifiedFailure extends Failure {
  EmailNotVerifiedFailure(super.message);
}

class SendEmailVerificationFailure extends Failure {
  SendEmailVerificationFailure(super.message);
}

class EmailAlreadyInUseFailure extends Failure {
  EmailAlreadyInUseFailure(super.message);
}

class UserAlredyExists extends Failure {
  UserAlredyExists(super.message);
}