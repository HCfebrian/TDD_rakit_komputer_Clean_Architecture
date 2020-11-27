import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/features/get_profile/presentation/page/profile_page.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(color: AppColors.primaryColor),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Image.asset(
              "assets/images/IconProfile.png",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
