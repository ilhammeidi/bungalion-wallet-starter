import 'dart:ui';

import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.number,
    this.onTapQr,
    this.onTapLink
  });

  final String avatar;
  final String name;
  final String number;
  final Function()? onTapQr;
  final Function()? onTapLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: ThemeSize.xs
      ),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.big,
        color: Colors.black,
        boxShadow: [ThemeShade.shadeMedium(context)]
      ),
      child: ClipRRect(
        borderRadius: ThemeRadius.big,
        child: Stack(children: [
          /// GRADIENT BG DECORATION
          Positioned(
            top: 0,
            right: 0,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(40, 60)),
                    color: ThemePalette.tertiaryMain.withValues(alpha: 0.4),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(80, 60)),
                    color: ThemePalette.secondaryMain.withValues(alpha: 0.3),
                  ),
                ),
              ],),
            )
          ),
          Container(
            padding: EdgeInsets.all(spacingUnit(2)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, ThemePalette.primaryMain],
              ),
            ),
            child: Column(children: [
              /// LOGO
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(width: 24, child: Image.asset(branding.logo)),
                SizedBox(width: 4),
                Text(branding.name, style: ThemeText.paragraphBold.copyWith(color: Colors.white)),
                Spacer(),
                IconButton(
                  onPressed: onTapLink,
                  style: ThemeButton.iconBtnBlack(context),
                  icon: Icon(Icons.link, color: Colors.white)
                ),
                SizedBox(width: spacingUnit(1)),
                IconButton(
                  onPressed: onTapQr,
                  style: ThemeButton.iconBtnBlack(context),
                  icon: Icon(Icons.qr_code, color: Colors.white)
                ),
              ]),

              /// AVATAR
              Padding(
                padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
                child: Stack(alignment: Alignment.bottomRight, children: [
                  AvatarNetwork(
                    radius: 40,
                    backgroundColor: ThemePalette.primaryLight,
                    backgroundImage: avatar,
                  ),
                  Icon(Icons.verified, size: 32, color: ThemePalette.secondaryMain)
                ]),
              ),

              /// NAME AND NUMBER
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(name, style: ThemeText.subtitle.copyWith(color: Colors.white)),
                Text(number, style: ThemeText.subtitle2.copyWith(color: Colors.white)),
              ])
            ])
          )
        ]),
      )
    );
  }
}