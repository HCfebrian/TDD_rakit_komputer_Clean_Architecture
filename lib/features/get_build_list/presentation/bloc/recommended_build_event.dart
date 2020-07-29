part of 'recommended_build_bloc.dart';

abstract class RecommendedBuildEvent extends Equatable {
@override
  // TODO: implement props
  List<Object> get props => [];
}

class GetRecommendedList extends RecommendedBuildEvent{}

class GetCompletedBuildList extends RecommendedBuildEvent{}
