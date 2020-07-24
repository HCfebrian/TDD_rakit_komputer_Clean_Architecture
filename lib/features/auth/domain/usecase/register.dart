import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase({@required this.authRepository});

  Future<Either<Failure, User>> registerEmailAndPassword(
      {@required String username,
      @required String email,
      @required String password}) async {
    return await authRepository.registerEmailAndPassword(
        email: email, password: password, userName: username);
  }

  Future<Either<Failure, User>> registerGoogle() async {
    return await authRepository.registerGoogle();
  }

  Future<Either<Failure, User>> registerFacebook() async {
    return await authRepository.registerFacebook();
  }
}
