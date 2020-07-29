import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:meta/meta.dart';

class BuildModel extends BuildEntity {
  BuildModel(
      {@required String buildId,
      @required String title,
      @required String overallPrice,
      @required String picURL,
      @required String owner})
      : super(
            buildId: buildId,
            title: title,
            overallPrice: overallPrice,
            picURL: picURL,
            owner: owner);

  factory BuildModel.from(DocumentSnapshot ds) {
    return BuildModel(
      buildId: ds.documentID,
      title: ds.data["title"],
      overallPrice: ds.data["overall_price"],
      picURL: ds.data["picURL"],
      owner: ds.data["owner"],
    );
  }
}
