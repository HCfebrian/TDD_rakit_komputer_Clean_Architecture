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

  RecommendedBuildBloc({@required this.buildUsecase})
      : assert(BuildUsecase != null),
        super(RecommendedEmpty());

  @override
  Stream<RecommendedBuildState> mapEventToState(
    RecommendedBuildEvent event,
  ) async* {
    if (event is GetRecommendedList) {
      yield RecommendedLoading();
      print("sedang loading");
      final failureOrBuildList = await buildUsecase.getRecommendedBuild();
      print("selesai await");
      yield failureOrBuildList.fold((failure) {
        print(("sedang failure"));
        return RecommendedError(message: failure.message);
      }, (buildList) {
        print("Sedang loaded");
        return RecommendedLoaded(recommendedBuild: buildList);
      });
    }
    if (event is GetCompletedBuildList) {
      yield CompletedBuildLoading();
      final failureOrBuildList = await buildUsecase.getCompletedBuild();
      yield failureOrBuildList.fold(
          (failure) => CompletedBuildError(message: failure.message),
          (completedBuildList) =>
              CompletedBuildLoaded(completedBuild: completedBuildList));
    }
  }
}
