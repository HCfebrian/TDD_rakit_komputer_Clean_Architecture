import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/auth/exception.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/error/failure.dart';

class ValidateEmail {
  Either<Failure, String> validate(String email) {
    try {
      if (email.isEmpty) throw EmptyInputException();
      return Right(_validateEmail(email));
    } on EmptyInputException {
      return Left(EmptyEmailFailure());
    } on InvalidEmailException {
      return Left(InvalidEmailFailure(email: email));
    }
  }

  String _validateEmail(String email) {
    const emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (RegExp(emailRegex).hasMatch(email)) {
      return email;
    } else {
      throw InvalidEmailException();
    }
  }
}
