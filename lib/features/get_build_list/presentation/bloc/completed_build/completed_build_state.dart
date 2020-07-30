part of 'completed_build_bloc.dart';

abstract class CompletedBuildState extends Equatable {
  const CompletedBuildState();

  @override
  List<Object> get props => [];
}

class CompletedBuildEmpty extends CompletedBuildState {}

class CompletedBuildLoading extends CompletedBuildState {}

class CompletedBuildError extends CompletedBuildState {
  final String message;

  CompletedBuildError({@required this.message});
}

class CompletedBuildLoaded extends CompletedBuildState {
  final List<BuildEntity> completedBuild;

  CompletedBuildLoaded({@required this.completedBuild});

  @override
  List<Object> get props => [completedBuild];
}
