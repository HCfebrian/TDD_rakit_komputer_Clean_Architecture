
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

}

class Error extends AuthState{
  final String message;

  Error( this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
