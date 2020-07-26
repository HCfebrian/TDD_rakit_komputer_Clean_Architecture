import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/core/error/auth/exception_handler.dart';
import 'package:rakit_komputer/core/error/firestore/exception_handler.dart';
import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';
import 'package:meta/meta.dart';
import 'build_remote_data_source_abstract.dart';

class BuildRemoteDataSourceImpl implements BuildRemoteDataSourceAbstc {
  final Firestore firetoreInstance;

  BuildRemoteDataSourceImpl({@required this.firetoreInstance});

  @override
  Future<List<BuildModel>> getRecommendedBuildList() async {
    List<BuildModel> result = List();
    final docRecommendedRef = firetoreInstance.collection("recommended_build");
    try {
      docRecommendedRef.getDocuments().then(
          (value) => value.documents.forEach((ds) {
                result.add(BuildModel.from(ds));
              }), onError: (e) {
        print("value error happened");
        print(e);
        throw FirestoreException.handle(e);
      });
    } catch (e) {
      print(e);
      throw FirebaseException.handle(e);
    }

    return result;
  }
}
