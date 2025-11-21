import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';
import 'package:flutter/material.dart';

class ActionAppbarButton extends StatelessWidget {
  const ActionAppbarButton({super.key, required this.onTap, required this.icon});

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final double size = 40;

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme(context).surface,
        boxShadow: [ThemeShade.shadeSoft(context)]
      ),
      child: IconButton(
        iconSize: 24,
        onPressed: onTap,
        icon: Icon(icon)
      ),
    );
  }
}