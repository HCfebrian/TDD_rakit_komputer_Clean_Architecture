import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/string.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/core/domain/entity/build_entity.dart';

class FinishedBuildDetailPage extends StatelessWidget {
  final BuildEntity buildEntity;

  const FinishedBuildDetailPage({Key key, this.buildEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 360,
              child: Image.network(buildEntity.picURL),
            ),
            Icon(Icons.arrow_back_ios),
            Center(child: Text(buildEntity.title)),
            Positioned(
              //description
              top: 355,
              child: Container(
                color: AppColors.backgroundColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: <Widget>[
                          Text("Description", style: AppStyle.textBlackSemiBold14,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.arrow_upward),
                              Text("200")
                            ],
                          )
                        ],
                      ),
                    ),
                    Text(CustomString.loremIpsum),
                    Text("PC Part", style: AppStyle.textBlackLight14,),
                    ListView.builder(itemBuilder: (BuildContext context, int index){
                      return ComputerPartTile(partEntity: buildEntity.partList[index]);
                    })
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ComputerPartTile extends StatelessWidget {
 final partEntity;

  const ComputerPartTile({Key key, @required this.partEntity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

