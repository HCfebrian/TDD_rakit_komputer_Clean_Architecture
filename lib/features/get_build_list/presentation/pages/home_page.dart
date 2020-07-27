import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/presentation/widget/custom_textfield.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/radii.dart';
import 'package:rakit_komputer/core/values/shadows.dart';
import 'package:rakit_komputer/core/values/style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.only(left: 24, right: 24, top: 26, bottom: 5),
                  child: Text(
                    "hi, Username",
                    style: AppStyle.textBlackLight14,
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  child: Text(
                    "Build your PC \nNOW",
                    style: AppStyle.textBlackSemiBold22,
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: CustomTextField(
                  iconData: Icons.search,
                  hintText: "Search",
                ),
              ),
              SizedBox(height: 16,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      HorizontalScrollableSection(),
                      SizedBox(height: 10,),
                      HorizontalScrollableSection(),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ),
              Container(
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: Radii.appMenuRadius,
                    color: AppColors.secondaryElement),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/images/IconNotif.png",color: Colors.white,),
                    Image.asset("assets/images/IconHomeSelected.png",color: Colors.white,),
                    Image.asset("assets/images/IconProfile.png",color: Colors.white,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalScrollableSection extends StatelessWidget {
  const HorizontalScrollableSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            child: Text(
              "PC RECOMMENDATION",
              style: AppStyle.textBlackSemiBold16,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(width: 14),
                BuildTile(),
                BuildTile(),
                BuildTile(),
                BuildTile(),
                SeeOthers(),
                SizedBox(width: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SeeOthers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      color: AppColors.secondaryElement,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SeeOthers",
            style: AppStyle.textWhite14,
          ),
          Icon(
            Icons.navigate_next,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class BuildTile extends StatelessWidget {
  const BuildTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Radii.appTileRadius,
        boxShadow: [
          Shadows.primaryShadow,
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            child: Image.asset("assets/images/image20.png"),
          ),
          Column(
            children: <Widget>[Text("Pc Gaming AMD"), Text("RP 20.000.000")],
          )
        ],
      ),
    );
  }
}
