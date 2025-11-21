import 'dart:ui';

import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GradientDeco extends StatelessWidget {
  const GradientDeco({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 250;
    final bool isDark = Get.isDarkMode;
    
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ClipRect(
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Stack(
            children: [
              Positioned(
                bottom: -50,
                left: -50,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: isDark ? ThemePalette.gradientMixedAllMain : ThemePalette.gradientMixedAllLight
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                right: -50,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: isDark ? ThemePalette.gradientMixedMain : ThemePalette.gradientMixedLight
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}