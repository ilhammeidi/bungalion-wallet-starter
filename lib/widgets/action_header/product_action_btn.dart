import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

List<Widget> productActionBtn({bool invert = false}){
  return [
    SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          iconSize: 16,
          onPressed: () {
            Get.toNamed(AppLink.favoriteProducts);
          },
          style: IconButton.styleFrom(
            side: BorderSide(
              width: 1,
              color: invert ? Colors.white : ThemePalette.primaryMain
            )
          ),
          icon: Icon(Icons.favorite, color: invert ? Colors.white : ThemePalette.primaryMain)
        ),
      ),
      SizedBox(width: spacingUnit(2)),
      SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          iconSize: 16,
          onPressed: () {
            Get.toNamed(AppLink.history);
          },
          style: IconButton.styleFrom(
            side: BorderSide(
              width: 1,
              color: invert ? Colors.white : ThemePalette.primaryMain
            )
          ),
          icon: Icon(Icons.history, color: invert ? Colors.white : ThemePalette.primaryMain)
        ),
      ),
  ];
}