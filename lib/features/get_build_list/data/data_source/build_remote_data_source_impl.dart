import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/auth/exception_handler.dart';
import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';

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
      final docRecommendedRef = firetoreInstance.collection("completed_build");
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
}
