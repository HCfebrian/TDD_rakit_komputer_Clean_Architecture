import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:rakit_komputer/core/error/auth/exception.dart';
import 'package:rakit_komputer/core/error/auth/failure_handler.dart';
import 'package:rakit_komputer/core/error/auth/failures.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/core/network/netword_info.dart';
import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/features/auth/domain/repository/auth_repository.dart';

class FirebaseAuthRepositoryImpl implements AuthRepositoryAbst {
  final AuthRemoteDataSource authRemoteData;
  final NetworkInfo networkInfo;

  FirebaseAuthRepositoryImpl(
      {@required this.authRemoteData, @required this.networkInfo});

  @override
  Future<Either<Failure, User>> loginEmailAndPassword(
      {@required String email, @required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteData.loginEmailAndPassword(
            email: email, password: password));
      } catch(e){
        print(e);
        return Left(ExceptionToFailure.handle(e));

      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> loginFacebook() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteData.loginFacebook());
      } on LoginErrorException {
        return Left(LoginFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> loginGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteData.loginGoogle());
      } on LoginErrorException {
        return Left(LoginFailure());
      } catch(e){
        return Left(ExceptionToFailure.handle(e));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> registerEmailAndPassword(
      {@required String email,
      @required String userName,
      @required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteData.registerEmailAndPassword(
            email: email, userName: userName, password: password));
      } on UndefinedException {
        return Left(UndefinedFailure());
      } on EmailAlreadyExistException{
        return Left(EmailAlreadyExistFailure());
      } catch(e){
        return Left(ExceptionToFailure.handle(e));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> registerFacebook() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteData.registerFacebook());
      } on RegisterErrorException {
        return Left(RegisterFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, User>> registerGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await authRemoteData.registerGoogle());
      } on RegisterErrorException {
        return Left(RegisterFailure());
      } catch (e){
        return Left(ExceptionToFailure.handle(e));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> loginAnonymously() async{
    if(await networkInfo.isConnected){
    try{
      return Right(await authRemoteData.loginAnonymously());
    }catch (e){
      return Left(ExceptionToFailure.handle(e));
    }
    }else{
      return left(NetworkFailure());
    }
  }
}
