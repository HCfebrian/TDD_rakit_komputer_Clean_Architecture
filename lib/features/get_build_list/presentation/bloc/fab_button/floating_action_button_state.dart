part of 'floating_action_button_bloc.dart';

abstract class FloatingActionButtonState extends Equatable {
  const FloatingActionButtonState();
  @override
  List<Object> get props => [];
}

class FABClosed extends FloatingActionButtonState {

}

class FABOpened extends FloatingActionButtonState {

}
