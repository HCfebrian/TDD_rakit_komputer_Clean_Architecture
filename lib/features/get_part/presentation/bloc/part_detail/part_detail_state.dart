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

class CPULoaded extends PartDetailState{
  final CPUEntity cpu;

  CPULoaded({@required this.cpu});
}

class GPULoaded extends PartDetailState{
  final GraphicCardEntity gpu;

  GPULoaded({@required this.gpu}); 
  
}

class MemoryLoaded extends PartDetailState{
  final MemoryEntity memory;

  MemoryLoaded({@required this.memory});
}

class PartDetailError extends PartDetailState{

}
