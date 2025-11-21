import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/widgets/action_header/help_icon_btn.dart';
import 'package:ewallet_app/widgets/app_button/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';

class HeaderPromo extends StatelessWidget {
  const HeaderPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.all(spacingUnit(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// GIFT BUTTON
          GestureDetector(
            onTap: () {
              Get.toNamed(AppLink.reward);
            },
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: ThemeRadius.big,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.motion_photos_on, color: isDark ? ThemePalette.secondaryMain : ThemePalette.primaryMain),
                SizedBox(width: 2,),
                Text('Claim Your Point Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),),
              ]),
            ),
          ),
          /// ACTIONS HEADER BUTTON
          Row(children: [
            HelpIconBtn(),
            CartButton(indent: true,)
          ])
        ],
      ),
    );
  }
}