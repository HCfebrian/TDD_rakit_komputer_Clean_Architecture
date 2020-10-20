import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/string.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/page/login_page.dart';


class BoardingScreenTemplate extends StatelessWidget {
  final String title, desc, icon, dotIcon;
  final nextFunction, skipFunction;

  const BoardingScreenTemplate(
      {Key key,
      @required this.title,
      @required this.desc,
      @required this.icon,
      @required this.dotIcon,
      @required this.nextFunction,
      @required this.skipFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.07 * width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Image.asset(icon),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: AppStyle.textBlackSemiBold22,
              ),
              SizedBox(height: 20),
              Container(
                width: 0.7 * width,
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: AppStyle.textBlackLight14,
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => skipFunction,
                      child: Text(
                        "Skip",
                        style: AppStyle.textRedRegular14,
                      ),
                    ),
                    Container(width: 0.1 * width, child: Image.asset(dotIcon)),
                    GestureDetector(
                      onTap: nextFunction,
                      child: Text(
                        "next",
                        style: AppStyle.textRedRegular14,
                      ),
                    ),
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

class BoardingScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BoardingScreenTemplate(
        title: "Find Recomended PC",
        desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        icon: "assets/images/IconBoarding1.png",
        dotIcon: "assets/images/dotIndicator1.png",
        nextFunction: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BoardingScreen2())),
        skipFunction: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage())));
  }
}

class BoardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoardingScreenTemplate(
        title: "Find Recomended PC",
        desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        icon: "assets/images/iconBoardingScreen2.png",
        dotIcon: "assets/images/dotIndicator1.png",
        nextFunction: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BoardingScreen3())),
        skipFunction: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage())));
  }
}

class BoardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoardingScreenTemplate(
      title: "Find Recomended PC",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      icon: "assets/images/iconBoardingscreen3.png",
      dotIcon: "assets/images/dotIndicator1.png",
      nextFunction: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false),
      skipFunction: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false),
    );
  }
}
