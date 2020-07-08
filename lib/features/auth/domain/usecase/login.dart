import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:rakit_komputer/core/values/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/firebase_auth_repository.dart';

class LoginUseCase {
  final FirebaseAuthRepository firebaseAuth;

  LoginUseCase(this.firebaseAuth);

  Future<Either<Failure, User>> loginGoogle() async {
    return await firebaseAuth.loginGoogle();
  }
  Future<Either<Failure, User>> loginFacebook() async {
    return await firebaseAuth.loginFacebook();
  }
  Future<Either<Failure, User>> loginEmailAndPassword({@required String email, @required String password}) async {
    return await firebaseAuth.loginEmailAndPassword(email: email, password: password);
  }


}
