import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/error/failures.dart';

class ValidateUsername {
  Either<Failure, String> validate(String username) {
    try {
      if (username.length <= 6 || username.length >= 20){
        throw InvalidUsernameException();
      }
      return Right(username);
    } on InvalidUsernameException {
      return Left(InvalidUsernameFailure());
    }
  }
}
