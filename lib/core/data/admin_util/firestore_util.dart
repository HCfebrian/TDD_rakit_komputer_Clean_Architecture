import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class MaintainFirestore {
  final Firestore firestore;
  Map<String, dynamic> ds = Map();
  Map<String, Map<String, dynamic>> sim = Map();

  MaintainFirestore({@required this.firestore});

  void moveDocuments(String from, String to) async {
    await firestore.collection(from).getDocuments().then((value) {
      value.documents.forEach((element) {
        ds = element.data;
        sim.putIfAbsent(element.documentID, () => ds);
        print(sim);
        firestore.collection(from).document(element.documentID).delete();
      });
    });
    print(ds.length);
    sim.forEach((key, value) {
      firestore.collection(to).document(key).setData(value);
    });
  }

  void copyCollection(String from, String to)async{
    await firestore.collection(from).getDocuments().then((value){
      value.documents.forEach((element) {
        firestore.collection(to).document(element.documentID).setData(element.data);
      });
    });
  }

  void renameDocuments(String prev, String newName, String where) async {
    final ds = await firestore.document(where).get();
    firestore.document(where).delete();
    firestore.document(where).setData(ds.data);
  }

  void copyDocument(String from, String to) async {
    final ds = await firestore.document(from).get();
    firestore.document(to).setData(ds.data);
  }

  void inputToDocument(String dir, Map<String, dynamic> data) {
    firestore.document(dir).setData(data).then((value) => print("Success"),
        onError: () {
      print("error");
    });
  }

  Future<Map<String, dynamic>> getMapData(String from) async {
    return firestore.document(from).get().then((value) => value.data);
  }
}
