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
  static const BorderRadiusGeometry appTileRadius = BorderRadius.all(Radius.circular(10));
  static const BorderRadiusGeometry topLeftRightRadius = BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20));
  static const BorderRadiusGeometry bottomLeftRightRadius = BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20));
  static const BorderRadiusGeometry topLeftBottomLeftRadius = BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10));
}