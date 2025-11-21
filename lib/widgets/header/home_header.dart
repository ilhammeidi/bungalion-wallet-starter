import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/widgets/action_header/help_icon_btn.dart';
import 'package:ewallet_app/widgets/app_button/cart_button.dart';
import 'package:ewallet_app/widgets/header/top_decoration.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return AppBar(
      backgroundColor: isDark ? darken(ThemePalette.primaryDark, 0.15) : Colors.white,
      elevation: 0,
      toolbarHeight: 60,
      centerTitle: false,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: GestureDetector(
        onTap: () {
          Get.toNamed(AppLink.profile);
        },
        child: Padding(
          padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(children: [
            /// AVATAR AND USER PROFILE
            AvatarNetwork(
              radius: 20,
              backgroundImage: userAccount.avatar,
            ),
            SizedBox(width: spacingUnit(1)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(userAccount.name, style: ThemeText.subtitle),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: ThemeRadius.medium,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.motion_photos_on, color: Colors.amber, size: 14),
                  SizedBox(width: 4),
                  Text('100 Coins', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                ])
              )
            ])
          ]),
        ),
      ),
      flexibleSpace: TopDecoration(),
      automaticallyImplyLeading: false,
      actions: [
        HelpIconBtn(),
        CartButton(indent: true,)
      ],
    );
  }
}