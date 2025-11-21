import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/decorations/rounded_deco_main.dart';

class BannerPromo extends StatelessWidget {
  const BannerPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return Container(
      height: isOnDesktopAndWeb() ? 400 : 480,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark 
            ? [ThemePalette.secondaryDark, ThemePalette.primaryDark]
            : [ThemePalette.primaryLight, ThemePalette.tertiaryLight]
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// TEXT TITLE AND ILLUSTRATION
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// TEXT TITLE
              Padding(
                padding: EdgeInsets.all(spacingUnit(2)),
                child: Column(children: [
                  Text('Explore the best promos for all digital products', style: ThemeText.title2, textAlign: TextAlign.center,),
                  const SizedBox(height: 8),
                  Text(
                    branding.desc,
                    style: wideScreen ? ThemeText.subtitle : ThemeText.paragraph,
                    textAlign: TextAlign.center,
                  ),
                ])
              ),
              
              /// ILLUSTRATION
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: RoundedDecoMain(
                        height: 80,
                        bgDecoration: BoxDecoration(
                          color: colorScheme(context).surfaceContainerLow
                        ),
                      )
                    ),
                    Image.asset(ImgApi.bannerExplore, height: wideScreen ? 220 : null),
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}