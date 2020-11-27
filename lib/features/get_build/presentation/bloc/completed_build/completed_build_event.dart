part of 'completed_build_bloc.dart';

abstract class CompletedBuildEvent extends Equatable {
  const CompletedBuildEvent();
  @override
  List<Object> get props => [];
}


class GetInitCompletedBuildList extends CompletedBuildEvent{}
class GetMoreCompletedBuildList extends CompletedBuildEvent{
  final int startFrom;

  GetMoreCompletedBuildList({@required this.startFrom});

  @override
  List<Object> get props => [startFrom];
}
