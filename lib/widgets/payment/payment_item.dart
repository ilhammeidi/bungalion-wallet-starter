import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    super.key,
    required this.title,
    required this.value,
    this.indent = true,
    this.boldValue = false,
  });

  final String title;
  final String value;
  final bool indent;
  final bool boldValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.only(
        bottom: 8,
        top: 0,
        left: indent ? spacingUnit(3) : 0,
        right: indent ? spacingUnit(3) : 0
      ),
      title: Text(title, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface)),
      trailing: Text(
        value,
        style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface, fontWeight: boldValue ? FontWeight.bold : FontWeight.normal))
    );
  }
}