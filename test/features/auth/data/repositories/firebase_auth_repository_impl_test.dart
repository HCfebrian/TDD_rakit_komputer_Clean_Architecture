import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/core/network/netword_info.dart';
import 'package:rakit_komputer/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rakit_komputer/features/auth/data/model/user_model.dart';
import 'package:rakit_komputer/features/auth/data/repository/firebase_auth_repository_impl.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  FirebaseAuthRepositoryImpl authRepo;
  MockAuthRemoteDataSource mockAuthRemoteData;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthRemoteData = MockAuthRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    authRepo = FirebaseAuthRepositoryImpl(
        authRemoteData: mockAuthRemoteData, networkInfo: mockNetworkInfo);
  });

  final tModelUser = UserModel(
      displayName: "HCFebrian",
      email: "febriansyah.online@gmail.com",
      uid: "20021997",
      profileUrl: "google.com");

  final tUser = tModelUser;
  final tEmail = "febiarnsyah.online@gmail.com";
  final tPassword = "20021997";
  final tUsername = "HCFebrian";

  group("Network online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
      "should return network status from inside repository",
      () async {
        //act
        authRepo.loginGoogle();
        //assert
        expect(await mockNetworkInfo.isConnected, true);
      },
    );

    group("Login", () {
      group("login Google", () {
        test(
          "should return user when call login google on remote auth is success",
          () async {
            //arrange
            when(mockAuthRemoteData.loginGoogle())
                .thenAnswer((realInvocation) async => tModelUser);
            //act
            final result = await authRepo.loginGoogle();
            //assert
            expect(result, equals(Right(tUser)));
          },
        );
        test(
          "should return LoginFailure when call login google on remote auth is unsuccessful",
          () async {
            //arrange
            when(mockAuthRemoteData.loginGoogle())
                .thenThrow(LoginErrorException());
            //act
            final result = await authRepo.loginGoogle();
            //assert
            verify(mockAuthRemoteData.loginGoogle());
            expect(result, equals(Left(LoginFailure())));
          },
        );
      });

      group("login Facebook", () {
        test(
          "should return user when call login facebook on remote auth is success",
          () async {
            //arrange
            when(mockAuthRemoteData.loginFacebook())
                .thenAnswer((realInvocation) async => tModelUser);
            //act
            final result = await authRepo.loginFacebook();
            //assert
            expect(result, equals(Right(tUser)));
          },
        );

        test(
          "should return LoginFailure when call login facebook on remote auth is unsuccessful",
          () async {
            //arrange
            when(mockAuthRemoteData.loginFacebook())
                .thenThrow(LoginErrorException());
            //act
            final result = await authRepo.loginFacebook();
            //assert
            expect(result, equals(Left(LoginFailure())));
          },
        );
      });

      group("login Email Password", () {
        test(
          "should return user when call login email password auth is success",
          () async {
            //arrange
            when(mockAuthRemoteData.loginEmailAndPassword(
                    email: anyNamed("email"), password: anyNamed("password")))
                .thenAnswer((realInvocation) async => tModelUser);
            //act
            final result = await authRepo.loginEmailAndPassword(
                email: tEmail, password: tPassword);
            //assert
            expect(result, equals(Right(tUser)));
            verify(mockAuthRemoteData.loginEmailAndPassword(
                email: tEmail, password: tPassword));
            verifyNoMoreInteractions(mockAuthRemoteData);
          },
        );


      });
    });

    group("register", () {
      group("Register Google", () {
        test(
          "should return User when Google Register is called from repository",
          () async {
            //arrange
            when(mockAuthRemoteData.registerGoogle())
                .thenAnswer((realInvocation) async => tModelUser);
            //act
            final result = await authRepo.registerGoogle();
            //assert
            expect(result, equals(Right(tUser)));
          },
        );

        test(
          "should return RegisterException when Google Register is called from repository",
          () async {
            //arrange
            when(mockAuthRemoteData.registerGoogle())
                .thenThrow(RegisterErrorException());
            //act
            final result = await authRepo.registerGoogle();
            //assert
            expect(result, equals(Left(RegisterFailure())));
          },
        );
      });

      group("Register Facebook", () {
        test(
          "should return User when Facebook Register is called from repository",
          () async {
            //arrange
            when(mockAuthRemoteData.registerFacebook())
                .thenAnswer((realInvocation) async => tModelUser);
            //act
            final result = await authRepo.registerFacebook();
            //assert
            expect(result, equals(Right(tUser)));
          },
        );

        test(
          "should return RegisterException when Facebook Register is called from repository",
          () async {
            //arrange
            when(mockAuthRemoteData.registerFacebook())
                .thenThrow(RegisterErrorException());
            //act
            final result = await authRepo.registerFacebook();
            //assert
            expect(result, equals(Left(RegisterFailure())));
          },
        );
      });

      group("register Email password", () {
        test(
          "should return user when Facebook register is called from repository",
          () async {
            //arrange
            when(mockAuthRemoteData.registerEmailAndPassword(
                    email: anyNamed("email"),
                    userName: anyNamed("userName"),
                    password: anyNamed("password")))
                .thenAnswer((realInvocation) async => tModelUser);
            //act
            final result = await authRepo.registerEmailAndPassword(
                email: tEmail, password: tPassword, userName: tUsername);
            //assert
            expect(result, equals(Right(tUser)));
            verify(mockAuthRemoteData.registerEmailAndPassword(
                email: tEmail, userName: tUsername, password: tPassword));
            verifyNoMoreInteractions(mockAuthRemoteData);
          },
        );

        test(
          "should return UndefiUne failure when Facebook register is called from repository",
          () async {
            //arrange
            when(mockAuthRemoteData.registerEmailAndPassword(
                    email: anyNamed("email"),
                    userName: anyNamed("userName"),
                    password: anyNamed("password")))
                .thenThrow(UndefinedException());
            //act
            final result = await authRepo.registerEmailAndPassword(
                email: tEmail, password: tPassword, userName: tUsername);
            //assert
            expect(result, equals(Left(UndefinedFailure())));
            verify(mockAuthRemoteData.registerEmailAndPassword(
                email: tEmail, userName: tUsername, password: tPassword));
            verifyNoMoreInteractions(mockAuthRemoteData);

          },
        );

        test(
            "should return failure ",
            () async {
              //arrange

              //act

              //assert
            },
          );
      });
    });
  });

  group("Network Offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
    });

    group("Login offline", () {
      test(
        "should return Network Failure from google sign in when Network info is offline",
        () async {
          //arrange
          when(mockAuthRemoteData.loginGoogle()).thenThrow(NetworkException());
          //act
          final result = await authRepo.loginGoogle();
          //assert
          expect(result, equals(Left(NetworkFailure())));
        },
      );

      test(
        "should return Network Failure from facebook sign in when Network info is offline",
        () async {
          //arrange
          when(mockAuthRemoteData.loginFacebook())
              .thenThrow(NetworkException());
          //act
          final result = await authRepo.loginFacebook();
          //assert
          expect(result, equals(Left(NetworkFailure())));
        },
      );

      test(
        "should return NetworkFailure when call login email password auth and network is offline",
        () async {
          //arrange
          when(mockAuthRemoteData.loginEmailAndPassword(
                  email: anyNamed("email"), password: anyNamed("password")))
              .thenThrow(NetworkException());
          //act
          final result = await authRepo.loginEmailAndPassword(
              email: tEmail, password: tPassword);
          //assert
          expect(result, equals(Left(NetworkFailure())));
          verifyNoMoreInteractions(mockAuthRemoteData);
        },
      );
    });

    group("Register offline", () {
      test(
        "should return Network Failure from google Register when Network info is offline",
        () async {
          //arrange
          when(mockAuthRemoteData.registerGoogle()).thenThrow(NetworkException());
          //act
          final result = await authRepo.registerGoogle();
          //assert
          expect(result, equals(Left(NetworkFailure())));
        },
      );

      test(
        "should return Network Failure from facebook Register when Network info is offline",
        () async {
          //arrange
          when(mockAuthRemoteData.registerFacebook())
              .thenThrow(NetworkException());
          //act
          final result = await authRepo.registerFacebook();
          //assert
          expect(result, equals(Left(NetworkFailure())));
        },
      );

      test(
        "should return NetworkFailure when call login email password auth and network is offline",
        () async {
          //arrange
          when(mockAuthRemoteData.registerEmailAndPassword(
                  email: anyNamed("email"), password: anyNamed("password"), userName: anyNamed("userName")))
              .thenThrow(NetworkException());
          //act
          final result = await authRepo.registerEmailAndPassword(
              email: tEmail, password: tPassword, userName: tUsername);
          //assert
          expect(result, equals(Left(NetworkFailure())));
          verifyNoMoreInteractions(mockAuthRemoteData);
        },
      );
    });
  });
}
