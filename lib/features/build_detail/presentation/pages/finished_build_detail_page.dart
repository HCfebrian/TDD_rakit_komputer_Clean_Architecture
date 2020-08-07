import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/string.dart';
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
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Image.network(
                  buildEntity.picURL,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Container(
                      color: AppColors.secondaryElement,
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.arrow_back_ios),
                          Align(
                            child: Text(
                              buildEntity.title.toUpperCase(),
                              style: AppStyle.textBlackSemiBold22,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )),
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
