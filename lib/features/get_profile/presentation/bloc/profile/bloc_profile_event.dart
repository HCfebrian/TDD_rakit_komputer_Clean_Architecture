part of 'bloc_profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent{
  final token, email, password;

  GetProfileEvent({this.token, this.email, this.password});

  @override
  List<Object> get props => [token,email,password];
}
