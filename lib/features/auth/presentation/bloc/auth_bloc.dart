import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';

part 'auth_event.dart';

part 'auth_state.dart';

const String LOGIN_FAILURE_MESSAGE = "LOGIN FAILURE";
const String NETWORK_FAILURE_MESSAGE = "NETWORK FAILURE";
const String REGISTER_FAILURE_MESSAGE = "REGISTER FAILURE";
const String INVALID_EMAIL_MESSAGE =
    "Invalid Email - please input email format";
const String EMPTY_FIELD_MESSAGE = "Empty Field - field cannot be empty";
const String UNEXPECTED_ERROR = "UNEXPECTED ERROR";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ValidateEmail validateEmail;

  AuthBloc({
    @required this.registerUseCase,
    @required this.loginUseCase,
    @required this.validateEmail,
  })  : assert(registerUseCase != null),
        assert(loginUseCase != null),
        assert(validateEmail != null),
        super(Empty());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEmailPassword) {
      final inputEither = validateEmail.validate(event.email);
      yield* inputEither.fold((failure) async* {
        yield Error(message: _mapFailureTpMessage(failure));
      }, (email) async* {
        yield Loading();
        final failureOrUserData = await loginUseCase.loginEmailAndPassword(
            email: event.email, password: event.password);
        yield failureOrUserData.fold(
            (failure) => Error(message: _mapFailureTpMessage(failure)),
            (userData) => Loaded(user: userData));
      });
    } else if (event is RegisterEmailPassword) {
      final inputEither = validateEmail.validate(event.email);
      yield* inputEither.fold((failure) async* {
        yield Error(
          message: _mapFailureTpMessage(failure),
        );
      }, (email) async* {
        yield Loading();
        final failureOrUserData =
            await registerUseCase.registerEmailAndPassword(
                username: event.username,
                email: event.email,
                password: event.password);
        failureOrUserData.fold((l) => null, (userData) => Loaded(user: userData));
      });
    } else if (event is LoginOrRegisterGoogle) {
      yield Loading();
      final failureOrUserData = await loginUseCase.loginGoogle();
      yield failureOrUserData.fold(
          (failure) => Error(message: _mapFailureTpMessage(failure)),
          (userData) => Loaded(user: userData));
    }
  }
}

String _mapFailureTpMessage(Failure failure) {
//  print(failure.runtimeType);
  switch (failure.runtimeType) {
    case NetworkFailure:
      print(NETWORK_FAILURE_MESSAGE);
      return NETWORK_FAILURE_MESSAGE;
    case LoginFailure:
      print(LOGIN_FAILURE_MESSAGE);
      return LOGIN_FAILURE_MESSAGE;
    case EmptyInputFailure:
      print(EMPTY_FIELD_MESSAGE);
      return EMPTY_FIELD_MESSAGE;
    case InvalidInputFailure:
      print(INVALID_EMAIL_MESSAGE);
      return INVALID_EMAIL_MESSAGE;
    default:
      print(UNEXPECTED_ERROR);
      return UNEXPECTED_ERROR;
  }
}
