import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';

abstract class BuildRemoteDataSourceAbstc {
  ///get multiple Recommended Build from Remote
  Future<List<BuildModel>> getRecommendedBuildList();
  Future<List<BuildModel>> getCompletedBuildList();
}