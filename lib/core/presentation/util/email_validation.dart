import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/error/failures.dart';

class ValidateEmail extends Equatable {
  final Either<Failure,String> value;

  factory ValidateEmail(String email) {
    try{
      if (email == null) throw EmptyInputException();
      return ValidateEmail._(Right(validateEmail(email)));
    }on EmptyInputException{
      return ValidateEmail._(Left(EmptyInputFailure()));
    }on InvalidInputException{
      return ValidateEmail._(Left(InvalidInputFailure()));
    }
  }

  const ValidateEmail._(this.value);

  @override
  // TODO: implement props
  List<Object> get props => [value];
}

String validateEmail(String email) {
  const emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  if (RegExp(emailRegex).hasMatch(email)) {
    return email;
  } else {
    throw InvalidInputException();
  }
}
