import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({super.key, this.invert = false, this.onPressed, this.highContrast = false});

  final bool invert;
  final bool highContrast;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      icon: Icon(
        Icons.share,
        color: invert ? Colors.white : colorScheme(context).onSurface,
        shadows: highContrast ? const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)] : null,
      )
    );
  }
}