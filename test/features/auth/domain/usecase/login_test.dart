import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';
import 'package:rakit_komputer/features/auth/domain/usecase/login.dart';

class MockFirebaseAuthRepository extends Mock
    implements AuthRepositoryAbst {}

void main() {
  LoginUseCase loginUseCase;
  MockFirebaseAuthRepository mockFirebaseAuthRepository;

  setUp(() {
    mockFirebaseAuthRepository = MockFirebaseAuthRepository();
    loginUseCase = LoginUseCase(authRepo: mockFirebaseAuthRepository);
  });

  final tUser = User(
      email: "heryan@facebook.com",
      uid: "123",
      displayName: "heryan",
      profileUrl: "google.com");

  final tEmail= "febriansyah.online@gmail.com";
  final tPassword = "ILoveYourMom";


  group("test login", (){

    test(
      "should trigger login using google auth and return User from repository",
          () async {
        //arrange
        when(mockFirebaseAuthRepository.loginGoogle())
            .thenAnswer((_) async => Right(tUser));
        //act
        final result = await loginUseCase.loginGoogle();
        //assert
        expect(result, Right(tUser));
        verify(mockFirebaseAuthRepository.loginGoogle());
        verifyNoMoreInteractions(mockFirebaseAuthRepository);
      },
    );

    test(
      "should trigger login using facebook auth and return user form repository",
          () async {
        //arrange
        when(mockFirebaseAuthRepository.loginFacebook())
            .thenAnswer((_) async => Right(tUser));
        //act
        final result = await loginUseCase.loginFacebook();
        //assert
        expect(result, Right(tUser));
        verify(mockFirebaseAuthRepository.loginFacebook());
        verifyNoMoreInteractions(mockFirebaseAuthRepository);
      },
    );

    test(
      "should send email and password and get user in return form repository",
          () async {
        //arrange
        when(mockFirebaseAuthRepository.loginEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")))
            .thenAnswer((_) async => Right(tUser));
        //act
        final result= await loginUseCase.loginEmailAndPassword(email: tEmail, password: tPassword);
        //assert
        expect(result, Right(tUser));
        verify(mockFirebaseAuthRepository.loginEmailAndPassword(email: tEmail, password: tPassword));
        verifyNoMoreInteractions(mockFirebaseAuthRepository);
      },
    );

    test(
        "should return true if login anonymously is success",
        () async {
          //arrange
          when(mockFirebaseAuthRepository.loginAnonymously()).thenAnswer((realInvocation) async => Right(true));
          //act
          final result =await loginUseCase.loginAnonymously();
          //assert
          expect(result, Right(true));
          verify(mockFirebaseAuthRepository.loginAnonymously());
          verifyNoMoreInteractions(mockFirebaseAuthRepository);
        },
      );


  });

}
