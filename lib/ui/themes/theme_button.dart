import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';

class ThemeButton {
  static BorderRadius buttonRadius = ThemeRadius.xbig;

  // Filled Button
  static ButtonStyle primary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.primaryMain,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle secondary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.secondaryMain,
    foregroundColor: ThemePalette.secondaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle tertiary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.tertiaryMain,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  static ButtonStyle white = FilledButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  static ButtonStyle black = FilledButton.styleFrom(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  static ButtonStyle invert(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return OutlinedButton.styleFrom(
      backgroundColor: isDark ? ThemePalette.primaryMain : Colors.black,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle invert2(BuildContext context) {
    return OutlinedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Outlined Button
  static ButtonStyle outlinedPrimary(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: isDark ? ThemePalette.primaryLight : ThemePalette.primaryMain,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: isDark ? ThemePalette.primaryLight : ThemePalette.primaryMain,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedSecondary(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: isDark ? ThemePalette.secondaryMain : ThemePalette.secondaryDark,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: isDark ? ThemePalette.secondaryMain : ThemePalette.secondaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedTertiary() {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: ThemePalette.tertiaryMain
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: ThemePalette.tertiaryMain,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedRed() {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Colors.redAccent
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedBlack() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.black
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedWhite() {
    return OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.white
      ),
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedInvert(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.onSurface
      ),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedInvert2(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.surface
      ),
      foregroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedDefault(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: Theme.of(context).colorScheme.outlineVariant
      ),
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Tonal Button
  static ButtonStyle tonalPrimary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalSecondary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalTertiary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalDefault(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      foregroundColor: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Text Button
  static ButtonStyle textPrimary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle textSecondary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle textTertiary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }
  static ButtonStyle textInvert(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Button Size
  static ButtonStyle btnExtraBig = TextButton.styleFrom(
    minimumSize: const Size(350, 70),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
  );

  static ButtonStyle btnBig = TextButton.styleFrom(
    minimumSize: const Size(200, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
  );

  static ButtonStyle btnMedium = TextButton.styleFrom(
    minimumSize: const Size(100, 40),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  
  static ButtonStyle btnSmall = TextButton.styleFrom(
    minimumSize: const Size(80, 30),
    padding: const EdgeInsets.symmetric(horizontal: 8),
  );

  // Icon Button with Background
  static ButtonStyle iconBtn(BuildContext context) {
    return IconButton.styleFrom(
      padding: const EdgeInsets.all(1),
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 3
    );
  }

  static ButtonStyle iconBtnBlack(BuildContext context) {
    return IconButton.styleFrom(
      padding: const EdgeInsets.all(1),
      backgroundColor: Colors.black,
      elevation: 3
    );
  }
}
