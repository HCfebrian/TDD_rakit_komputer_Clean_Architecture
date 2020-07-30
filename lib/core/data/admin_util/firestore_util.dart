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
}
