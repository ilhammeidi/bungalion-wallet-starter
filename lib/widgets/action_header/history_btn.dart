import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';

class HistoryBtn extends StatelessWidget {
  const HistoryBtn({
    super.key,
    this.invert = false,
    this.onPressed,
    this.highContrast = false,
    this.hasBg = false
  });

  final bool invert;
  final bool hasBg;
  final bool highContrast;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      style: hasBg ? IconButton.styleFrom(
        backgroundColor: colorScheme(context).surface,
        shadowColor: Colors.grey.withValues(alpha: 0.5),
        elevation: 3
      ) : null,
      icon: Icon(
        Icons.notes,
        size: 38,
        shadows: highContrast ? const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)] : null,
        color: invert ? Colors.white : colorScheme(context).onSurface
      )
    );
  }
}