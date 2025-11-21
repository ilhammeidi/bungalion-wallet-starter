import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class TitleAction extends StatelessWidget {
  const TitleAction({
    super.key,
    required this.title,
    required this.textAction,
    required this.onTap,
    this.desc,
    this.size = 'default'
  });

  final String title;
  final String? desc;
  final String textAction;
  final String size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Text(size == 'small' ? title.toUpperCase() : title, style: size == 'small' ? ThemeText.headline : ThemeText.subtitle),
          ),
          size == 'small' ? TextButton(
            onPressed: () => {
              onTap()
            },
            style: ThemeButton.btnSmall,
            child: Text(textAction)
          ) : OutlinedButton(
            onPressed: () => {
              onTap()
            },
            style: ThemeButton.btnSmall.merge(ThemeButton.outlinedPrimary(context)),
            child: Row(
              children: [
                Text(
                  textAction.toUpperCase(),
                  style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 2),
                Icon(Icons.arrow_forward_ios_outlined, size: 12)
              ],
            )
          )
        ]),
        desc != null ? Text(desc!, style: ThemeText.caption, overflow: TextOverflow.ellipsis,) : Container(),
      ],
    );
  }
}

class TitleActionSetting extends StatelessWidget {
  const TitleActionSetting({
    super.key,
    required this.title,
    this.desc,
    required this.textAction,
    required this.onTap
  });

  final String title;
  final String? desc;
  final String textAction;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: ThemeText.title2),
            const SizedBox(height: 4),
            desc != null ? Text(desc!, overflow: TextOverflow.ellipsis,) : Container(),
          ],
        ),
      ),
      SizedBox(width: spacingUnit(2)),
      TextButton(
        onPressed: () => {
          onTap()
        },
        child: Text(textAction, style: TextStyle(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain))
      )
    ]);
  }
}