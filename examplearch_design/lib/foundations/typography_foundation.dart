import 'package:examplearch_design/foundations/colors_foundation.dart';
import 'package:examplearch_design/tokens/typography.dart';
import 'package:flutter/material.dart';

class ArchAppTypographyFoundation {
  ArchAppTypographyFoundation();

  //font family
  static const String familyHeadings = ArchAppTypography.familyRoboto;
  static const String familyBody = ArchAppTypography.familyRoboto;

  //sizes
  static const double fontSizeH1 = ArchAppTypography.sizeXXL;
  static const double fontSizeH2 = ArchAppTypography.sizeXL;
  static const double fontSizeH3 = ArchAppTypography.sizeLG;
  static const double fontSizeH4 = ArchAppTypography.sizeMD;
  static const double fontSizeH5 = ArchAppTypography.sizeSL;
  static const double fontSizeH6 = ArchAppTypography.sizeSM;
  static const double fontSizeBodyText = ArchAppTypography.sizeSM;
  static const double fontSizeLabel = ArchAppTypography.sizeXS;
  static const double fontSizeLink = ArchAppTypography.sizeXS;
  static const double fontSizeSmall = ArchAppTypography.sizeXXS;
  static const double fontSizeXSmall = ArchAppTypography.sizeXXS;

  //font weight
  static const FontWeight fontWeightNormal = FontWeight.w300;
  static const FontWeight fontWeightBold = FontWeight.w700;

  //Style
  static const TextStyle buttonStyle = TextStyle();

  static const TextStyle homeTopoWhiteTextStyle = TextStyle(
      fontFamily: ArchAppTypographyFoundation.familyBody,
      fontWeight: ArchAppTypographyFoundation.fontWeightNormal,
      color: ArchAppColorsFoundation.colorWhite,
      fontSize: ArchAppTypographyFoundation.fontSizeBodyText);
  
}
