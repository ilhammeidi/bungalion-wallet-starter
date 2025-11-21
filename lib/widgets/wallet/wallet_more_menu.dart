import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/widgets/wallet/wallet_balance.dart';
import 'package:get/route_manager.dart';

class WalletMoreMenu extends StatelessWidget {
  const WalletMoreMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppMenu> moreMenus = [
      AppMenu(Icons.person, 'Transfer to Contact', () {
        Get.toNamed(AppLink.searchContact, arguments: {'routeTo': AppLink.transferPersonal});
      }),
      AppMenu(Icons.account_balance, 'Transfer to Bank', () {
        Get.toNamed(AppLink.transferBank);
      }),
      AppMenu(Icons.list_alt_rounded, 'Topup History', () {
        Get.toNamed(AppLink.topupHistory);
      }),
      AppMenu(Icons.qr_code, 'My QR Code', () {}),
      AppMenu(Icons.bar_chart_rounded, 'Finance Stats', () {
        Get.toNamed(AppLink.report);
      }),
      AppMenu(Icons.payments, 'Split Bill', () {
        Get.toNamed(AppLink.splitBillIntro);
      }),
      AppMenu(Icons.download, 'Withdraw', () {
        Get.toNamed(AppLink.withdraw);
      }),
      AppMenu(Icons.favorite_outline, 'My Favorites', () {
        Get.toNamed(AppLink.favoriteProducts);
      }),
    ];
  
    return GridView.builder(
      padding: EdgeInsets.all(spacingUnit(2)),
      physics: NeverScrollableScrollPhysics(),
      itemCount: moreMenus.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _buildMoreButton(context, moreMenus[index]);
      },
      clipBehavior: Clip.antiAlias,
    );
  }

  Widget _buildMoreButton(BuildContext context, AppMenu menu) {
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return GestureDetector(
      onTap: menu.action,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: wideScreen ? 80 : 40,
          height: wideScreen ? 80 : 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          child: Icon(menu.icon, color: Colors.black, size: wideScreen ? 64 : 28),
        ),
        SizedBox(height: spacingUnit(1)),
        Text(
          menu.label,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          maxLines: 2,
          style: wideScreen ? ThemeText.subtitle.copyWith(color: Colors.black) : ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.black)
        )
      ])
    );
  }
}