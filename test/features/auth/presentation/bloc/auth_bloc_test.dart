import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/presentation/util/email_validation.dart';
import 'package:rakit_komputer/core/presentation/util/password_validation.dart';
import 'package:rakit_komputer/core/presentation/util/username_validation.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';
import 'package:rakit_komputer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:meta/meta.dart';

class MockLoginUsecase extends Mock implements LoginUseCase {}

class MockRegisterUsecase extends Mock implements RegisterUseCase {}

class MockValidateEmail extends Mock implements ValidateEmail {}

class MockValidatePassword extends Mock implements ValidatePassword {}

class MockValidateUsername extends Mock implements ValidateUsername {}

void main() {
  AuthBloc bloc;
  MockLoginUsecase mockLoginUsecase;
  MockRegisterUsecase mockRegisterUsecase;
  MockValidateEmail mockValidateEmail;
  MockValidatePassword mockValidatePassword;
  MockValidateUsername mockValidateUsername;

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    mockLoginUsecase = MockLoginUsecase();
    mockValidateEmail = MockValidateEmail();
    mockValidatePassword = MockValidatePassword();
    mockValidateUsername = MockValidateUsername();
    bloc = AuthBloc(
        loginUseCase: mockLoginUsecase,
        registerUseCase: mockRegisterUsecase,
        validateEmail: mockValidateEmail,
        validatePassword: mockValidatePassword,
        validateUsername: mockValidateUsername);
  });

  final tEmail = "febriansyah.online@gmail.com";
  final tInvalidEmail = "febriansyah.ogmail.com";
  final tPassword = "20021997";
  final tPasswordConfirm = "20021997";
  final tInvalidPassword = "20021";
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

  void setUpValidatePasswordLogin(
      {@required Either<Failure, String> toReturn}) {
    when(mockValidatePassword.login(any)).thenReturn(toReturn);
  }

  void setUpValidatePasswordRegister(
      {@required Either<Failure, String> toReturn}) {
    when(mockValidatePassword.register(
            password: anyNamed("password"),
            repeatPassword: anyNamed("repeatPassword")))
        .thenReturn(toReturn);
  }

  void setUpValidateUsername({@required Either<Failure, String> toReturn}) {
    when(mockValidateUsername.validate(any)).thenReturn(toReturn);
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
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
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
        setUpValidateEmail(
            toReturn: Left(InvalidEmailFailure(email: tInvalidEmail)));
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
        //assert later
        final expected = [
          Empty(),
          Error(
            message: INVALID_EMAIL_MESSAGE,
//            email: tInvalidEmail,
          ),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        verifyZeroInteractions(MockLoginUsecase());
      },
    );

    test(
      "should emit error Empty email state when invalid email is given",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Left(EmptyEmailFailure("")));
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
        //assert later
        final expected = [
          Empty(),
          Error(message: EMPTY_EMAIL_FIELD_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tPassword));
        verifyZeroInteractions(MockLoginUsecase());
      },
    );

    test(
      "should emit error [InvalidPasswordFailure] when Invalid Password is given",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setUpValidatePasswordLogin(toReturn: Left(InvalidPasswordFailure()));
        //assert latter
        final expected = [
          Empty(),
          Error(message: INVALID_PASSWORD_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(LoginEmailPassword(email: tEmail, password: tInvalidPassword));
        verifyZeroInteractions(MockLoginUsecase());
      },
    );

    test(
      "should deliver data from event to use case ",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setLoginEmailUseCase(toAnswer: Right(tUser));
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
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
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
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
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
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
        setUpValidatePasswordLogin(toReturn: Right(tPassword));
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
        setUpValidateUsername(toReturn: Right(tUsername));
        setUpValidatePasswordRegister(toReturn: Right(tUsername));
        setRegisterEmailUseCase(toAnswer: Right(tUser));
        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPassword));
        await untilCalled(mockValidateEmail.validate(any));
        //assert
        verify(mockValidateEmail.validate(tEmail));
      },
    );
    test(
      "should emit error Invalid email and return state when invalid email is given",
      () async {
        //arrange
        setUpValidateEmail(
            toReturn: Left(InvalidEmailFailure(email: tInvalidEmail)));
        setUpValidateUsername(toReturn: Right(tUsername));
        setUpValidatePasswordRegister(toReturn: Right(tPassword));

        //assert later
        final expected = [
          Empty(),
          Error(
            message: INVALID_EMAIL_MESSAGE,
//            email: tInvalidEmail,
          ),
        ];
        expectLater(bloc, emitsInOrder(expected));
        verifyZeroInteractions(mockRegisterUsecase);
        //act
        bloc.add(RegisterEmailPassword(
            email: tInvalidEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPassword));
      },
    );

    test(
      "should emit error Empty email state when input is invalid",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Left(EmptyEmailFailure("")));
        setUpValidateUsername(toReturn: Right(tUsername));
        setUpValidatePasswordRegister(toReturn: Right(tPassword));
        //assert later
        final expected = [
          Empty(),
          Error(message: EMPTY_EMAIL_FIELD_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPasswordConfirm));
      },
    );

    test(
      "should deliver data from event to use case ",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setUpValidatePasswordRegister(toReturn: Right(tPassword));
        setUpValidateUsername(toReturn: Right(tUsername));
        setRegisterEmailUseCase(toAnswer: Right(tUser));
        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPasswordConfirm));
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
        setUpValidateUsername(toReturn: Right(tUsername));
        setUpValidatePasswordRegister(toReturn: Right(tPassword));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Loaded(user: tUser),
        ];
        expectLater(bloc, emitsInOrder(expected));

        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPassword));
        await untilCalled(mockRegisterUsecase.registerEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
            username: anyNamed("username")));
      },
    );

    test(
      "should emit [Loading, Error] when register failure is happen",
      () async {
        //arrange
        setUpValidateEmail(toReturn: Right(tEmail));
        setRegisterEmailUseCase(toAnswer: Left(RegisterFailure()));
        setUpValidateUsername(toReturn: Right(tUsername));
        setUpValidatePasswordRegister(toReturn: Right(tPassword));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: REGISTER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));

        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPassword));
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
        setUpValidatePasswordRegister(toReturn: Right(tPassword));
        setUpValidateUsername(toReturn: Right(tUsername));
        setRegisterEmailUseCase(toAnswer: Left(NetworkFailure()));
        //assert latter
        final expected = [
          Empty(),
          Loading(),
          Error(message: NETWORK_FAILURE_MESSAGE),
        ];

        expectLater(bloc, emitsInOrder(expected));
        //act
        bloc.add(RegisterEmailPassword(
            email: tEmail,
            password: tPassword,
            username: tUsername,
            confirmPassword: tPassword));
        await untilCalled(mockRegisterUsecase.registerEmailAndPassword(
            email: anyNamed("email"),
            password: anyNamed("password"),
            username: anyNamed("username")));
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
