part of 'recommended_build_bloc.dart';

abstract class RecommendedBuildState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class RecommendedEmpty extends RecommendedBuildState {}



// home recommended  build list


class RecommendedLoading extends RecommendedBuildState{}

class RecommendedError extends RecommendedBuildState {
  final String message;

  RecommendedError({@required this.message});
}


class RecommendedLoaded extends RecommendedBuildState{
  final List<BuildEntity> recommendedBuild;

  RecommendedLoaded({@required this.recommendedBuild});

  @override
  // TODO: implement props
  List<Object> get props => [recommendedBuild];
}



// home completed build list


class CompletedBuildLoading extends RecommendedBuildState{}

class CompletedBuildError extends RecommendedBuildState {
  final String message;

  CompletedBuildError({@required this.message});

}

class CompletedBuildLoaded extends RecommendedBuildState{
  final List<BuildEntity> completedBuild;

  CompletedBuildLoaded({@required this.completedBuild});

  @override
  // TODO: implement props
  List<Object> get props => [completedBuild];

}


