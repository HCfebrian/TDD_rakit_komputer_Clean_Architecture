import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
  Failure([List properties = const <dynamic>[]]);
}

class LoginFailure extends Failure {}

class RegisterFailure extends Failure {}

class NetworkFailure extends Failure {}
