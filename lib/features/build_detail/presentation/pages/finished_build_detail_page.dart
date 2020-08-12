import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/string.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build_list/presentation/widget/horizontal_part_tile_widget.dart';

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
                color: AppColors.backgroundColor,
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
                      GridView.builder(
                        itemCount: buildEntity.partList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio:
                                (MediaQuery.of(context).size.width / 1.1) /
                                    (MediaQuery.of(context).size.height / 6)),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return HorizontalPartTile(
                              partEntity: buildEntity.partList[index]);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Total"),
                            Text("put the money here")
                          ],
                        ),
                      ),
                      CustomButton(
                          text: "Edit Component",
                          colorBg: AppColors.secondaryElement,
                          onPressed: () {})
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
