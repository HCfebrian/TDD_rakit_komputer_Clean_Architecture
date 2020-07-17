import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';

part 'auth_event.dart';

part 'auth_state.dart';

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
    switch (event.runtimeType) {
      case LoginEmailPassword:
        final loginEvent = event as LoginEmailPassword;
        final email = validateEmail.validate(loginEvent.email);
        yield* email.fold((failure) async* {
          if (failure is EmptyInputFailure) {
            yield Error(
              email: "",
              message: _mapFailureTpMessage(failure),
            );
          } else if (failure is InvalidInputFailure) {
            yield Error(
              email: failure.email,
              message: _mapFailureTpMessage(failure),
            );
          }
        }, (email) async* {
          yield Loading();
          final failureOrUserData = await loginUseCase.loginEmailAndPassword(
              email: loginEvent.email, password: loginEvent.password);
          yield failureOrUserData.fold(
            (failure) => Error(message: _mapFailureTpMessage(failure)),
            (userData) => Loaded(user: userData),
          );
        });
        break;
      case RegisterEmailPassword:
        final registerEvent = event as RegisterEmailPassword;
        final email = validateEmail.validate(registerEvent.email);
        print(
          "email validation" + email.toString(),
        );
        yield* email.fold(
          (invalidEmail) async* {
            yield Error(
              message: _mapFailureTpMessage(invalidEmail),
            );
          },
          (validEmail) async* {
            print("valid");
            yield Loading();
            if (registerEvent.password != (registerEvent.confirmPassword)) {
              print("not match");
              yield Error(message: PASSWORD_DID_NOT_MATCH);
            } else {
              final failureOrUserData =
                  await registerUseCase.registerEmailAndPassword(
                      username: registerEvent.username,
                      email: registerEvent.email,
                      password: registerEvent.password);
              print(failureOrUserData);
              yield failureOrUserData.fold(
                (failure) => Error(
                  message: _mapFailureTpMessage(failure),
                ),
                (userData) => Loaded(user: userData),
              );
            }
          },
        );
        break;

      case LoginOrRegisterGoogle:
        yield Loading();
        final failureOrUserData = await loginUseCase.loginGoogle();
        yield failureOrUserData.fold(
            (failure) => Error(message: _mapFailureTpMessage(failure)),
            (userData) => Loaded(user: userData));
    }
  }
}

String _mapFailureTpMessage(Failure failure) {
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
    case RegisterFailure:
      return REGISTER_FAILURE_MESSAGE;
    case EmailAlreadyExistFailure:
      return Email_ALREADY_EXSIST_MESSAGE;
    default:
      print(failure);
      print(UNEXPECTED_ERROR);
      return UNEXPECTED_ERROR;
  }
}
