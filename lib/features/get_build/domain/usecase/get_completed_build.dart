import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/part_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/repository/build_repository.dart';

class BuildUsecase {
  final BuildRepoAbst buildRepository;
  List<BuildEntity> showThisBuildList;

  BuildUsecase({@required this.buildRepository});

  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild() async {
    return await buildRepository.getRecommendedBuild();
  }

  Future<Either<Failure, List<BuildEntity>>> getCompletedBuildInit() async {
    final result = await buildRepository.getCompletedBuildInit();
    result.fold((failure) {
      return Left(failure);
    }, (initBuildList) {
      showThisBuildList = [];
      showThisBuildList = initBuildList;
    });
    return Right(showThisBuildList);
  }

  Future<Either<Failure, List<BuildEntity>>> getMoreBuild() async{
    final result = await buildRepository.getCompletedBuildMore(showThisBuildList.length);
    result.fold((failure) {
      return Left(failure);
    }, (moreBuildList) {
      showThisBuildList.addAll(moreBuildList);
    });
    return Right(showThisBuildList);

  }

  Future<Either<Failure, BuildEntity>> getFeaturedBuild() async {
    return await buildRepository.getFeaturedBuild();
  }

  Future<Either<Failure, List<BuildPartEntity>>> getComputerPart(
      String buildID) async {
    return await buildRepository.getComputerPart(buildID);
  }
}
