import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/usecase/get_completed_build.dart';

part 'completed_build_event.dart';

part 'completed_build_state.dart';

class CompletedBuildBloc
    extends Bloc<CompletedBuildEvent, CompletedBuildState> {
  final BuildUsecase buildUsecase;

  CompletedBuildBloc({this.buildUsecase})
      : assert(buildUsecase != null),
        super(CompletedBuildEmpty());

  @override
  Stream<CompletedBuildState> mapEventToState(
    CompletedBuildEvent event,
  ) async* {
    if (event is GetInitCompletedBuildList) {
      yield CompletedBuildLoadingInit();
      final failureOrBuildList = await buildUsecase.getCompletedBuild();
      yield failureOrBuildList.fold(
          (failure) => CompletedBuildError(message: failure.message),
          (completedBuildList) =>
              CompletedBuildLoaded(completedBuild: completedBuildList));
    }
    if(event is GetMoreCompletedBuildList){
    }
  }
}
