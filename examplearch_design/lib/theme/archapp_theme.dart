import 'package:examplearch_design/foundations/typography_foundation.dart';
import 'package:flutter/material.dart';

class ArchAppTheme {
  ArchAppTheme._();

  static TextStyle textStyleMenuTopo(int theme) {
    return ArchAppTypographyFoundation.homeTopoWhiteTextStyle;
  }

  static ThemeData themeData() {
    return ThemeData(
      primaryColor: Colors.green.shade800,
    );
  }
}
