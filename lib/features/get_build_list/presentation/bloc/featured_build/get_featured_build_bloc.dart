import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/usecase/get_completed_build.dart';

part 'get_featured_build_event.dart';
part 'get_featured_build_state.dart';

class FeaturedBuildBloc
    extends Bloc<FeaturedBuildEvent, FeaturedBuildState> {
  final BuildUsecase buildUsecase;

  FeaturedBuildBloc({@required this.buildUsecase})
      : assert(buildUsecase != null),
        super(EmptyFeatured());

  @override
  Stream<FeaturedBuildState> mapEventToState(
    FeaturedBuildEvent event,
  ) async* {
    if (event is FeaturedBuildEvent) {
      yield LoadingFeatured();
      final failureOrBuild = await buildUsecase.getFeaturedBuild();
      yield failureOrBuild.fold((failure) => ErrorFeatured(message: failure.message),
          (featuredBuild) => LoadedFeatured(featuredBuild: featuredBuild));
    }
  }
}
