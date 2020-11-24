import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_profile/domain/repository/profile_repo.dart';
import 'package:meta/meta.dart';

class ProfileUsecase {
  final ProfileRepoAbst profileRepo;

  ProfileUsecase({@required this.profileRepo});

  Future<Either<Failure, User>> getUser() async{
    return await profileRepo.getUser();
  }


  Future<Either<Failure, List<BuildEntity>>> getProfileBuilds() async{
    return await profileRepo.getUserBuild();
  }
  
  
}
