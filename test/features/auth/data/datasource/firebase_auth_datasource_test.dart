import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/features/auth/data/data_sources/firebase_auth_datasource_impl.dart';
import 'package:rakit_komputer/features/auth/data/model/user_model.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {
  @override

  String get displayName => "HC Febriansyah";

  @override
  String get email => "febriansyah.online@gmail.com";

  @override
  String get uid => "20021997";

  @override
  String get photoUrl =>
      "https://scontent.fsub2-3.fna.fbcdn.net/v/t31.0-8/18077144_10203215734311743_4795913670100787155_o.jpg?_nc_cat=101&_nc_sid=85a577&_nc_eui2=AeHs1sDz1509WYAAuQF1PDnXfw5AOJw6fo1_DkA4nDp-jTAWojdagRdJtKicnCVu9D8&_nc_oc=AQmj33TCZGG-XNmq1rP0CRIBcNegmM6WRMuKxuq4MxnlTGeGAROLDIalCOS5Tz8myFk&_nc_ht=scontent.fsub2-3.fna&oh=e0498544a9904155ba981cfca4dab2ea&oe=5F2DC34A";

  @override
  String get providerId => "facebook";

  @override
  String get phoneNumber => "085866349755";

  @override
  bool get isAnonymous => false;

  @override
  bool get isEmailVerified => true;
}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockAuthResult extends Mock implements AuthResult {
  @override
  final FirebaseUser user = MockFirebaseUser();
}

class MockAuthCredential extends Mock implements AuthCredential {}

class MockGoogleAuthProvider extends Mock implements GoogleAuthProvider {}

void main() {
  FirebaseAuthRemoteDataSourceImpl dataSource;
  MockFirebaseAuth _mockFirebaseAuth = MockFirebaseAuth();
  MockAuthResult _mockAuthResult = MockAuthResult();
  MockGoogleSignIn _mockGoogleSignIn;
  MockGoogleSignInAccount _mockGoogleSignInAccount;

  MockGoogleSignInAuthentication _mockGoogleSignInAuthentication;

  final tEmail = _mockAuthResult.user.email;
  final tPassword = "20021997";
  final tUsername = _mockAuthResult.user.displayName;
  setUp(() {
    _mockGoogleSignIn = MockGoogleSignIn();
    _mockGoogleSignInAccount = MockGoogleSignInAccount();
    _mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();

    dataSource = FirebaseAuthRemoteDataSourceImpl(
        firebaseAuth: _mockFirebaseAuth, googleSignIn: _mockGoogleSignIn);
  });
  group("login", () {
    test(
      "should return UserModel when signInWithEmailAndPassword is called from DataSource",
      () async {
        //arrange
        when(_mockFirebaseAuth.signInWithEmailAndPassword(
                email: anyNamed("email"), password: anyNamed("password")))
            .thenAnswer((realInvocation) async => _mockAuthResult);
        //act

        final result = await dataSource.loginEmailAndPassword(
            email: tEmail, password: tPassword);
        //assert
        verify(_mockFirebaseAuth.signInWithEmailAndPassword(
            email: tEmail, password: tPassword));
        verifyNoMoreInteractions(_mockFirebaseAuth);
        expect(result, isA<UserModel>());
      },
    );


    test(
      "should return UserModel when sign in by using google from DataSource",
      () async {
        //arrange
        when(_mockGoogleSignIn.signIn())
            .thenAnswer((realInvocation) async => _mockGoogleSignInAccount);
        when(_mockGoogleSignInAccount.authentication).thenAnswer(
            (realInvocation) async => _mockGoogleSignInAuthentication);
        when(_mockFirebaseAuth.signInWithCredential(any))
            .thenAnswer((realInvocation) async => _mockAuthResult);
        //act
        final result = await dataSource.loginGoogle();
        //assert
        verify(_mockGoogleSignIn.signIn()).called(1);
        verify(_mockGoogleSignInAccount.authentication).called(1);
        verify(_mockFirebaseAuth.signInWithCredential(any)).called(1);
        expect(result, isA<UserModel>());
      },
    );

   


  });

  group("register", () {
    test(
      "should return UserModel when register Using email password from Data source",
      () async {
        //arrange
        when(_mockFirebaseAuth.createUserWithEmailAndPassword(
                email: anyNamed("email"), password: anyNamed("password")))
            .thenAnswer((realInvocation) async => _mockAuthResult);
        //act
        final result = await dataSource.registerEmailAndPassword(
            email: tEmail, userName: tUsername, password: tPassword);
        //assert
        verify(_mockFirebaseAuth.createUserWithEmailAndPassword(
            email: tEmail, password: tPassword));
        expect(result.displayName, tUsername);
        expect(result.email, tEmail);
        expect(result, isA<UserModel>());
      },
    );

    test(
      "should return Undefine Exception when register using email password is called from data source",
      () async {
        //arrange
        when(_mockFirebaseAuth.createUserWithEmailAndPassword(
                email: anyNamed("email"), password: anyNamed("password")))
            .thenThrow(UndefinedException());
        
        //act
        final call = dataSource.registerEmailAndPassword;
        //assert
        expect(
            () => call(email: tEmail, password: tPassword, userName: tUsername),
            throwsA(TypeMatcher<UndefinedException>()));
      },
    );

    test(
      "should return EmailAlreadyExists when register using email password is called from data source",
          () async {
        //arrange
        when(_mockFirebaseAuth.createUserWithEmailAndPassword(
            email: anyNamed("email"), password: anyNamed("password")))
            .thenThrow(EmailAlreadyExistException());

        //act
        final call = dataSource.registerEmailAndPassword;
        //assert
        expect(
                () => call(email: tEmail, password: tPassword, userName: tUsername),
            throwsA(TypeMatcher<EmailAlreadyExistException>()));
      },
    );

    test(
        "should return true when login anonymously is success",
        () async {
          //arrange
          when(_mockFirebaseAuth.signInAnonymously()).thenAnswer((realInvocation) async => _mockAuthResult);
          //act
          final call = await dataSource.loginAnonymously();
          //assert
          expect(call , true );
        },
      );

    test(
        "should return Server Failure when sign in anonymously is fail",
        () async {
          //arrange
          when(_mockFirebaseAuth.signInAnonymously()).thenThrow(SomeException());
          //act
          final call = dataSource;
          //assert
          expect(() async => call.loginAnonymously(), throwsA(TypeMatcher<ServerException>()));
        },
      );
  });
}
