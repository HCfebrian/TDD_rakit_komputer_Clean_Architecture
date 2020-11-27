part of 'bloc_profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLogOutState extends ProfileState {}

class ProfileLogInState extends ProfileState {
  final profileUrl, name, id;

  ProfileLogInState({@required this.profileUrl,@required  this.name,@required this.id});
}
class ProfileLoadingState extends ProfileState{}

