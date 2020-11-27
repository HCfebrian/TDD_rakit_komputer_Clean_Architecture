part of 'build_part_bloc.dart';

abstract class BuildPartEvent extends Equatable {
  const BuildPartEvent();
}

class GetPartList extends BuildPartEvent{
  final buildID;

  GetPartList({@required this.buildID});
  @override
  List<Object> get props => [buildID];

}