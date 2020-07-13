part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class   LoginEmailPassword extends AuthEvent{
  final String email, password;

  LoginEmailPassword(this.email, this.password);

  @override
  List<Object> get props  => [email, password];

}

class LoginGoogle extends AuthEvent{

}

class LoginFacebook extends AuthEvent{}