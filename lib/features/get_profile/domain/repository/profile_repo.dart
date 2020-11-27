import 'package:dartz/dartz.dart';
import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/core/error/failure.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';

abstract class ProfileRepoAbst {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, List<BuildEntity>>> getUserBuild();
}

