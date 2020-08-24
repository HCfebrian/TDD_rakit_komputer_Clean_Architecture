import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/cpu.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/graphic_card.dart';
import 'package:rakit_komputer/features/get_part/domain/entity/memory.dart';
import 'package:rakit_komputer/features/get_part/domain/usecase/get_component_part.dart';

part 'part_detail_event.dart';

part 'part_detail_state.dart';

class PartDetailBloc extends Bloc<PartDetailEvent, PartDetailState> {
  final PartUsecase usecase;

  PartDetailBloc({@required this.usecase})
      : assert(usecase != null),
        super(PartDetailInitial());

  @override
  Stream<PartDetailState> mapEventToState(
    PartDetailEvent event,
  ) async* {
    if(event is GetPartEvent){
      switch(event.partType){
        case "gpu":
          final failureOrData = await usecase.getGraphicCard(event.partID);
          yield failureOrData.fold((failure) => PartDetailError(), (partData) => GPULoaded(gpu: partData));
          break;
        case "cpu":
          final failureOrData = await usecase.getCPU(event.partID);
          yield failureOrData.fold((failure) => PartDetailError(), (partData) => CPULoaded(cpu: partData));
          break;
        case "memory":
          final failureOrData = await usecase.getMemory(event.partID);
          yield failureOrData.fold((failure) => PartDetailError(), (partData) => MemoryLoaded(memory: partData));
          break;
      }
    }
  }
}
