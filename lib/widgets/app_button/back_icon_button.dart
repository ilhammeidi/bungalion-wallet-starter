import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key, required this.onTap, this.invert = false, this.floating = false});

  final Function() onTap;
  final bool invert;
  final bool floating;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: floating ? EdgeInsets.zero : EdgeInsets.all(12),
      width: 32,
      height: 32,
      child: IconButton(
        iconSize: 16,
        onPressed: onTap,
        style: IconButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: invert ? Colors.white : colorScheme(context).onSurface
          )
        ),
        icon: Icon(Icons.arrow_back_ios_new, color: invert ? Colors.white : colorScheme(context).onSurface)
      ),
    );
  }
}