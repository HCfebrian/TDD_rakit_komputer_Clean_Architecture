import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';

class CustomTextField extends StatelessWidget {
  final String hintText, initialValue;
  final EdgeInsets margin;
  final bool obSecure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final BoxBorder border;
  final IconData iconData;

  const CustomTextField({
    Key key,
    this.hintText,
    this.margin,
    this.obSecure,
    this.keyboardType,
    this.initialValue,
    this.controller,
    this.border,
     this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        border: border,
        color: Colors.white,
        borderRadius: Radii.appFormRadius,
        boxShadow: [
          Shadows.primaryShadow,
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              initialValue: initialValue,
              keyboardType: keyboardType,
              obscureText: obSecure ?? false,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: AppColors.accentColor,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),

              maxLines: 1,
              autocorrect: false,
            ),
          ),
          (iconData == null) ? Container(): Icon(iconData),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
