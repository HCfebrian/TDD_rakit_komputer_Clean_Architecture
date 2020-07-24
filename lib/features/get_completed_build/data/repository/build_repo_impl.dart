import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/failure_handler.dart';
import 'package:rakit_komputer/core/error/failures.dart';
import 'package:rakit_komputer/features/get_completed_build/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_completed_build/domain/repository/build_repository.dart';

class BuildRepoImpl implements BuildRepoAbst{

  final BuildRemoteDataSourceAbstc remoteDataSource;

  BuildRepoImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild() async {
    try{
      return Right( await remoteDataSource.getRecommendedBuildList());
    } catch (e){
      return Left(ExceptionToFailure.handle(e));
    }
  }

}