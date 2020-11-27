import 'package:flutter/material.dart';
import 'package:rakit_komputer/core/values/constant.dart';

import 'colors.dart';

class AppStyle {
  static const TextStyle textWhiteBold14 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 14,
      fontFamily: "Inter");
  static const TextStyle textWhiteBold18 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 18,
      fontFamily: "Inter");
  static const TextStyle textWhiteBold22 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 22,
      fontFamily: "Inter");
  static const TextStyle textWhite12 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: "Inter");

  static const TextStyle textWhite22 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 22,
      fontFamily: "Inter");

  static const TextStyle textWhite28 = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w600,
      fontSize: 28,
      fontFamily: "Inter");

  static final TextStyle textRedRegular14 = TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter");

  static final TextStyle textRedRegular12 = TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter");

  static final TextStyle textBlackSemiBold22 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold");
  static final TextStyle textBlackSemiBold14 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: "Inter-SemiBold");

  static final TextStyle textBlackBold14 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold");

  static final TextStyle textBlackBold16 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Inter-SemiBold");

  static final TextStyle textBlackLight14 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w300,
      fontFamily: "Inter-SemiBold");

  static final TextStyle textBlackLight12 = TextStyle(
      color: AppColors.accentColor,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: "Inter-SemiBold");

  static TextStyle heading1(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: height);
  }

  static TextStyle heading2(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: height);
  }

  static TextStyle headingReguler(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: height);
  }

  static TextStyle heading3(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: height);
  }

  static TextStyle bodyText(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w300,
        fontSize: 14,
        height: height,
        letterSpacing: 0.01);
  }

  static TextStyle bodyTextVerySmall(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w300,
        fontSize: 12,
        height: height);
  }

  static TextStyle buttonLight(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w300,
        fontSize: 14,
        height: height);
  }

  static TextStyle button(Color color, {double height}) {
    return TextStyle(
        color: color,
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: height);
  }
}
