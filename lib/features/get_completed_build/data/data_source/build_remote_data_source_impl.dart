import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/core/error/firestore/exception_handler.dart';
import 'package:rakit_komputer/features/get_completed_build/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/features/get_completed_build/data/model/computer_build_model.dart';
import 'package:meta/meta.dart';

class BuildRemoteDataSourceImpl implements BuildRemoteDataSourceAbstc {
  final Firestore firetoreInstance;

  BuildRemoteDataSourceImpl({@required this.firetoreInstance});

  @override
  Future<List<BuildModel>> getRecommendedBuildList() async {
    List<BuildModel> result = List();

    firetoreInstance.collection("recommended_build").getDocuments().then(
        (value) => value.documents.forEach((ds) {
              result.add(BuildModel.from(ds));
            }), onError: (e) {
      throw FirestoreException.handle(e);
    });
    return result;
  }
}
