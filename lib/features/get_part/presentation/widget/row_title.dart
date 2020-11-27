
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';

Widget buildRow(BuildContext context, dynamic partDetail) {
  return Container(
    color: Colors.white,
    child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: Radii.appTileRadius8,
        color: AppColors.accentColor,

      ),
      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width * 0.4),
            child: Text(
              partDetail.name,
              style: AppStyle.textWhiteBold22,
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
              "Rp 3.000.000",
              style: AppStyle.textWhite12
          )
        ],
      ),
    ),
  );
}
