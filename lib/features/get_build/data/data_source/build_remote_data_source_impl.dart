import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/core/error/auth/exception_handler.dart';
import 'package:rakit_komputer/features/get_build/data/model/computer_build_model.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/part_entity.dart';

import 'build_remote_data_source_abstract.dart';

class BuildRemoteDataSourceImpl implements BuildRemoteDataSourceAbstc {
  final Firestore firetoreInstance;

  BuildRemoteDataSourceImpl({@required this.firetoreInstance});

  @override
  Future<List<BuildModel>> getRecommendedBuildList() async {
    try {
      List<BuildModel> result = List();
      final dRBuildOverview = firetoreInstance.collection("recommended_build");

      await dRBuildOverview.getDocuments().then(
          (value) => value.documents.forEach((ds) {
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
      final dRBuildOverview = firetoreInstance
          .collection("completed_build/completed_build/completed_build");
      await dRBuildOverview.limit(10).getDocuments().then(
          (value) => value.documents.forEach((ds) {
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
      final docCompletedBuild = firetoreInstance
          .collection("completed_build/completed_build/completed_build");
      BuildModel result =
          BuildModel.from(await docCompletedBuild.document(buildID).get());
      return result;
    } catch (e) {
      print("error getcompletedBuild");
      print(e);
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<BuildEntity> getFeaturedBuild() async {
    try {
      final featuredBuild = await firetoreInstance
          .collection("completed_build")
          .document("fetured_build")
          .get();
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

  @override
  Future<List<BuildPartEntity>> getComputerPart(String buildID) async {
    DocumentReference dRBuildOverview =
        firetoreInstance.document("/completed_build_parts/build_id");

    List<BuildPartModel> partList = List();
    await dRBuildOverview
        .collection(buildID)
        .getDocuments()
        .then((value) => value.documents.forEach((part) {
              partList.add(BuildPartModel.from(part.data));
            }));
    return partList;
  }
}
