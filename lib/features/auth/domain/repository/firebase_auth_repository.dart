import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:rakit_komputer/core/values/failures.dart';
import 'package:rakit_komputer/features/auth/domain/entity/user.dart';

abstract class FirebaseAuthRepository{
  Future<Either<Failure,User>>loginGoogle();
  Future<Either<Failure,User>>loginFacebook();
  Future<Either<Failure,User>>loginEmailAndPassword({@required String email, @required String password});
  Future<Either<Failure,User>>registerGoogle();
  Future<Either<Failure,User>>registerFacebook();
  Future<Either<Failure,User>>registerEmailAndPassword({@required String email,@required String userName, @required String password});
}