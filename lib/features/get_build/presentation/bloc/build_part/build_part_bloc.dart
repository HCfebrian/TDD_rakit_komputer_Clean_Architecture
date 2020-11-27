import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/part_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/usecase/get_completed_build.dart';

part 'build_part_event.dart';

part 'build_part_state.dart';

class BuildPartBloc extends Bloc<BuildPartEvent, BuildPartState> {
  final BuildUsecase buildUsecase;

  BuildPartBloc({@required this.buildUsecase})
      : assert(buildUsecase != null),
        super(BuildPartInitial());

  @override
  Stream<BuildPartState> mapEventToState(
    BuildPartEvent event,
  ) async* {
    if (event is GetPartList) {
      final failureOrPartList = await buildUsecase.getComputerPart(event.buildID);
      yield failureOrPartList.fold(
              (failure) => BuildPartError(),
              (partList) => BuildPartLoaded(partList: partList));
    }
  }
}
