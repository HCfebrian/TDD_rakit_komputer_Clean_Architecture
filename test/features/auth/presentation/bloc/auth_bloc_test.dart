import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:meta/meta.dart';

class MockLoginUsecase extends Mock implements LoginUseCase {}

class MockRegisterUsecase extends Mock implements RegisterUseCase {}

class MockValidateEmail extends Mock implements ValidateEmail {}

void main() {
  AuthBloc bloc;
  MockLoginUsecase mockLoginUsecase;
  MockRegisterUsecase mockRegisterUsecase;
  MockValidateEmail mockValidateEmail;

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    mockLoginUsecase = MockLoginUsecase();
    mockValidateEmail = MockValidateEmail();
    bloc = AuthBloc(
        loginUseCase: mockLoginUsecase,
        registerUseCase: mockRegisterUsecase,
        validateEmail: mockValidateEmail);
  });

  final tEmail = "febriansyah.online@gmail.com";
  final tInvalidEmail = "febriansyah.ogmail.com";
  final tPassword = "20021997";
  final tUid = "20021997";
  final tUrl = "facebook.com";
  final tUsername = "HcFebrian";
  final tUser = User(
    email: tEmail,
    uid: tUid,
    profileUrl: tUrl,
    displayName: tUsername,
  );

  void setUpValidateEmail({@required Either<Failure, String> toReturn}) {
    when(mockValidateEmail.validate(any)).thenReturn(toReturn);
  }

  void setLoginEmailUseCase({@required Either<Failure, User> toAnswer}) {
    when(mockLoginUsecase.loginEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")))
        .thenAnswer((realInvocation) async => toAnswer);
  }

  void setRegisterEmailUseCase({@required Either<Failure, User> toAnswer}) {
    when(mockRegisterUsecase.registerEmailAndPassword(
            username: anyNamed("username"),
            email: anyNamed("email"),
            password: anyNamed("password")))
        .thenAnswer((realInvocation) async => toAnswer);
  }

  group("login email ", () {
    test(
      "should call validate email correctly",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setLoginEmailUseCase(toAnswer: Right(tUser));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        await untilCalled(mockValidateEmail.validate(any));
        //assert
        verify(mockValidateEmail.validate(tEmail));
      },
    );
    test(
      "should emit error Invalid email state when input is invalid",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Left(InvalidInputFailure(email: tInvalidEmail)));
        //assert later
        final expected = [
          Empty(),
          Error(message: INVALID_EMAIL_MESSAGE, email: tInvalidEmail),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
      },
    );

    test(
      "should emit error Empty email state when input is invalid",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Left(EmptyInputFailure("")));
        //assert later
        final expected = [
          Empty(),
          Error(message: EMPTY_FIELD_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
      },
    );

    test(
      "should deliver data from event to use case ",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setLoginEmailUseCase(toAnswer: Right(tUser));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        await untilCalled(mockLoginUsecase.loginEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")));

        //assert
        verify(mockLoginUsecase.loginEmailAndPassword(
            email: tEmail, password: tPassword));
      },
    );

    test(
      "should emit [Loading, Loaded] when data is gotten successfully",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setLoginEmailUseCase(toAnswer: Right(tUser));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Loaded(user: tUser),
        ];
        expectLater(bloc, emitsInOrder(expected));

        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        await untilCalled(mockLoginUsecase.loginEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")));
      },
    );

    test(
      "should emit [Loading, Error] when login failure is happen",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setLoginEmailUseCase(toAnswer: Left(LoginFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: LOGIN_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));

        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        await untilCalled(mockLoginUsecase.loginEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")));
      },
    );

    test(
      "should emit [Loading, Error] when network failure is happen",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setLoginEmailUseCase(toAnswer: Left(NetworkFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: NETWORK_FAILURE_MESSAGE),
        ];

        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        await untilCalled(mockLoginUsecase.loginEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")));
      },
    );
  });

  group("register email ", () {
    test(
      "should call validate email correctly",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setRegisterEmailUseCase(toAnswer: Right(tUser));
        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail, password: tPassword, username: tUsername, confirmPassword: tPassword));
        await untilCalled(mockValidateEmail.validate(any));
        //assert
        verify(mockValidateEmail.validate(tEmail));
      },
    );
    test(
      "should emit error Invalid email and return state when input is invalid",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Left(InvalidInputFailure(email: tInvalidEmail)));
        //assert later
        final expected = [
          Empty(),
          Error(message: INVALID_EMAIL_MESSAGE, email: tInvalidEmail),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(RegisterEmailPassword(
            email: tInvalidEmail, password: tPassword, username: tUsername, confirmPassword: tPassword));
      },
    );

    test(
      "should emit error Empty email state when input is invalid",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Left(EmptyInputFailure("")));
        //assert later
        final expected = [
          Empty(),
          Error(message: EMPTY_FIELD_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
      },
    );

    test(
      "should deliver data from event to use case ",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setRegisterEmailUseCase(toAnswer: Right(tUser));
        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail, password: tPassword, username: tUsername, confirmPassword: tPassword));
        await untilCalled(mockRegisterUsecase.registerEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
            username: anyNamed("username")));

        //assert
        verify(mockRegisterUsecase.registerEmailAndPassword(
            email: tEmail, password: tPassword, username: tUsername));
      },
    );

    test(
      "should emit [Loading, Loaded] when data is gotten successfully",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setRegisterEmailUseCase(toAnswer: Right(tUser));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Loaded(user: tUser),
        ];
        expectLater(bloc, emitsInOrder(expected));

        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail, password: tPassword, username: tUsername, confirmPassword: tPassword));
        await untilCalled(mockRegisterUsecase.registerEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
            username: anyNamed("username")));
      },
    );

    test(
      "should emit [Loading, Error] when login failure is happen",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        when(mockRegisterUsecase.registerEmailAndPassword(
            username: anyNamed("username"),
            email: anyNamed("email"),
            password: anyNamed("password")))
            .thenAnswer((realInvocation) async => Left(LoginFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: LOGIN_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));

        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail, password: tPassword, username: tUsername, confirmPassword: tPassword));
        await untilCalled(mockRegisterUsecase.registerEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
            username: anyNamed("username")));
      },
    );

    test(
      "should emit [Loading, Error] when network failure is happen",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setRegisterEmailUseCase(toAnswer: Left(NetworkFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: NETWORK_FAILURE_MESSAGE),
        ];

        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(RegisterEmailPassword(email: tEmail, password: tPassword, username: tUsername, confirmPassword: tPassword));
        await untilCalled(mockRegisterUsecase.registerEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password"), username: anyNamed("username")));
      },
    );
  });

  group("login / register google ", () {
    test(
      "should emit [Loading, Loaded] when user data is gotten successfully",
      () async {
        //arrange
        when(mockLoginUsecase.loginGoogle())
            .thenAnswer((realInvocation) async => Right(tUser));

        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Loaded(user: tUser),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginOrRegisterGoogle());
      },
    );

    test(
      "should emit [Loading, Error] when login failure is happen",
      () async {
        //arrange
        when(mockLoginUsecase.loginGoogle())
            .thenAnswer((realInvocation) async => Left(LoginFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: LOGIN_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginOrRegisterGoogle());
      },
    );

    test(
      "should emit [Loading, Error] when network failure is happen",
      () async {
        //arrange
        when(mockLoginUsecase.loginGoogle())
            .thenAnswer((realInvocation) async => Left(NetworkFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: NETWORK_FAILURE_MESSAGE),
        ];

        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginOrRegisterGoogle());
      },
    );
  });
}
