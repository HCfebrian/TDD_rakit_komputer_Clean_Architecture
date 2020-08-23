import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/part_entity.dart';

class BuildModel extends BuildEntity {
  BuildModel({
    @required String buildId,
    @required String title,
    @required String overallPrice,
    @required String picURL,
    @required String owner,
  }) : super(
          buildId: buildId,
          title: title,
          overallPrice: overallPrice,
          picURL: picURL,
          owner: owner,
        );

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

class BuildPartModel extends BuildPartEntity {
  BuildPartModel({
    @required String buildID,
    @required String partId,
    @required String name,
    @required String partType,
    @required String rating,
    @required String avgPrice,
    @required String partUrl,
  }) : super(
          buildId: buildID,
          partId: partId,
          name: name,
          partType: partType,
          rating: rating,
          avgPrice: avgPrice,
          picURL: partUrl,
        );

  factory BuildPartModel.from(Map<String, dynamic> map) {
    return BuildPartModel(
      partId: map["partID"],
      name: map["name"],
      partType: map["partType"],
      rating: map["rating"],
      avgPrice: map["partPrice"],
      partUrl: map["picURL"],
      buildID: map["buildID"],
    );
  }
}
