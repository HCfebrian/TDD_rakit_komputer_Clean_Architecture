import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';

class FacebookButton extends StatelessWidget {
  final textButton = "Continue With Facebook";
  final Function onPressed;
  final margin;

  const FacebookButton({Key key, @required this.onPressed, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RaisedButton(
        elevation: 5,
        color: AppColors.accentElement,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/facebookIcon.png"),
            SizedBox(width: 10),
            Text(
              textButton,
              style: AppStyle.textWhite14,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: Radii.appBorderRadius),
        onPressed: onPressed,
      ),
    );
  }
}