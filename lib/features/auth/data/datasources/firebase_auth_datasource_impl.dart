

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakit_komputer/core/error/excaption_handler.dart';
import 'package:rakit_komputer/core/error/exception.dart';
import 'package:rakit_komputer/core/values/constant.dart';
import 'package:rakit_komputer/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rakit_komputer/features/auth/data/model/user_model.dart';

class FirebaseAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  FirebaseAuth firebaseAuth;
  FirebaseUser firebaseUser;
  AuthResult authResult;
  GoogleSignIn googleSignIn;

  FirebaseAuthRemoteDataSourceImpl(
      {@required this.firebaseAuth, @required this.googleSignIn});

  Future<UserModel> loginOrRegisterUsingGoogle() async {
    try {
      GoogleSignInAccount _signInAccount;
      _signInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication _signInAuth =
          await _signInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _signInAuth.idToken, accessToken: _signInAuth.accessToken);
      firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
      return UserModel.fromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
      throw LoginErrorException();
    }
  }

  @override
  Future<UserModel> loginEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser = authResult.user;
      return UserModel.fromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e);
      throw LoginErrorException();
    }
  }

  @override
  Future<UserModel> registerEmailAndPassword(
      {@required String email,
      @required String userName,
      @required String password}) async {
    try {
      authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser = authResult.user;
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = userName;
      firebaseUser.updateProfile(updateInfo);
      return UserModel.fromFirebaseUser(firebaseUser);
    } catch (e) {
      throw FirebaseAuthException.handle(e);
    }
  }

  @override
  Future<UserModel> loginFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginGoogle() async {
    return loginOrRegisterUsingGoogle();
  }

  @override
  Future<UserModel> registerGoogle() {
    return loginOrRegisterUsingGoogle();
  }
}

