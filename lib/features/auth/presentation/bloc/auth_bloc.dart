import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required this.loginEmailPassword,
    @required this.loginGoogle,
    @required this.loginFacebook,
    @required this.validateEmail,
  })  : assert(validateEmail != null),
        assert(validateEmail != null),
        super(Empty());

  final LoginEmailPassword loginEmailPassword;
  final LoginGoogle loginGoogle;
  final LoginFacebook loginFacebook;
  final ValidateEmail validateEmail;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
