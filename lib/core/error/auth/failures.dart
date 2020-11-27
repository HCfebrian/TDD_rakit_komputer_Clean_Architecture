import 'package:rakit_komputer/core/values/constant.dart';

import '../failure.dart';

class LoginFailure extends Failure {
  LoginFailure() : super(LOGIN_FAILURE_MESSAGE);
}

class RegisterFailure extends Failure {
  RegisterFailure() : super(REGISTER_FAILURE_MESSAGE);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(NETWORK_FAILURE_MESSAGE);
}

class EmailAlreadyExistFailure extends Failure {
  EmailAlreadyExistFailure() : super(EMAIL_ALREADY_EXIST_MESSAGE);
}

class UndefinedFailure extends Failure {
  UndefinedFailure() : super(UNEXPECTED_ERROR);
}

class InvalidEmailFailure extends Failure {
  final email;
  InvalidEmailFailure({this.email}) : super(INVALID_EMAIL_MESSAGE);
}

class InvalidPasswordFailure extends Failure {
  final password;

  InvalidPasswordFailure({this.password}) : super(INVALID_PASSWORD_MESSAGE);

  @override
  List<Object> get props => [password];
}

class InvalidUsernameFailure extends Failure {
  InvalidUsernameFailure() : super(INVALID_USERNAME_MESSAGE);
}

class PasswordDidNotMatchFailure extends Failure {
  PasswordDidNotMatchFailure() : super(PASSWORD_DID_NOT_MATCH);
}

class EmptyEmailFailure extends Failure {

  EmptyEmailFailure() : super(EMPTY_EMAIL_FIELD_MESSAGE);

}

class OperationNotAllowedFailure extends Failure {
  OperationNotAllowedFailure()
      : super(OPERATION_NOT_ALLOWED_MESSAGE);
}

class TooManyRequestFailure extends Failure {
  TooManyRequestFailure() : super(TOO_MANY_REQUEST_MESSAGE);
}

class UserDisabledFailure extends Failure {
  UserDisabledFailure() : super(USER_DISABLE_MESSAGE);
}

class UserNotFoundFailure extends Failure {
  UserNotFoundFailure() : super(USER_NOT_FOUND_MESSAGE);
}

class WrongPasswordFailure extends Failure {
  WrongPasswordFailure() : super(WRONG_PASSWORD_MESSAGE);
}

class ServerFailure extends Failure {
  ServerFailure() : super(SERVER_FAILURE_MESSAGE);
}
