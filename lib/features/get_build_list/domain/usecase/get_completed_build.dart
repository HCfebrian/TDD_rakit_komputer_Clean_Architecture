import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/repository/build_repository.dart';

class BuildUsecase {
  final BuildRepoAbst buildRepository;
  BuildUsecase({@required this.buildRepository});
  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild() async{

    return await buildRepository.getRecommendedBuild();
  }

}
