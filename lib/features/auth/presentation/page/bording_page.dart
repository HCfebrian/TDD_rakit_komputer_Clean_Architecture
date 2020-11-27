import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:rakit_komputer/core/values/colors.dart';
import 'package:rakit_komputer/core/values/style.dart';
import 'package:rakit_komputer/features/auth/presentation/page/login_page.dart';


class BoardingScreen extends StatelessWidget {

  final listPagesViewModel = [
    PageViewModel(
        title: "Find PC Recomendation",
        body:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut",
        image: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/images/IconBoarding1.png"),
        ),
        decoration: PageDecoration(
            titleTextStyle: AppStyle.heading1(AppColors.accentColor),
            bodyTextStyle: AppStyle.bodyText(Colors.grey),
            descriptionPadding: EdgeInsets.symmetric(horizontal: 20))),
    PageViewModel(
        title: "Find Better Price",
        body:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut",
        image: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/images/iconBoardingScreen2.png",
          ),
        ),
        decoration: PageDecoration(
            titleTextStyle: AppStyle.heading1(AppColors.accentColor),
            bodyTextStyle: AppStyle.bodyText(Colors.grey),
            descriptionPadding: EdgeInsets.symmetric(horizontal: 20))),
    PageViewModel(
        title: "Connection With Other People",
        body:
            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut",
        image: Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/images/iconBoardingscreen3.png"),
        ),
        decoration: PageDecoration(
          titleTextStyle: AppStyle.heading1(AppColors.accentColor),
          bodyTextStyle: AppStyle.bodyText(Colors.grey),
          descriptionPadding: EdgeInsets.symmetric(horizontal: 20),
        ))
  ];

  Widget build(BuildContext context) {

    return IntroductionScreen(
      pages: listPagesViewModel,
      onDone: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
        // When done button is press
      },
      onSkip: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
        // You can also override onSkip callback
      },
      showSkipButton: true,
      skip: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Skip",
            style: AppStyle.button(AppColors.primaryColor),
          )),
      next: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Next",
            style: AppStyle.button(AppColors.primaryColor),
          )),
      done: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Next",
            style: AppStyle.button(AppColors.primaryColor),
          )),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: AppColors.primaryColor,
          color: AppColors.accentColor,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)),),
    );
  }
}
