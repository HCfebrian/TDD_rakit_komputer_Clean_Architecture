import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:rakit_komputer/core/domain/entity/user.dart';
import 'package:rakit_komputer/core/error/auth/exception_handler.dart';
import 'package:rakit_komputer/core/data/model/user_model.dart';
import 'package:rakit_komputer/features/get_build/data/model/computer_build_model.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_profile/data/data_source/profile_remote_data_abst.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceAbsct {
  final Firestore firestoreInstance;

  ProfileRemoteDataSourceImpl({@required this.firestoreInstance});

  @override
  Future<User> getProfile() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      return UserModel.fromFirebaseUser(user);
    } catch (e) {
      print("error Get Profile $e");
      throw FirebaseException.handle(e);
    }
  }

  @override
  Future<List<BuildEntity>> getUserBuild() async {
    try {
      List<BuildModel> result = List();
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      final collectionUserBuildID =
          firestoreInstance.collection("/users/${user.uid}/builds/");
      collectionUserBuildID.getDocuments().then(
          (value) => value.documents.forEach((element) {
                final buildDocument = firestoreInstance.document(
                    "completed_build/completed_build/completed_build/${element.documentID}");
                buildDocument.get().then((build) => result.add(BuildModel.from(build)));
              }), onError: (e) {
        throw FirebaseException.handle(e);
      });
    } catch (e) {
      print("error get profile $e");
      throw FirebaseException.handle(e);
    }
  }
}
