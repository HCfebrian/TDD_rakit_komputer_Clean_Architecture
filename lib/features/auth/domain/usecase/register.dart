import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository firebaseAuthRepository;

  RegisterUseCase(this.firebaseAuthRepository);

  Future<Either<Failure, User>> registerEmailAndPassword(
      {@required String username,
      @required String email,
      @required String password}) async {
    return await firebaseAuthRepository.registerEmailAndPassword(
        email: email, password: password, userName: username);
  }

  Future<Either<Failure, User>> registerGoogle() async {
    return await firebaseAuthRepository.registerGoogle();
  }

  Future<Either<Failure, User>> registerFacebook() async {
    return await firebaseAuthRepository.registerFacebook();
  }
}
