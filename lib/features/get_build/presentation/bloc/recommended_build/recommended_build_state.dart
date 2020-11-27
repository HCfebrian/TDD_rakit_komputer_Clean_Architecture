part of 'recommended_build_bloc.dart';

abstract class RecommendedBuildState extends Equatable {
  @override
  List<Object> get props => [];
}
class RecommendedEmpty extends RecommendedBuildState {}

class RecommendedLoading extends RecommendedBuildState{}

class RecommendedError extends RecommendedBuildState {
  final String message;

  RecommendedError({@required this.message});
}


class RecommendedLoaded extends RecommendedBuildState{
  final List<BuildEntity> recommendedBuild;
  final BuildEntity featuredBuild;
  RecommendedLoaded( {@required this.recommendedBuild,this.featuredBuild,});

  @override
  List<Object> get props => [recommendedBuild, featuredBuild];
}





