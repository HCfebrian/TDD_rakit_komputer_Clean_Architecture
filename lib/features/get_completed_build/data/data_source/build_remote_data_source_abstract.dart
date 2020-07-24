import 'package:rakit_komputer/features/get_completed_build/data/model/computer_build_model.dart';

abstract class BuildRemoteDataSourceAbstc {
  ///get multiple Recommended Build from Remote
  Future<List<ComputerBuildModel>> getRecommendedBuildList();
}