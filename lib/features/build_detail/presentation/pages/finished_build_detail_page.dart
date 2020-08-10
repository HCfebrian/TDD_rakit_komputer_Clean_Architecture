import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/string.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/computer_part_entity.dart';

class BuildDetailPage extends StatelessWidget {
  final BuildEntity buildEntity;

  const BuildDetailPage({Key key, this.buildEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.secondaryElement,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 24),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        buildEntity.title,
                        style: AppStyle.textBlackSemiBold22,
                      ),
                    ),
                    Icon(Icons.arrow_back_ios)
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.network(
                      buildEntity.picURL,
                      fit: BoxFit.fitWidth,
                      height: 250,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Description",
                              style: AppStyle.textBlackBold14,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.arrow_upward),
                                Text("200")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(CustomString.loremIpsum)),
                    ],
                  ),
                ),
              )
            ],
          ),
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
