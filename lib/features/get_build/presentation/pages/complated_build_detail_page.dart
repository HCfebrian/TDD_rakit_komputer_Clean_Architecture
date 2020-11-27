import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_button.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/string.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build/domain/entity/build_entity.dart';
import 'package:rakit_komputer/features/get_build/presentation/widget/build_part_list.dart';

class BuildDetailPage extends StatelessWidget {
  final BuildEntity buildEntity;

  const BuildDetailPage({Key key, this.buildEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
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
            ConstrainedBox(
              constraints: new BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height - 250)),
              child: Container(
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
                          child: Text(
                            CustomString.loremIpsum,
                            textAlign: TextAlign.justify,
                          )),
                      BuildPartList(
                        buildID: buildEntity.buildId,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Total",
                              style: AppStyle.textBlackBold16,
                            ),
                            Text(
                              "Rp 8000000",
                              style: AppStyle.textBlackBold16,
                            )
                          ],
                        ),
                      ),
                      CustomButton(
                        text: "Edit Component",
                        colorBg: AppColors.primaryColor,
                        onPressed: () {},
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
