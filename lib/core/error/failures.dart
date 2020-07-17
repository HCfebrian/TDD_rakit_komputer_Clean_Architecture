import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rakit_komputer/core/values/constant.dart';

abstract class Failure extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

  Failure([List properties = const <dynamic>[]]);
}

class LoginFailure extends Failure {}

class RegisterFailure extends Failure {}

class NetworkFailure extends Failure {}

class InvalidInputFailure extends Failure {
  final email;
  final message = INVALID_EMAIL_MESSAGE;

  InvalidInputFailure({@required this.email});
}

class EmptyInputFailure extends Failure {
  final email;
  final message = EMPTY_FIELD_MESSAGE;

  EmptyInputFailure(this.email);
}
