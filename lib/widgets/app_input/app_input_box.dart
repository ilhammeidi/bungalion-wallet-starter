import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';

class AppInputBox extends StatelessWidget {
  const AppInputBox({super.key, required this.content, this.filled = false});

  final Widget content;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        color: filled ? colorScheme(context).surface : null,
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.outline
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: content,
      ),
    );
  }
}