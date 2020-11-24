import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';

class OrDecoration extends StatelessWidget {
  final margin;

  const OrDecoration({Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/orDecoration.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Or",
              style:
                  TextStyle(fontFamily: "Inter", color: AppColors.accentColor),
            ),
          )
        ],
      ),
    );
  }
}
