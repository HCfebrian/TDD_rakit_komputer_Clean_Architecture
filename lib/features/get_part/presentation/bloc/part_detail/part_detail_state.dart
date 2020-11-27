part of 'part_detail_bloc.dart';

abstract class PartDetailState extends Equatable {
  const PartDetailState();
  @override
  List<Object> get props => [];
}

class PartDetailInitial extends PartDetailState {
}

class PartDetailLoading extends PartDetailState{
  
}

class PartDetailCPULoaded extends PartDetailState{
  final CPUEntity cpu;

  PartDetailCPULoaded({@required this.cpu});
}

class PartDetailGPULoaded extends PartDetailState{
  final GraphicCardEntity gpu;

  PartDetailGPULoaded({@required this.gpu}); 
  
}

class PartDetailMemoryLoaded extends PartDetailState{
  final MemoryEntity memory;

  PartDetailMemoryLoaded({@required this.memory});
}

class PartDetailError extends PartDetailState{

}
