import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/style.dart';

class FilterBubble extends StatelessWidget {
  final String text;
  final color;
  final Function onClick;

  const FilterBubble({
    Key key,
    @required this.text,
    this.color,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        child: Text(
          text.toUpperCase(),
          style:
          color == null ? AppStyle.textBlackLight12 : AppStyle.textWhite12,
        ),
        decoration: BoxDecoration(
          color: color == null ? Colors.white : color,
          borderRadius: Radii.appFilterRadius2,
        ),
      ),
    );
  }
}
