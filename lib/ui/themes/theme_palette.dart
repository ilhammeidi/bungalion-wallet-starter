import 'package:flutter/material.dart';

class ThemePalette {
  // Primary
  static Color primaryMain = const Color.fromRGBO(101, 31, 255, 1);
  static Color primaryLight = const Color.fromRGBO(209, 196, 233, 1);
  static Color primaryDark = const Color.fromRGBO(49, 27, 146, 1);

  // Secondary
  static Color secondaryMain = const Color.fromRGBO(0, 229, 255, 1);
  static Color secondaryLight = const Color.fromRGBO(132, 255, 255, 1);
  static Color secondaryDark = const Color.fromRGBO(0, 96, 100, 1);

  // Tertiary
  static Color tertiaryMain = const Color.fromRGBO(255, 64, 129, 1);
  static Color tertiaryLight = const Color.fromRGBO(248, 187, 208, 1);
  static Color tertiaryDark = const Color.fromRGBO(216, 27, 96, 1);

  // Base
  static Color paperLight = Colors.white;
  static Color paperDark = const Color.fromARGB(255, 25, 25, 25);
  static Color defaultLight = Colors.grey.shade50;
  static Color defaultDark = const Color.fromARGB(255, 0, 0, 0);

  // Gradient Mixed
  static LinearGradient gradientMixedLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryLight, ThemePalette.primaryLight]
  );

  static LinearGradient gradientMixedMain = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryMain, lighten(ThemePalette.primaryMain, 0.05)]
  );

  static LinearGradient gradientMixedDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryDark, ThemePalette.primaryDark]
  );

  // Gradient Mixed All
  static LinearGradient gradientMixedAllLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.primaryLight, ThemePalette.secondaryLight, ThemePalette.tertiaryLight]
  );

  static LinearGradient gradientMixedAllMain = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryMain, ThemePalette.primaryMain, ThemePalette.tertiaryMain]
  );

  static LinearGradient gradientMixedAllDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryDark, ThemePalette.primaryDark, ThemePalette.tertiaryDark]
  );

  // Gradient Primary
  static LinearGradient gradientPrimaryLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.primaryLight, ThemePalette.primaryMain]
  );

  static LinearGradient gradientPrimaryDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.primaryMain, ThemePalette.primaryDark]
  );

   // Gradient Secondary
  static LinearGradient gradientSecondaryLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryMain, ThemePalette.secondaryLight]
  );

  static LinearGradient gradientSecondaryDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[ThemePalette.secondaryMain, ThemePalette.secondaryDark]
  );
}

ColorScheme colorScheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount / 1.5).clamp(0.0, 1.0));

  return hslLight.toColor();
}