import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/style.dart';

import 'horizontal_tile_widget.dart';

class VerticalSection extends StatelessWidget {
  const VerticalSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Completed Build",
                  style: AppStyle.textBlackSemiBold16,
                  textAlign: TextAlign.left,
                ),
                Text(
                  "See Others",
                  style: AppStyle.textRedRegular14,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: <Widget>[
              SizedBox(width: 14),
              HorizontalTile(),
              HorizontalTile(),
              HorizontalTile(),
              HorizontalTile(),
              SizedBox(width: 14),
            ],
          ),
        ],
      ),
    );
  }
}
