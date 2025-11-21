import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

List<Widget> homeActionGroup(BuildContext context, bool isFixed) {
  return [
    Badge.count(
      backgroundColor: Colors.red,
      count: 3,
      offset: const Offset(0, -1),
      child: iconBtn(context, Icons.notifications, isFixed, () {
          Get.toNamed(AppLink.notification);
        },
      ),
    ),
    iconBtn(context, Icons.help, isFixed, () {
        Get.toNamed(AppLink.faq);
      },
    )
  ];
}

Widget iconBtn(BuildContext context, IconData icon, bool isFixed, void Function() onTap) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4),
    child: IconButton(
      onPressed: onTap,
      icon: Icon(icon, size: 32, color: colorScheme(context).onSurface,),
    ),
  );
}