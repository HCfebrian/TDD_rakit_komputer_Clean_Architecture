import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'floating_action_button_event.dart';
part 'floating_action_button_state.dart';

class FloatingActionButtonBloc extends Bloc<FloatingActionButtonEvent, FloatingActionButtonState> {
  FloatingActionButtonBloc() : super(FABClosed());
  bool isOpened = false;

  @override
  Stream<FloatingActionButtonState> mapEventToState(
    FloatingActionButtonEvent event,
  ) async* {
    if(event is FABClick){
      if(isOpened){
        isOpened = true;
        yield FABOpened();
      }
      if(isOpened){
        isOpened = false;
        yield FABClosed();
      }
    }
  }
}
