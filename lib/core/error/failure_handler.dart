import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/error/failures.dart';

class FailureHandler{

  static Failure handle(e){

    switch(e.runtimeType){
      case InvalidEmailException:
        print(" handled ERROR_INVALID_EMAIL");
        return InvalidEmailFailure();
        //        errorMessage = "Your email address appears to be malformed.";
        break;
      case WrongPasswordException:
        print("failurehandler  ERROR_WRONG_PASSWORD");
        return WrongPasswordFailure();
//        errorMessage = "Your password is wrong.";
        break;
      case UserNotFoundException:
        print(" handled ERROR_USER_NOT_FOUND");
        return UserNotFoundFailure();
//        errorMessage = "User with this email doesn't exist.";
        break;
      case UserDisabledException:
        print(" handled ERROR_USER_DISABLED");
        return UserDisabledFailure();
//        errorMessage = "User with this email has been disabled.";
        break;
      case TooManyRequestException:
        print(" handled ERROR_TOO_MANY_REQUESTS");
        return TooManyRequestFailure();
//        errorMessage = "Too many requests. Try again later.";
        break;
      case OperationNotAllowedException:
        print(" handled ERROR_OPERATION_NOT_ALLOWED");
        return OperationNotAllowedFailure();
//        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case EmailAlreadyExistException:
        print(" handled ERROR_EMAIL_ALREADY_IN_USE");
        return EmailAlreadyExistFailure();
//        errorMessage = "An undefined Error happened.";
      default:
        print(" handled UNDEFINE_EXCEPTION");
        return UndefinedFailure();
    }
  }
}