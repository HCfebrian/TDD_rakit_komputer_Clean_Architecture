import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/register.dart';

class MockFirebaseAuthRepository extends Mock implements AuthRepository {}

void main() {
  MockFirebaseAuthRepository mockFirebaseAuthRepository;
  RegisterUseCase registerUseCase;

  setUp(() {
    mockFirebaseAuthRepository = MockFirebaseAuthRepository();
    registerUseCase =
        RegisterUseCase(firebaseAuthRepository: mockFirebaseAuthRepository);
  });

  final tUser = User(
      email: "febriansyah.online@gmail.com",
      displayName: "hcfebrian",
      uid: "20021997");
  final tEmail = "febrainsyah.online@gmail.com";
  final tUsername = "HCfebrian";
  final tPassword = "20021997";
  test(
    "should register user using username email password and get user form repository",
    () async {
      //arrange
      when(mockFirebaseAuthRepository.registerEmailAndPassword(
              email: anyNamed("email"),
              userName: anyNamed("userName"),
              password: anyNamed("password")))
          .thenAnswer((realInvocation) async => Right(tUser));
      //act
      final result = await registerUseCase.registerEmailAndPassword(
          username: tUsername, email: tEmail, password: tPassword);
      //assert
      expect(result, Right(tUser));
      verify(mockFirebaseAuthRepository.registerEmailAndPassword(
          email: tEmail, userName: tUsername, password: tPassword));
    },
  );

  test(
    "should register using google auth and return User form Repository",
    () async {
      //arrange
      when(mockFirebaseAuthRepository.registerGoogle())
          .thenAnswer((realInvocation) async => Right(tUser));
      //act
      final result = await registerUseCase.registerGoogle();
      //assert
      expect(result, Right(tUser));
      verify(mockFirebaseAuthRepository.registerGoogle());
      verifyNoMoreInteractions(mockFirebaseAuthRepository);
    },
  );

  test(
    "should register using Facebook auth and return User form Repository",
    () async {
      //arrange
      when(mockFirebaseAuthRepository.registerFacebook())
          .thenAnswer((realInvocation) async => Right(tUser));
      //act
      final result = await registerUseCase.registerFacebook();
      //assert
      expect(result, Right(tUser));
      verify(mockFirebaseAuthRepository.registerFacebook());
      verifyNoMoreInteractions(mockFirebaseAuthRepository);
    },
  );

  test(
    "should return Email [Already exist failure] when exception happen in data layer",
    () async {
      //arrange
      when(mockFirebaseAuthRepository.registerEmailAndPassword(
              email: anyNamed("email"),
              userName: anyNamed("userName"),
              password: anyNamed("password")))
          .thenAnswer((realInvocation) async => Left(EmailAlreadyExistFailure()));
      //act
      final result = await registerUseCase.registerEmailAndPassword(username: tUsername, email: tEmail, password: tPassword);
      //assert
      expect(result, Left(EmailAlreadyExistFailure()));
    },
  );
}
