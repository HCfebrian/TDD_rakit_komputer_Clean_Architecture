import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 26, bottom: 5),
                  child: Text("hi, Username", style: AppStyle.textBlackLight14,)),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only( bottom: 10),
                  child: Text("Build your PC \nNOW", style: AppStyle.textBlackSemiBold22,)),
              Container(
                child: CustomTextField(
                  iconData: Icons.search,
                  hintText: "Search",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
