import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommended_build_event.dart';
part 'recommended_build_state.dart';

class RecommendedBuildBloc extends Bloc<RecommendedBuildEvent, RecommendedBuildState> {
  RecommendedBuildBloc() : super(Empty());

  @override
  Stream<RecommendedBuildState> mapEventToState(
    RecommendedBuildEvent event,
  ) async* {
  }
}
