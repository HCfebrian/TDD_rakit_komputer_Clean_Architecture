import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/get_build_list/domain/entity/build_entity.dart';

class VerticalTile extends StatelessWidget {
  final BuildEntity buildList;

  const VerticalTile({
    Key key,
    @required this.buildList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: 160,
        height: 208,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Radii.appTileRadius,
          boxShadow: [
            Shadows.primaryShadow,
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 104,
              width: 104,
              child: Image.network(buildList.picURL, fit: BoxFit.fill,),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: <Widget>[
                  Text(
                    buildList.title.toUpperCase(),
                    style: AppStyle.textBlackSemiBold14,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    buildList.overallPrice,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppStyle.textBlackBold14,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
