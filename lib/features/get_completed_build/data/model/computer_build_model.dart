import 'package:rakit_komputer/features/get_completed_build/domain/entity/build_entity.dart';
import 'package:meta/meta.dart';

class ComputerBuildModel extends BuildEntity {

  ComputerBuildModel({
    @required String buildId,
    @required String title,
    @required String price,
    @required String picURL,
  }) :super(
      buildId: buildId,
      title: title,
      price: price,
      picURL: picURL
  );

}
