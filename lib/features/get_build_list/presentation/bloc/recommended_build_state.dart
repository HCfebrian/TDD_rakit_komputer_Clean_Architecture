part of 'recommended_build_bloc.dart';

abstract class RecommendedBuildState extends Equatable {
  const RecommendedBuildState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends RecommendedBuildState {}

class Loading extends RecommendedBuildBloc{}

class Loaded extends RecommendedBuildBloc{}

class Error extends RecommendedBuildBloc{}


