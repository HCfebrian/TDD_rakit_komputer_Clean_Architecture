import 'package:flutter_test/flutter_test.dart';

import 'package:rakit_komputer/features/get_build_list/data/model/computer_build_model.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';

void main(){
  final tBuildModel = BuildModel(buildId: "123", title: "test Build", overallPrice: "20_000_000", picURL: "facebook.com");


  test(
      "should produce Build Entity from Build Model",
      () async {
        //arrange
        //act
        //assert
        expect(tBuildModel, isA<BuildEntity>());
      },
    );
}