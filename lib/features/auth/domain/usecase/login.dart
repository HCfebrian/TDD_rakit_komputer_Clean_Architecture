import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepo;

  LoginUseCase({@required this.authRepo});

  Future<Either<Failure, User>> loginGoogle() async {
    return await authRepo.loginGoogle();
  }
  Future<Either<Failure, User>> loginFacebook() async {
    return await authRepo.loginFacebook();
  }
  Future<Either<Failure, User>> loginEmailAndPassword({@required String email, @required String password}) async {
    return await authRepo.loginEmailAndPassword(email: email, password: password);
  }


  //login Anonymously. mainly used if the user don't want to register at the moment.
  Future<Either<Failure, bool>> loginAnonymously() async{
    return await authRepo.loginAnonymously();
  }

}
