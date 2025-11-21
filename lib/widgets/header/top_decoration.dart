import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:get/route_manager.dart';

class TopDecoration extends StatelessWidget {
  const TopDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return SizedBox(
      height: 80,
      child: ClipRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Opacity(
            opacity: isDark ? 1 : 0.5,
            child: Stack(children: [
              Positioned(
                top: -10,
                left: 10,
                child: Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(150, 30)),
                    color: ThemePalette.primaryMain
                  ),
                ),
              ),
              Positioned(
                top: -40,
                right: -50,
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(200, 60)),
                    color: ThemePalette.tertiaryMain
                  ),
                ),
              ),
              Positioned(
                top: -50,
                right: -10,
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(200, 60)),
                    color: ThemePalette.secondaryMain
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}