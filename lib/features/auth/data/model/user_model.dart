import 'package:firebase_auth/firebase_auth.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:meta/meta.dart';

class UserModel extends User {
  UserModel({
    @required String email,
    @required String uid,
    @required String displayName,
    @required String profileUrl,
  }) : super(
            email: email,
            uid: uid,
            displayName: displayName,
            profileUrl: profileUrl);

  factory UserModel.fromFirebaseUser(FirebaseUser firebaseUser){
    return UserModel(
      email: firebaseUser.email,
      uid: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      profileUrl: firebaseUser.photoUrl
    );
  }
}
