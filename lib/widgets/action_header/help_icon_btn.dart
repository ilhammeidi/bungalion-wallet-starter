import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HelpIconBtn extends StatelessWidget {
  const HelpIconBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.help_outline_outlined, color: colorScheme(context).onSurface, size: 36),
      onPressed: () {
        Get.toNamed(AppLink.helpSupport);
      },
    );
  }
}