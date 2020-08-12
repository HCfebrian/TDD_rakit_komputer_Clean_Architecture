import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/computer_part_entity.dart';

class HorizontalPartTile extends StatelessWidget {
  final ComputerPartEntity partEntity;

  const HorizontalPartTile({
    Key key,
    @required this.partEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Radii.appTileRadius8,
          boxShadow: [
            Shadows.primaryShadow,
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: ClipRRect(
                  borderRadius: Radii.appTileRadius8,
                  child: Image.network(
                    partEntity.picURL,
                    fit: BoxFit.fitWidth,
                  )),
              width: 80,
              decoration: BoxDecoration(
                borderRadius: Radii.appTileRadius8,
                boxShadow: [
                  Shadows.primaryShadow,
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("part type",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackLight14,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      partEntity.name.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackSemiBold14,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            partEntity.avgPrice,
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
                            Text(
                              "200",
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
