import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rakit_komputer/features/auth/data/model/user_model.dart';

class FirebaseAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  AuthResult authResult;

  @override
  Future<UserModel> loginEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
      authResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser = authResult.user;
    return UserModel.fromFirebaseUser(firebaseUser);
  }

  @override
  Future<UserModel> loginFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginGoogle() {
    // TODO: implement loginGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerEmailAndPassword(
      {@required String email,
      @required String userName,
      @required String password}) {
    // TODO: implement registerEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerFacebook() {
    // TODO: implement registerFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerGoogle() {
    // TODO: implement registerGoogle
    throw UnimplementedError();
  }
}
