import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final EdgeInsets margin;
  final bool obSecure;

  const CustomTextField({Key key,  this.hintText, this.margin, this.obSecure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryElement,
        boxShadow: [
          Shadows.primaryShadow,
        ],
        borderRadius: Radii.appBorderRadius,
      ),
      child: TextField(
        obscureText: obSecure??false,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        maxLines: 1,
        autocorrect: false,
      ),
    );
  }
}
