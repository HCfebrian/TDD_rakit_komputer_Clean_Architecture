import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';

abstract class ProfileRemoteDataSourceAbsct{
  Future<User> getProfile();
  Future<List<BuildEntity>> getUserBuild();
}