import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/data/model/user_model.dart';

abstract class AuthRemoteDataSource{
  ///call googleSignIn method to sign in into google firebase.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<UserModel>loginGoogle();
  ///call facebookSignIn method to sign in into firebase auth.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<UserModel>loginFacebook();
  ///call signInnWithEmailAndPassword method to sign in into google firebase.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<UserModel>loginEmailAndPassword({@required String email, @required String password});

  ///call signInnWithEmailAndPassword method to sign in into google firebase.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<UserModel>registerGoogle();
  ///call signInnWithEmailAndPassword method to sign in into google firebase.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<bool>loginAnonymously();
  ///call signInnWithEmailAndPassword method to sign in into google firebase.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<UserModel>registerFacebook();
  ///call signInnWithEmailAndPassword method to sign in into google firebase.
  ///
  ///throw a [LoginErrorException] for all error codes.
  Future<UserModel>registerEmailAndPassword({@required String email,@required String userName, @required String password});

}

