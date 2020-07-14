part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEmailPassword extends AuthEvent {
  final String email, password;

  LoginEmailPassword({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginOrRegisterGoogle extends AuthEvent {}

class LoginOrRegisterFacebook extends AuthEvent {}

class RegisterEmailPassword extends AuthEvent{
  final String email, password, username;

  RegisterEmailPassword({@required this.email,@required this.password,@required this.username});
  @override
  // TODO: implement props
  List<Object> get props => [email,password, username];
}
