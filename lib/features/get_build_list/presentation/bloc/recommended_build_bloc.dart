import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/usecase/get_completed_build.dart';

part 'recommended_build_event.dart';

part 'recommended_build_state.dart';

class RecommendedBuildBloc
    extends Bloc<RecommendedBuildEvent, RecommendedBuildState> {
  final BuildUsecase buildUsecase;

  RecommendedBuildBloc({this.buildUsecase})
      : assert(BuildUsecase != null),
        super(Empty());

  @override
  Stream<RecommendedBuildState> mapEventToState(
    RecommendedBuildEvent event,
  ) async* {
    if (event is GetRecommendedList) {
      yield Loading();
      final failureOrBuildList = await buildUsecase.getRecommendedBuild();
      yield failureOrBuildList.fold(
          (failure) => Error(message: failure.message),
          (buildList) => Loaded(recommendedBuild: buildList));

    }
  }
}
