import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/colors.dart';

class AppStyle {
  static const TextStyle textWhiteBold14 = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
    fontSize: 14,
    fontFamily: "Inter"
  );
  static const TextStyle textWhite12 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: "Inter"
  );
  
  static const TextStyle textWhite28 = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
    fontSize: 28,
    fontFamily: "Inter"

  );

  static const TextStyle textRedRegular14 = TextStyle(
    color: AppColors.accentText,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "Inter"
  );

  static const TextStyle textRedRegular12 = TextStyle(
      color: AppColors.accentText,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter"
  );

  static const TextStyle textBlackSemiBold22 = TextStyle(
      color: AppColors.primaryText,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold"
  );
  static const TextStyle textBlackSemiBold14 = TextStyle(
      color: AppColors.primaryText,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter-SemiBold"
  );

  static const TextStyle textBlackBold14 = TextStyle(
      color: AppColors.primaryText,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold"
  );

  static const TextStyle textBlackBold16 = TextStyle(
      color: AppColors.primaryText,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold"
  );

  static const TextStyle textBlackLight14 = TextStyle(
          color: AppColors.primaryText,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: "Inter-SemiBold"
  );


  static const TextStyle textBlackLight12 = TextStyle(
          color: AppColors.primaryText,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: "Inter-SemiBold"
  );
}
