import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/part_entity.dart';

abstract class BuildRepoAbst {
  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild();
  Future<Either<Failure, List<BuildEntity>>> getCompletedBuildInit();
  Future<Either<Failure, List<BuildEntity>>> getCompletedBuildMore(int startFrom);
  Future<Either<Failure, BuildEntity>> getFeaturedBuild();
  Future<Either<Failure, List<BuildPartEntity>>> getComputerPart(String buildID);
}
