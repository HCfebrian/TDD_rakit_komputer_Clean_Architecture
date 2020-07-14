import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';

abstract class Failure extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
  Failure([List properties = const <dynamic>[]]);
}

class LoginFailure extends Failure {}

class RegisterFailure extends Failure {}

class NetworkFailure extends Failure {}


class InvalidInputFailure extends Failure{
  final message = INVALID_EMAIL_MESSAGE;

}

class EmptyInputFailure extends Failure{
  final message = EMPTY_FIELD_MESSAGE;
}