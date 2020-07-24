import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/repository/build_repository.dart';

class BuildUsecase {
  final BuildRepoAbst buildRepository;

  BuildUsecase({@required this.buildRepository});

  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild() async{
    return await buildRepository.getRecommendedBuild();
  }

}
