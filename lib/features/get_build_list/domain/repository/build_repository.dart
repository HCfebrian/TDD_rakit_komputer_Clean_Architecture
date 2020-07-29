import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';

abstract class BuildRepoAbst {
  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild();
  Future<Either<Failure, List<BuildEntity>>> getCompletedBuild();
}
