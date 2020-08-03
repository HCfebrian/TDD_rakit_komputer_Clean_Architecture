
import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(color: AppColors.secondaryElement),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            "assets/images/IconNotif.png",
            color: Colors.white,
          ),
          Image.asset(
            "assets/images/IconHomeSelected.png",
            color: Colors.white,
          ),
          Image.asset(
            "assets/images/IconProfile.png",
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
