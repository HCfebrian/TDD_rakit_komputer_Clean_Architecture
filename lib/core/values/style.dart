import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/constant.dart';

import 'colors.dart';

class AppStyle {
  static const TextStyle textWhiteBold14 = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
    fontSize: 14,
    fontFamily: "Inter"
  );
  static const TextStyle textWhiteBold18 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 18,
      fontFamily: "Inter"
  );
  static const TextStyle textWhiteBold22 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 22,
      fontFamily: "Inter"
  );
  static const TextStyle textWhite12 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: "Inter"
  );

  static const TextStyle textWhite22 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 22,
      fontFamily: "Inter"
  );
  
  static const TextStyle textWhite28 = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
    fontSize: 28,
    fontFamily: "Inter"

  );

  static final TextStyle textRedRegular14 = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "Inter"
  );

  static final TextStyle textRedRegular12 = TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter"
  );

  static final TextStyle textBlackSemiBold22 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold"
  );
  static final TextStyle textBlackSemiBold14 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter-SemiBold"
  );

  static final TextStyle textBlackBold14 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold"
  );

  static final TextStyle textBlackBold16 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold"
  );

  static final TextStyle textBlackLight14 = TextStyle(
          color: AppColors.accentColor,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w300,
      fontFamily: "Inter-SemiBold"
  );


  static final TextStyle textBlackLight12 = TextStyle(
          color: AppColors.accentColor,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: "Inter-SemiBold"
  );

  TextStyle heading1(Color color){
    return TextStyle(
      color: color,
      fontFamily: fontRoboto,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      height: 24
    );
  }

  TextStyle heading2(Color color){
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 24
    );
  }

  TextStyle headingReguler(Color color){
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 24
    );
  }

  TextStyle heading3(Color color){
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 24
    );
  }

  TextStyle bodyText(Color color){
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w300,
        fontSize: 14,
        height: 19.6,
        letterSpacing: 0.01
    );
  }

  TextStyle bodyTextVerySmall(Color color){
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w300,
        fontSize: 12,
        height: 18.6,

    );
  }

  TextStyle buttonLight(Color color){
    return TextStyle(
      color: color,
      fontFamily: fontRoboto,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 16.41,

    );
  }

  TextStyle button(Color color){
    return TextStyle(
      color: color,
      fontFamily: fontRoboto,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      height: 16.41,

    );
  }
}
