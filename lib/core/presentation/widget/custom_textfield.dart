import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';

class CustomTextField extends StatelessWidget {
  final String hintText, errorText, initialValue;
  final EdgeInsets margin;
  final bool obSecure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final BoxBorder border;

  const CustomTextField(
      {Key key,
      this.hintText,
      this.margin,
      this.obSecure,
      this.errorText,
      this.keyboardType,
      this.initialValue, this.controller, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        border: border,
        color: AppColors.primaryElement,
        boxShadow: [
          Shadows.primaryShadow,
        ],
        borderRadius: Radii.appBorderRadius,


      ),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        obscureText: obSecure ?? false,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
//            errorText: errorText
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
