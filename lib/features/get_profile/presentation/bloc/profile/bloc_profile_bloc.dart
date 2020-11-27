import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_profile/domain/usecase/profile_usecase.dart';

part 'bloc_profile_event.dart';

part 'bloc_profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase profileUsecase;

  ProfileBloc({@required this.profileUsecase}) : super(ProfileLogOutState());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfileEvent) {
      yield ProfileLoadingState();
      final profileOrFailure = await profileUsecase.getUser();
      yield profileOrFailure.fold(
        (fail) => ProfileLogOutState(),
        (user) => ProfileLogInState(
          profileUrl: user.profileUrl,
          name: user.displayName,
          id: user.uid,
        ),
      );
    }
  }
}
