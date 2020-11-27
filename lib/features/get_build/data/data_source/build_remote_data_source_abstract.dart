import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/part_entity.dart';

abstract class BuildRemoteDataSourceAbstc {
  ///get multiple Recommended Build from Remote
  Future<List<BuildEntity>> getRecommendedBuildList();
  Future<List<BuildEntity>> getCompletedBuildList();
  Future<List<BuildPartEntity>> getComputerPart(String buildID);
  Future<BuildEntity> getFeaturedBuild();
  Future<BuildEntity> getCompletedBuild(String buildID);

}