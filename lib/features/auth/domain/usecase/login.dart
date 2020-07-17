import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository firebaseAuthRepo;

  LoginUseCase({@required this.firebaseAuthRepo});

  Future<Either<Failure, User>> loginGoogle() async {
    return await firebaseAuthRepo.loginGoogle();
  }
  Future<Either<Failure, User>> loginFacebook() async {
    return await firebaseAuthRepo.loginFacebook();
  }
  Future<Either<Failure, User>> loginEmailAndPassword({@required String email, @required String password}) async {
    return await firebaseAuthRepo.loginEmailAndPassword(email: email, password: password);
  }


}
