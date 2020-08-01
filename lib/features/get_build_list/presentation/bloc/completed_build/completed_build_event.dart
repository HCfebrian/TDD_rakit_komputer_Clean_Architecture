part of 'completed_build_bloc.dart';

abstract class CompletedBuildEvent extends Equatable {
  const CompletedBuildEvent();
  @override
  List<Object> get props => [];
}


class GetCompletedBuildList extends CompletedBuildEvent{

}
