import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.primaryTxtBtn,
    this.secondaryTxtBtn,
    this.primaryAction,
    this.secondaryAction,
  });

  final String image;
  final String title;
  final String desc;
  final String? primaryTxtBtn;
  final String? secondaryTxtBtn;
  final Function()? primaryAction;
  final Function()? secondaryAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: ThemeSize.sm
        ),
        padding: EdgeInsets.all(spacingUnit(3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ILLUSTRATION IMAGE
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme(context).surface.withValues(alpha: 0),
                        colorScheme(context).secondaryContainer,
                      ]
                    )
                  ),
                ),
                Image.asset(image, height: 256, fit: BoxFit.contain),
              ],
            ),

            /// TEXT
            const VSpaceShort(),
            Text(title, textAlign: TextAlign.center, style: ThemeText.title),
            Text(desc, textAlign: TextAlign.center, style: ThemeText.headline),

            /// BUTTON ACTION
            const VSpace(),
            primaryTxtBtn != null ? SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                onPressed: primaryAction,
                style: ThemeButton.tonalPrimary(context),
                child: Text(primaryTxtBtn!, style: ThemeText.subtitle2),
              )
            ) : Container(),
            const VSpaceShort(),
            secondaryTxtBtn != null ? SizedBox(
              height: 50,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: secondaryAction,
                style: ThemeButton.outlinedInvert(context),
                child: Text(secondaryTxtBtn!, style: ThemeText.subtitle2,),
              )
            ) : Container(),
          ],
        ),
      )
    );
  }
}