/*
*  radii.dart
*  RakitKomputer5juli
*
*  Created by WeebStudio.
*  Copyright © 2018 HerZer  Studio. All rights reserved.
    */

import 'package:flutter/rendering.dart';


class Radii {
  static const BorderRadiusGeometry appFormRadius = BorderRadius.all(Radius.circular(25));
  static const BorderRadiusGeometry appTileRadius8 = BorderRadius.all(Radius.circular(8));
  static const BorderRadiusGeometry appFilterRadius2 = BorderRadius.all(Radius.circular(2));
  static const BorderRadiusGeometry topLeftRightRadius20 = BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20));
  static const BorderRadiusGeometry topLeftRightRadius8 = BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(8));
  static const BorderRadiusGeometry bottomLeftRightRadius20 = BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20));
  static const BorderRadiusGeometry topLeftBottomLeftRadius20 = BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10));
}