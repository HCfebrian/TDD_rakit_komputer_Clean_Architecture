class LoginErrorException implements Exception {
    String code = "LOGIN_ERROR_EXCEPTION";

}

class RegisterErrorException implements Exception {
    String code = "REGISTER_ERROR_EXCEPTION";

}

class NetworkException implements Exception{
    String code = "NETWORK_EXCEPTION";

}

class EmptyInputException implements Exception{
    String code = "EMPTY_INPUT_EXCEPTION";

}

class InvalidPasswordException implements Exception{
    String code = "INVALID_PASSWORD_EXCEPTION";
}

class InvalidUsernameException implements Exception{
    String code = "INVALID_USERNAME_EXCEPTION";
}

class PasswordDidNotMatchException implements Exception{
    String code = "INVALID_PASSWORD_EXCEPTION";
}


class InvalidEmailException implements Exception{
    String code = "ERROR_INVALID_EMAIL";

}

class EmailAlreadyExistException implements Exception{
    String code = "ERROR_EMAIL_ALREADY_IN_USE";
}

class WrongPasswordException implements Exception{
    String code = "ERROR_WRONG_PASSWORD";

}

class UserNotFoundException implements Exception{
    String code = "ERROR_USER_NOT_FOUND";

}

class UserDisabledException implements Exception{
    String code = "ERROR_USER_DISABLED";

}

class TooManyRequestException implements Exception{
    String code = "ERROR_TOO_MANY_REQUESTS";

}

class OperationNotAllowedException implements Exception{
    String code = "ERROR_OPERATION_NOT_ALLOWED";
}

class UndefinedException implements Exception{
    String code = "UNDEFINE_ERROR";
}
