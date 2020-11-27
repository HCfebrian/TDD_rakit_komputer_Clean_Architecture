import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/auth/exception.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:meta/meta.dart';

class ValidatePassword {
  Either<Failure, String> login(String password) {
    try {
      if (password.isEmpty) throw InvalidPasswordException();
      return Right(_validatePassword(password));
    } on InvalidPasswordException {
      return Left(InvalidPasswordFailure());
    }
  }

  Either<Failure, String> register({@required String password, @required String repeatPassword}) {
    try {
      if(password != repeatPassword) throw PasswordDidNotMatchException();
      if (password.isEmpty) throw InvalidPasswordException();
      return Right(_validatePassword(password));
    } on PasswordDidNotMatchException{
      return Left(PasswordDidNotMatchFailure());
    }on InvalidPasswordException {
      return Left(InvalidPasswordFailure());
    }
  }

  String _validatePassword(String password) {
    if(password.length <= 6) throw InvalidPasswordException();
    if(password.length >= 12) throw InvalidPasswordException();
    return password;
  }



}
