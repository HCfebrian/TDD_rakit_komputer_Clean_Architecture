import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';
class HorizontalTile extends StatelessWidget {
  const HorizontalTile({
    Key key,
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
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.black,
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
                      "Joko Sumarrgo",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackLight14,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Pc Gaming AMD Ryzen 7 +2080ti kkkkllllllllllllk",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textBlackSemiBold14,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "RP 20.000.000",
                          style: AppStyle.textBlackBold14,
                        ),
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
