part of 'build_part_bloc.dart';

abstract class BuildPartState extends Equatable {
  const BuildPartState();
  @override
  List<Object> get props => [];
}

class BuildPartInitial extends BuildPartState {
  
}

class BuildPartLoading extends BuildPartState{
  
}

class BuildPartLoaded extends BuildPartState{
  final List<BuildPartEntity> partList;

  BuildPartLoaded({@required this.partList});
  
}

class BuildPartError extends BuildPartState{

}


