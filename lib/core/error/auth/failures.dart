import 'package:rakit_komputer/core/values/constant.dart';

import '../failure.dart';

class LoginFailure extends Failure {
  final message = LOGIN_FAILURE_MESSAGE;

  @override
  List<Object> get props => [message];
}

class RegisterFailure extends Failure {
  final message = REGISTER_FAILURE_MESSAGE;

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  final message = NETWORK_FAILURE_MESSAGE;

  @override
  List<Object> get props => [message];
}

class EmailAlreadyExistFailure extends Failure {
  final message = EMAIL_ALREADY_EXIST_MESSAGE;

  @override
  List<Object> get props => [message];
}

class UndefinedFailure extends Failure {
  final message = UNEXPECTED_ERROR;

  @override
  List<Object> get props => [message];
}

class InvalidEmailFailure extends Failure {
  final email;
  final message = INVALID_EMAIL_MESSAGE;

  InvalidEmailFailure({this.email});

  @override
  List<Object> get props => [email, message];
}

class InvalidPasswordFailure extends Failure {
  final password;
  final message = INVALID_PASSWORD_MESSAGE;

  InvalidPasswordFailure({this.password});

  @override
  List<Object> get props => [password, message];
}

class InvalidUsernameFailure extends Failure {
  final message = INVALID_USERNAME_MESSAGE;

  @override
  List<Object> get props => [message];
}

class PasswordDidNotMatchFailure extends Failure {
  final message = PASSWORD_DID_NOT_MATCH;

  @override
  List<Object> get props => [message];
}

class EmptyEmailFailure extends Failure {
  final email;
  final message = EMPTY_EMAIL_FIELD_MESSAGE;

  EmptyEmailFailure(this.email);

  @override
  List<Object> get props => [email, message];
}

class OperationNotAllowedFailure extends Failure {
  final message = OPERATION_NOT_ALLOWED_MESSAGE;

  @override
  List<Object> get props => [message];
}

class TooManyRequestFailure extends Failure {
  final message = TOO_MANY_REQUEST_MESSAGE;

  @override
  List<Object> get props => [message];
}

class UserDisabledFailure extends Failure {
  final message = USER_DISABLE_MESSAGE;

  @override
  List<Object> get props => [message];
}

class UserNotFoundFailure extends Failure {
  final message = USER_NOT_FOUND_MESSAGE;

  @override
  List<Object> get props => [message];
}

class WrongPasswordFailure extends Failure {
  final message = WRONG_PASSWORD_MESSAGE;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final message = SERVER_FAILURE_MESSAGE;

  @override
  List<Object> get props => [message];
}
