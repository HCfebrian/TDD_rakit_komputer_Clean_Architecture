import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/auth/exception_handler.dart';
import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';

import 'build_remote_data_source_abstract.dart';

class BuildRemoteDataSourceImpl implements BuildRemoteDataSourceAbstc {
  final Firestore firetoreInstance;

  BuildRemoteDataSourceImpl({@required this.firetoreInstance});

  @override
  Future<List<BuildModel>> getRecommendedBuildList() async {
    try {
      List<BuildModel> result = List();
      final docRecommendedRef =
          firetoreInstance.collection("recommended_build");
      await docRecommendedRef.getDocuments().then(
          (value) => value.documents.forEach((ds) {
                print(ds.data["title"]);
                print("kalau true salah");
                print(BuildModel.from(ds) == null);
                result.add(BuildModel.from(ds));
              }), onError: (e) {
        throw FirebaseException.handle(e);
      });
      return result;
    } catch (e) {
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<List<BuildModel>> getCompletedBuildList() async {
    try {
      List<BuildModel> result = List();
      final docRecommendedRef = firetoreInstance
          .collection("completed_build/completed_build/completed_build");
      await docRecommendedRef.getDocuments().then(
          (value) => value.documents.forEach((ds) {
                print(BuildModel.from(ds) == null);
                result.add(BuildModel.from(ds));
              }), onError: (e) {
        throw FirebaseException.handle(e);
      });
      return result;
    } catch (e) {
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<BuildEntity> getCompletedBuild(String buildID) async {
    try {
      final docCompletedBuild = await firetoreInstance
          .collection("completed_build/completed_build/completed_build")
          .document(buildID)
          .get();
      return BuildModel.from(docCompletedBuild);
    } catch (e) {
      print("error getcompletedBuild");
      print(e);
    }
  }

  @override
  Future<BuildEntity> getFeaturedBuild() async {
    try {
      final featuredBuild = await firetoreInstance
          .collection("completed_build")
          .document("fetured_build").get();
      print("apakah featured build null?");
      print(featuredBuild.data == null);
      final featureBuildId = featuredBuild.data["build_id"];
      return getCompletedBuild(featureBuildId);
    } catch (e) {
      print("datasource error ");
      print(e);
      throw FirebaseException.handle(e);
    }
  }
}
