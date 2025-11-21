import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/utils/expanded_section.dart';
import 'package:ewallet_app/widgets/decorations/gradient_deco.dart';
import 'package:ewallet_app/widgets/wallet/wallet_more_menu.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/widgets/decorations/rounded_deco_main.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:get/route_manager.dart';

class WalletBalance extends StatefulWidget {
  const WalletBalance({super.key});

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  bool _isExpanded = false;
  bool _showBalance = true;

  @override
  Widget build(BuildContext context) {
    double borderRadius = 30;
    final bool isDark = Get.isDarkMode;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        /// GRADIENT BG DECORATION
        GradientDeco(),

        /// WALLET
        Padding(
          padding: EdgeInsets.only(
            left: spacingUnit(2),
            right: spacingUnit(2),
            top: spacingUnit(8),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
              gradient: isDark ? ThemePalette.gradientMixedAllLight : ThemePalette.gradientMixedLight,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
              child: Padding(
                padding: EdgeInsets.all(spacingUnit(2)),
                child: Column(children: [
                  /// BALANCE
                  _buildBalanceCard(context),
                        
                   /// MENU
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    _buildButton(context, AppMenu(Icons.history, 'History', () {
                      Get.toNamed(AppLink.history);
                    })),
                    Padding(
                      padding: EdgeInsets.only(top: spacingUnit(6)),
                      child: _buildButton(context, AppMenu(Icons.file_download_outlined, 'Request', () {
                        Get.toNamed(AppLink.request);
                      })),
                    ),
                    _buildButton(context, AppMenu(Icons.shortcut, 'Transfer', () {
                      Get.toNamed(AppLink.transfer);
                    })),
                  ]),
                  SizedBox(height: spacingUnit(1)),
                  
                  /// EXPANDABLE MORE MENU
                  ExpandedSection(
                    expand: _isExpanded,
                    child: WalletMoreMenu()
                  ),
                  SizedBox(height: spacingUnit(6)),
                ]),
              ),
            ),
          ),
        ),

        /// WALLET DECORATIONS
        RoundedDecoMain(
          toBottom: true,
          height: 100,
          bgDecoration: BoxDecoration(
            color: colorScheme(context).surfaceContainerLow,
          ),
        ),

        /// FIXED 1PX LINE BUG
        Container(
          height: 5,
          decoration: BoxDecoration(
            color: colorScheme(context).surfaceContainerLow,
              boxShadow: [
                BoxShadow(
                  color: colorScheme(context).surfaceContainerLow,
                  spreadRadius: 5,
                  blurRadius: 0,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
          )
        ),

        /// MORE MENU BUTTON
        Positioned(
          bottom: 20,
          child: IconButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            icon: _isExpanded ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(1),
              backgroundColor: colorScheme(context).primaryContainer,
              elevation: 3
            )
          ),
        )
      ],
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          setState(() {
            _showBalance = !_showBalance;
          });
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// TEXT
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(Icons.account_balance_wallet, color: Colors.black, size: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text('Your Balance', style: ThemeText.caption.copyWith(color: Colors.black, height: 1)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(_showBalance ? Icons.visibility_off : Icons.visibility, color: Colors.black, size: 12),
            ),
          ]),
          SizedBox(height: 4),
            
          /// BALANCE
          _showBalance ? Row(children: [
            Text('${userAccount.currencySymbol} ${userAccount.currency}', style: ThemeText.paragraph.copyWith(color: Colors.black)),
            SizedBox(width: 4,),
            Text('123.45', style: ThemeText.title2.copyWith(color: Colors.black, height: 0.7)),
          ]) : SizedBox(
            height: 20,
            child: Center(child: Text('Tap to show balance', style: ThemeText.paragraphBold.copyWith(color: Colors.black, height: 0.7))),
          ),
        ]),
      ),
    
      OutlinedButton(
        onPressed: () {
          Get.toNamed(AppLink.topup);
        },
        style: ThemeButton.outlinedBlack(),
        child: Row(
          children: [
            Icon(Icons.add, size: 18),
            Text('Top Up', style: ThemeText.paragraphBold),
          ],
        ),
      )
    ]);
  }

  Widget _buildButton(BuildContext context, AppMenu menu) {
    final bool isDark = Get.isDarkMode;
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return GestureDetector(
      onTap: menu.action,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: wideScreen ? 96 : 70,
          height: wideScreen ? 96 : 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? darken(ThemePalette.primaryDark, 0.15) : Colors.black,
          ),
          child: Icon(menu.icon, color: ThemePalette.secondaryLight, size: wideScreen ? 64 : 48),
        ),
        SizedBox(height: spacingUnit(1)),
        Text(
          menu.label,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          maxLines: 2,
          style: wideScreen ? ThemeText.subtitle.copyWith(color: Colors.black) : ThemeText.subtitle2.copyWith(color: Colors.black)
        )
      ])
    );
  }

}

@immutable
class AppMenu {
  final IconData icon;
  final String label;
  final VoidCallback action;

  const AppMenu(this.icon, this.label, this.action);
}