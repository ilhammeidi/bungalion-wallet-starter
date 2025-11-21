import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:flutter/material.dart';

enum BtnSize { big, medium, small }

class TagButton extends StatelessWidget {
  const TagButton({
    super.key,
    required this.text,
    this.selected = false,
    this.onPressed,
    this.size = BtnSize.medium,
  });

  final String text;
  final bool selected;
  final Function()? onPressed;
  final BtnSize size;

  @override
  Widget build(BuildContext context) {
    double fontSize;
    FontWeight fontWeight = FontWeight.normal;

    switch (size) {
      case BtnSize.big:
        fontSize = 16.0;
        fontWeight = FontWeight.w500;
        break;
      case BtnSize.medium:
        fontSize = 12.0;
        fontWeight = FontWeight.w500;
        break;
      case BtnSize.small:
        fontSize = 11.0;
        break;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: ThemeRadius.big,
          border: Border.all(color: selected ? colorScheme(context).onSurface : colorScheme(context).outlineVariant),
          color: selected ? colorScheme(context).onSurface : Colors.transparent
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: selected ? colorScheme(context).surface : colorScheme(context).onSurface),
        ),
      ),
    );
  }
}