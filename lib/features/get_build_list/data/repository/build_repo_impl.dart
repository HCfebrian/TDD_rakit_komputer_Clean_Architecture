import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/auth/failure_handler.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build_list/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/core/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/repository/build_repository.dart';

class BuildRepoImpl implements BuildRepoAbst {
  final BuildRemoteDataSourceAbstc remoteDataSource;

  BuildRepoImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BuildEntity>>> getRecommendedBuild() async {
    try {
      return Right(await remoteDataSource.getRecommendedBuildList());
    } catch (e) {
      print(e);
      return Left(ExceptionToFailure.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<BuildEntity>>> getCompletedBuild()async {
    try {
      return Right(await remoteDataSource.getCompletedBuildList());
    } catch (e) {
    print(e);
    return Left(ExceptionToFailure.handle(e));
    }  }

  @override
  Future<Either<Failure, BuildEntity>> getFeaturedBuild() async {
    try{
      print("ini hasil featured");
      return Right(await remoteDataSource.getFeaturedBuild());
    }catch (e){
      print(("ini hasil error getFeatured repo imp"));
      print(e);
      return Left(ExceptionToFailure.handle(e));
    }
  }
}
