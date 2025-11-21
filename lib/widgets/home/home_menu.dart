import 'package:change_case/change_case.dart';
import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/models/product.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/widgets/home/home_more_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
        decoration: BoxDecoration(
          color: colorScheme(context).surfaceContainerLow,
          borderRadius: ThemeRadius.medium
        ),
        constraints: const BoxConstraints(
          minHeight: 100,
          maxHeight: 600,
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productList.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: _itemBuilder,
          clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final bool isDark = Get.isDarkMode;
    final bool wideScreen = ThemeBreakpoints.smUp(context);
    final double scaleFactor = wideScreen ? 2 : 1;

    List<AppMenu> menuList = [
      AppMenu(productList[7], () { Get.toNamed(AppLink.mobilePurchase); }), /// Mobile
      AppMenu(productList[5], () { Get.toNamed(AppLink.internetList); }), /// Internet
      AppMenu(productList[4], () { Get.toNamed(AppLink.gameList); }), /// Games
      AppMenu(productList[2], () { Get.toNamed(AppLink.electricityPurchase); }), /// Electric
      AppMenu(productList[6], () { Get.toNamed(AppLink.insuranceList); }), /// Insurance
      AppMenu(productList[1], () { Get.toNamed(AppLink.educationList); }), /// Education
      AppMenu(productList[3], () { Get.toNamed(AppLink.entertainmentList); }), /// Streaming
      AppMenu(productList[8], () { Get.toNamed(AppLink.tvList); }), /// TV
      AppMenu(productList[0], () { Get.toNamed(AppLink.appList); }), /// APPS
      AppMenu(productList[9], () async { /// More
        Get.bottomSheet(
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: EdgeInsets.all(spacingUnit(2)),
            child: Column(children: [
              VSpaceShort(),
              GrabberIcon(),
              VSpaceShort(),

              Expanded(child: HomeMoreMenu())
            ])
          ),
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          backgroundColor: colorScheme(context).surface,
        );
      }),
    ];
    
    AppMenu menu = menuList[index];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: menu.action,
      key: ObjectKey(menu),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50 * scaleFactor,
            height: 50 * scaleFactor,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 45 * scaleFactor,
                  height: 45 * scaleFactor,
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.medium,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: isDark ? [0, 1] : [0.25, 1],
                      colors: [
                        colorScheme(context).surfaceContainerLowest.withValues(alpha: 0),
                        menu.product.color
                      ],
                    ),
                  ),
                ),
                Image(
                  image: AssetImage(menu.product.icon),
                  width: 50 * scaleFactor,
                  height: 50 * scaleFactor,
                ),
              ],
            ),
          ),
          SizedBox(height: spacingUnit(1)),
          Text(
            menu.product.name.toCapitalCase(),
            style: ThemeText.caption.copyWith(fontSize: wideScreen ? 22 : 12, fontWeight: FontWeight.bold, height: 1),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ]
      ),
    );
  }
}

@immutable
class AppMenu {
  final Product product;
  final VoidCallback action;

  const AppMenu(this.product, this.action);
}