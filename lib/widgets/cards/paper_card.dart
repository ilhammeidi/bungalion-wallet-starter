import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';

class PaperCard extends StatelessWidget {
  const PaperCard({
    super.key,
    required this.content,
    this.coloured = false,
    this.withGradient = false,
    this.colouredBorder = false,
    this.flat = false,
  });

  final Widget content;
  final bool coloured;
  final bool withGradient;
  final bool colouredBorder;
  final bool flat;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coloured ? ThemePalette.primaryMain : Theme.of(context).colorScheme.surface,
        borderRadius: ThemeRadius.big,
        gradient: withGradient ? ThemePalette.gradientMixedAllLight : null,
        boxShadow: !flat ? [ThemeShade.shadeSoft(context)] : null,
        border: flat ? Border.all(
          width: 1,
          color: colouredBorder ? ThemePalette.primaryMain : Theme.of(context).colorScheme.outline
        ) : null
      ),
      child: content
    );
  }
}