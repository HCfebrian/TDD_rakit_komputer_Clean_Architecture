/*
*  colors.dart
*  RakitKomputer5juli
*
*  Created by WeebStudio.
*  Copyright © 2018 HerZer  Studio. All rights reserved.
    */

import 'dart:ui';


class AppColors {
  static final Color primaryColor = HexColor.fromHex("#FF304F");
  static final Color secondaryColor = HexColor.fromHex("#1F8FEB");
  static final Color accentColor = HexColor.fromHex("#002651");
  static final Color backgroundColor = HexColor.fromHex("#F7F7F7");
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}