
part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends AuthState {

}

class Loading extends AuthState{

}

class Loaded  extends AuthState{
  final User user;

  Loaded({ this.user});

  @override
  List<Object> get props => [user];
}

class Error extends AuthState{

  final String message;

  Error( { this.message});
  @override
  List<Object> get props => [message];
}



