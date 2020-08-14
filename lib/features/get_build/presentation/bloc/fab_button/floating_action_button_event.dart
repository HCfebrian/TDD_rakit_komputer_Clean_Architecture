part of 'floating_action_button_bloc.dart';

abstract class FloatingActionButtonEvent extends Equatable {
  const FloatingActionButtonEvent();

  @override
  List<Object> get props => [];
}

class FABClick extends FloatingActionButtonEvent{}
