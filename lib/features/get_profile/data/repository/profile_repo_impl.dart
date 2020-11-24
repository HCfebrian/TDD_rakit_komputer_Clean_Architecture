import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/core/error/auth/failure_handler.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_profile/data/data_source/profile_remote_data_abst.dart';
import 'package:rakit_komputer/features/get_profile/domain/repository/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepoAbst{
  final ProfileRemoteDataSourceAbsct profileRemoteData;

  ProfileRepoImpl({@required this.profileRemoteData});


  @override
  Future<Either<Failure, User>> getUser() async{
    try{
      final result =await profileRemoteData.getProfile();
      print("displayname " + result.displayName);
      return Right(result);
    }catch(e){
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<BuildEntity>>> getUserBuild()  async{
    try{
      return  Right(await profileRemoteData.getUserBuild());
    } catch(e) {
      return Left(ExceptionToFailure.handle(e));
    }
  }
}