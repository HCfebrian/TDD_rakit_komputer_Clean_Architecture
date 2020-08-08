import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/computer_part_entity.dart';

class FinishedBuildDetailPage extends StatelessWidget {
  final BuildEntity buildEntity;

  const FinishedBuildDetailPage({Key key, this.buildEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: <Widget>[
            Image.network(buildEntity.picURL),
            Container(
              color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: Radii.topLeftRightRadius8,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("Description"),
                  Row(children: <Widget>[
                    Icon(Icons.arrow_upward),
                    Text("200")
                  ],)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ComputerPartTile extends StatelessWidget {
  final ComputerPartEntity partEntity;

  const ComputerPartTile({Key key, @required this.partEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.network(partEntity.photoUrl),
          Column(
            children: <Widget>[
              Text(partEntity.partType),
              Text(partEntity.name),
              Text(partEntity.rating),
              Text(partEntity.avgPrice)
            ],
          )
        ],
      ),
    );
  }
}
