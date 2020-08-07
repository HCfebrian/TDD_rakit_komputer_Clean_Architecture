import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:meta/meta.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/computer_part_entity.dart';

class BuildModel extends BuildEntity {
  BuildModel(
      {@required String buildId,
      @required String title,
      @required String overallPrice,
      @required String picURL,
      @required String owner,
//      @required partList,
      })
      : super(
            buildId: buildId,
            title: title,
            overallPrice: overallPrice,
            picURL: picURL,
            owner: owner,
//            partList: null,
  );

  factory BuildModel.from(DocumentSnapshot ds) {
    return BuildModel(
        buildId: ds.documentID,
        title: ds.data["title"],
        overallPrice: ds.data["overall_price"],
        picURL: ds.data["picURL"],
        owner: ds.data["owner"],
//        partList: ComputerPartOverviewModel.from(ds.data["partList"])
        );
  }


}

class ComputerPartOverviewModel extends ComputerPartEntity {
  ComputerPartOverviewModel({
    @required String partId,
    @required String name,
    @required String partType,
    @required String rating,
    @required String avgPrice,
    @required String partUrl,
  }) : super(
          partId: partId,
          name: name,
          partType: partType,
          rating: partType,
          avgPrice: partType,
          photoUrl: partType,
        );

  factory ComputerPartOverviewModel.from(Map<String,dynamic> map) {
    return ComputerPartOverviewModel(
      partId: map["partId"],
      name: map["name"],
      partType: map["partType"],
      rating: map["rating"],
      avgPrice: map["avgPrice"],
      partUrl: map["partUrl"],
    );
  }
}
