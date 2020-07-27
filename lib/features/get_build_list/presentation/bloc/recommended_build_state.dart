part of 'recommended_build_bloc.dart';

abstract class RecommendedBuildState extends Equatable {
  const RecommendedBuildState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends RecommendedBuildState {}

class Loading extends RecommendedBuildState{}

class Loaded extends RecommendedBuildState{
  final List<BuildEntity> recommendedBuild;

  Loaded({@required this.recommendedBuild});

  @override
  // TODO: implement props
  List<Object> get props => [recommendedBuild];
}

class Error extends RecommendedBuildState{
  final String message;
  Error({@required this.message});
}


