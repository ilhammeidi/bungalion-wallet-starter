import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class PointCard extends StatelessWidget {
  const PointCard({
    super.key,
    required this.color,
    required this.title,
    required this.btnText,
    required this.progress,
    this.max = 100,
    this.onTap,
    this.label = ''
  });

  final Color color;
  final String title;
  final String btnText;
  final double progress;
  final double max;
  final Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacingUnit(2)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        boxShadow: [ThemeShade.shadeSoft(context)],
        color: colorScheme(context).surface
      ),
      child: Column(
        children: [
          /// PROPERTIES
          Row(
            children: [
              /// TEXT
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: spacingUnit(1)),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Icon(Icons.stars, color: color, size: 26),
                    const SizedBox(width: 4),
                    Text('${progress.toStringAsFixed(0)}$label', style: ThemeText.title.copyWith(height: 1)),
                    Text(' / ${max.toStringAsFixed(0)}$label', style: ThemeText.subtitle2),
                  ])
                ]),
              ),
              /// BUTTON
              OutlinedButton(
                onPressed: onTap,
                style: ThemeButton.outlinedInvert(context),
                child: Text(btnText, style: ThemeText.subtitle2),
              )
            ],
          ),
          SizedBox(height: spacingUnit(1),),
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: LinearProgressIndicator(
              value: progress / max,
              backgroundColor: colorScheme(context).surfaceDim,
              color: color,
              minHeight: 10,
              semanticsLabel: 'Progress indicator',
            ),
          ),
        ],
      ),
    );
  }
}