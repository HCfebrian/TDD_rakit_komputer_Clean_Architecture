import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_completed_build/data/data_source/build_remote_data_source_abstract.dart';
import 'package:rakit_komputer/features/get_completed_build/data/model/computer_build_model.dart';

class BuildRemoteDataSourceImpl implements BuildRemoteDataSourceAbstc{
  final firetoreInstance = Firestore.instance;

  @override
  Future<List<ComputerBuildModel>> getRecommendedBuildList() async{


    QuerySnapshot querySnapshot;
     firetoreInstance.collection("path").getDocuments().then((value) => querySnapshot);
     querySnapshot.documents.forEach((element) {print(element.data);});
  }

}