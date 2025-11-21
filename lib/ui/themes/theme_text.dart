import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';

String appFont = 'Oxygen';
String appFontBold = 'Montserrat';

class ThemeText {
  static TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: appFontBold
  );
  static TextStyle title2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: appFontBold
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static TextStyle subtitle2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static TextStyle headline = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: appFontBold
  );
  static TextStyle paragraphBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: appFont
  );
  static TextStyle paragraph = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: appFont
  );
  static TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: appFont
  );
}

class ThemeTextColor {
  static TextStyle primary = TextStyle(
    color: ThemePalette.primaryMain
  );
  static TextStyle secondary = TextStyle(
    color: ThemePalette.secondaryMain
  );
  static TextStyle tertiary = TextStyle(
    color: ThemePalette.tertiaryMain
  );
}
