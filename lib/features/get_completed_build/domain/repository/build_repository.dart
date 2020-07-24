import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/entity/build_entity.dart';

abstract class BuildRepoAbst {
  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild();
}
