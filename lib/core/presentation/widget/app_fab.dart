import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';

class AppFAB extends StatelessWidget {
  final Function onpress;
  const AppFAB({
    Key key, this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      backgroundColor: AppColors.primaryColor,
      child: Icon(Icons.add),
      onPressed: onpress,
    );
  }
}