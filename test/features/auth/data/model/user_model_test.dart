
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rakit_komputer/features/auth/data/model/user_model.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';


class MockFirebaseUser extends Mock implements FirebaseUser {
  @override
  // TODO: implement displayName
  String get displayName => "HC Febriansyah";
  @override
  // TODO: implement email
  String get email => "febriansyah.online@gmail.com";
  @override
  // TODO: implement uid
  String get uid => "20021997";
  @override
  // TODO: implement photoUrl
  String get photoUrl => "https://scontent.fsub2-3.fna.fbcdn.net/v/t31.0-8/18077144_10203215734311743_4795913670100787155_o.jpg?_nc_cat=101&_nc_sid=85a577&_nc_eui2=AeHs1sDz1509WYAAuQF1PDnXfw5AOJw6fo1_DkA4nDp-jTAWojdagRdJtKicnCVu9D8&_nc_oc=AQmj33TCZGG-XNmq1rP0CRIBcNegmM6WRMuKxuq4MxnlTGeGAROLDIalCOS5Tz8myFk&_nc_ht=scontent.fsub2-3.fna&oh=e0498544a9904155ba981cfca4dab2ea&oe=5F2DC34A";
  @override
  // TODO: implement providerId
  String get providerId => "facebook";
  @override
  // TODO: implement phoneNumber
  String get phoneNumber => "085866349755";
  @override
  // TODO: implement isAnonymous
  bool get isAnonymous => false;
  @override
  // TODO: implement isEmailVerified
  bool get isEmailVerified => true;
}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockAuthResult extends Mock implements AuthResult {}

void main() {
  MockFirebaseUser _mockUser = MockFirebaseUser();


  final tUserModel = UserModel(
      email: "febrainsyah.online@gmail.com",
      uid: "20021997",
      displayName: "HCFebrian",
      profileUrl: "google.com");


  group("test model conversion", (){
  test(
    "should be a subclass of User entity",
    () async {
      //assert
      expect(tUserModel, isA<User>());
    },
  );
    test(
        "should return user after converting from FirebaseUser",
        () async {
          //act
          final result = UserModel.fromFirebaseUser(_mockUser);
          //assert
          expect(result, isA<User>());
        },
      );
  });
}
