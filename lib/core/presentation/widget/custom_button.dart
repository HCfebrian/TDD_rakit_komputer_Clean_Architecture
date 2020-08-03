import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color colorBg, colorText;
  final Function onPressed;
  final margin;

  CustomButton(
      {@required this.text,
      @required this.colorBg,
      this.colorText,
      @required this.onPressed, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: margin,
      child: RaisedButton(
        elevation: 5,
        color: colorBg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: AppStyle.textWhiteBold14,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: Radii.appFormRadius),
        onPressed: onPressed,
      ),
    );
  }
}
