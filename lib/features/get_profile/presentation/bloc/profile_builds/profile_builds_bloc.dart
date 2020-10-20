import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_builds_event.dart';
part 'profile_builds_state.dart';

class ProfileBuildsBloc extends Bloc<ProfileBuildsEvent, ProfileBuildsState> {
  ProfileBuildsBloc() : super(ProfileBuildsInitial());

  @override
  Stream<ProfileBuildsState> mapEventToState(
    ProfileBuildsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
