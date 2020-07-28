import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/core/presentation/util/password_validation.dart';
import 'package:rakit_komputer/core/presentation/util/username_validation.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ValidateEmail validateEmail;
  final ValidatePassword validatePassword;
  final ValidateUsername validateUsername;

  AuthBloc({
    @required this.validatePassword,
    @required this.registerUseCase,
    @required this.loginUseCase,
    @required this.validateEmail,
    @required this.validateUsername,
  })  : assert(registerUseCase != null),
        assert(validatePassword != null),
        assert(loginUseCase != null),
        assert(validateEmail != null),
        assert(validateUsername != null),
        super(Empty());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    String validEmail, validPassword, validUsername;

    if (event is LoginEmailPassword) {
      final email = validateEmail.validate(event.email);
      final password = validatePassword.login(event.password);

      yield* password.fold((failure) async* {
        validPassword = null;
        if (failure is InvalidPasswordFailure) {
          yield Error(
            message: failure.message,
          );
        }
      }, (password) async* {
        validPassword = password;
      });

      yield* email.fold((failure) async* {
        validEmail = null;
        if (failure is EmptyEmailFailure) {
          yield Error(
            message: failure.message,
          );
        } else if (failure is InvalidEmailFailure) {
          yield Error(
            message: failure.message,
          );
        }
      }, (email) async* {
        validEmail = email;
      });

      if (validPassword != null && validEmail != null) {
        yield Loading();
        final failureOrUserData = await loginUseCase.loginEmailAndPassword(
            email: validEmail, password: validPassword);
        yield failureOrUserData.fold(
            (failure) => Error(message: failure.message),
            (userdata) => Loaded(user: userdata));
      }
    }

    if (event is RegisterEmailPassword) {
      final email = validateEmail.validate(event.email);
      final password = validatePassword.register(
        password: event.password,
        repeatPassword: event.confirmPassword,
      );
      final username = validateUsername.validate(event.username);

      yield* password.fold((failure) async* {
        validPassword = null;
        if (failure is InvalidPasswordFailure ||
            failure is PasswordDidNotMatchFailure) {
          yield Error(
            message: failure.message,
          );
        }
      }, (password) async* {
        validPassword = password;
      });

      yield* email.fold((failure) async* {
        validUsername = null;
        if (failure is EmptyEmailFailure) {
          yield Error(
            message: failure.message,
          );
        } else if (failure is InvalidEmailFailure) {
          yield Error(
//            email: failure.email,
            message: failure.message,
          );
        }
      }, (email) async* {
        validEmail = email;
      });

      yield* username.fold((failure) async* {
        validUsername = null;
        print("username called");
        if (failure is InvalidUsernameFailure) {
          yield Error(message: failure.message);
        }
      }, (username) async* {
        validUsername = username;
      });

      if (validPassword != null &&
          validEmail != null &&
          validUsername != null) {
        print(
            "execute bos. password $validPassword email $validEmail username $validUsername");
        yield Loading();
        final failureOrUserData =
            await registerUseCase.registerEmailAndPassword(
                email: validEmail,
                password: validPassword,
                username: event.username);
        yield failureOrUserData.fold(
            (failure) => Error(message: failure.message),
            (userdata) => Loaded(user: userdata));
      }
    }

    if (event is LoginOrRegisterGoogle) {
      yield Loading();
      final failureOrUserData = await loginUseCase.loginGoogle();
      yield failureOrUserData.fold(
          (failure) => Error(message: failure.message),
          (userData) => Loaded(user: userData));
    }

    if (event is SkipAuth) {
      yield Loading();
      final failureOrSkipAuth = await loginUseCase.loginAnonymously();
      yield failureOrSkipAuth.fold(
        (failure) => Error(message: failure.message),
        (bool) => Loaded(),
      );
    }
  }
}

