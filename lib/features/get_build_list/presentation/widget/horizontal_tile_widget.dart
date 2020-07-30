import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';
class HorizontalTile extends StatelessWidget {
  final BuildEntity buildList;
  const HorizontalTile({
    Key key, @required this.buildList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Radii.appTileRadius,
          boxShadow: [
            Shadows.primaryShadow,
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(buildList.picURL, fit: BoxFit.cover,),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: Radii.appTileRadius,
                boxShadow: [
                  Shadows.primaryShadow,
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      buildList.owner,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackLight14,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      buildList.title.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackSemiBold14,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            buildList.overallPrice,
                            style: AppStyle.textBlackBold14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              "200",
                              style: AppStyle.textBlackLight12,
                            ),
                            Image.asset("assets/images/IconUpvote.png"),
                            SizedBox(width: 6),
                            Text("200",
                              style: AppStyle.textBlackLight12,
                            ),
                            SizedBox(width: 6),
                            Image.asset("assets/images/IconComment.png"),
                            SizedBox(width: 10),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
