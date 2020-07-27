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
  static const BorderRadiusGeometry appMenuRadius = BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20));
}