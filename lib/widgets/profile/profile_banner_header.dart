import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:ewallet_app/widgets/cards/wallet_card.dart';
import 'package:ewallet_app/widgets/tab_menu/tab_menu_basic.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/decorations/rounded_deco_main.dart';
import 'package:get/route_manager.dart';

class ProfileBannerHeader extends SliverPersistentHeaderDelegate {
  const ProfileBannerHeader({
    required this.current,
    required this.onSelect, 
    required this.maxExtent,
    required this.minExtent
  });

  final int current;
  final Function(int) onSelect;

  @override
  final double maxExtent;
  
  @override
  final double minExtent;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final showItem = shrinkOffset < 100;
    final bool isDark = Get.isDarkMode;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        double maxWidth = constraint.maxWidth;

        return SizedBox(
          width: maxWidth,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// BACKGROUND
              Container(
                decoration: BoxDecoration(
                  color: ThemePalette.primaryMain,
                  gradient: isDark ? ThemePalette.gradientMixedMain : ThemePalette.gradientMixedLight,
                ),
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    ImgApi.profileBg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              /// CURVE DECORATION
              Positioned(
                bottom: 0,
                left: 0,
                child: RoundedDecoMain(
                  height: 70,
                  baseHeight: 20,
                  bgDecoration: BoxDecoration(
                    color: colorScheme(context).surfaceContainerLow,
                    boxShadow: [BoxShadow(
                      color: colorScheme(context).surfaceContainerLow,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    )],
                  ),
                )
              ),
          
              /// TOP BAR
              Positioned(
                top: isOnDesktopAndWeb() ? 16 : 64,
                child: AnimatedOpacity(
                  opacity: showItem ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      SizedBox(width: spacingUnit(2)),
                      AvatarNetwork(
                        radius: 15,
                        backgroundImage: userAccount.avatar,
                      ),
                      SizedBox(width: spacingUnit(1)),
                      Text(userAccount.name, style: ThemeText.title2),
                      SizedBox(width: spacingUnit(1)),
                      Icon(Icons.verified, size: 24, color: colorScheme(context).onSecondaryContainer),
                      Spacer(),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          onPressed: () {},
                          style: ThemeButton.btnSmall.merge(ThemeButton.iconBtnBlack(context)),
                          icon: Icon(Icons.link, size: 16, color: Colors.white)
                        ),
                      ),
                      SizedBox(width: spacingUnit(1)),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: IconButton(
                          onPressed: () {},
                          style: ThemeButton.btnSmall.merge(ThemeButton.iconBtnBlack(context)),
                          icon: Icon(Icons.qr_code, size: 16, color: Colors.white)
                        ),
                      ),
                      SizedBox(width: spacingUnit(2)),
                    ]),
                  ),
                ),
              ),
          
              /// CARD PROFILE
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: maxWidth,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    /// AVATAR
                    AnimatedOpacity(
                      opacity: (maxExtent - shrinkOffset)/maxExtent > 0.75 ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedScale(
                        scale: (maxExtent - shrinkOffset)/maxExtent,
                        curve: Curves.easeOutBack,
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(spacingUnit(2)),
                          child: WalletCard(
                            avatar: userAccount.avatar,
                            name: userAccount.name,
                            number: userAccount.phone,
                            onTapQr: () {},
                            onTapLink: () {},
                          ),
                        )
                      ),
                    ),

                    /// TAB MENU
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: ThemeSize.xs
                        ),
                        child: TabMenuBasic(onSelect: onSelect, current: current, menus: const ['Profile', 'Settings'])
                      ),
                    ),
                
                  ]),
                ),
              ),
            ]
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();
}