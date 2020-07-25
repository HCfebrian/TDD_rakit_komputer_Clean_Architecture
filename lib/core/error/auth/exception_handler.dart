import 'package:rakit_komputer/core/error/auth/exception.dart';

class FirebaseException {
  static Exception handle(e) {
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        print(" handled ERROR_INVALID_EMAIL");
        return InvalidEmailException();
        //        errorMessage = "Your email address appears to be malformed.";
        break;
      case "ERROR_WRONG_PASSWORD":
        print(" handled ERROR_WRONG_PASSWORD");
        return WrongPasswordException();
//        errorMessage = "Your password is wrong.";
        break;
      case "ERROR_USER_NOT_FOUND":
        print(" handled ERROR_USER_NOT_FOUND");
        return UserNotFoundException();
//        errorMessage = "User with this email doesn't exist.";
        break;
      case "ERROR_USER_DISABLED":
        print(" handled ERROR_USER_DISABLED");
        return UserDisabledException();
//        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        print(" handled ERROR_TOO_MANY_REQUESTS");
        return TooManyRequestException();
//        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        print(" handled ERROR_OPERATION_NOT_ALLOWED");
        return OperationNotAllowedException();
//        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        print(" handled ERROR_EMAIL_ALREADY_IN_USE");
        return EmailAlreadyExistException();
//        errorMessage = "An undefined Error happened.";
      default:
        print(" handled UNDEFINE_EXCEPTION");
        return UndefinedException();
    }
  }
}
