import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.bigText,
    required this.title,
    required this.background,
    required this.foreground,
    required this.infoGraphic
  });

  final String bigText;
  final String title;
  final Color background;
  final Color foreground;
  final Widget infoGraphic;

  @override
  Widget build(BuildContext context) {
    TextStyle styleTxt = TextStyle(color: foreground);

    return Container(
      padding: EdgeInsets.all(spacingUnit(2)),
      decoration: BoxDecoration(
        color: background,
        borderRadius: ThemeRadius.big,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, children: [
        infoGraphic,
        SizedBox(width: spacingUnit(1)),
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(bigText, style: styleTxt.copyWith(fontSize: 32, fontWeight: FontWeight.bold)),
            Text(title, style: ThemeText.paragraphBold,),
          ])
        )
      ]),
    );
  }
}