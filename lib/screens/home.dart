import 'package:ewallet_app/models/purchase_history.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:ewallet_app/widgets/bottom_nav/bottom_nav_menu.dart';
import 'package:ewallet_app/widgets/bottom_nav/pay_scan_btn.dart';
import 'package:ewallet_app/widgets/header/home_header.dart';
import 'package:ewallet_app/widgets/home/featured_game_list.dart';
import 'package:ewallet_app/widgets/home/featured_mobile_list.dart';
import 'package:ewallet_app/widgets/home/home_menu.dart';
import 'package:ewallet_app/widgets/home/partners_logo.dart';
import 'package:ewallet_app/widgets/home/promo_game_package.dart';
import 'package:ewallet_app/widgets/home/promo_mobile_credit.dart';
import 'package:ewallet_app/widgets/home/active_billings.dart';
import 'package:ewallet_app/widgets/home/promo_slider.dart';
import 'package:ewallet_app/widgets/profile/contact_panel.dart';
import 'package:ewallet_app/widgets/profile/latest_transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';
import 'package:ewallet_app/utils/custom_tooltip.dart';
import 'package:ewallet_app/widgets/wallet/wallet_balance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TooltipController _tooltipRef = TooltipController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final bool isDark = Get.isDarkMode;

  final String _key = 'finishedGuide';

  bool _isDoneGuide = false;

  void _checkFinishedGuide() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDoneGuide = prefs.getBool(_key) ?? false;
    });
  }

  @override
  void initState() {
    _tooltipRef.onDone(() async {
      SharedPreferences pref = await _prefs;
      pref.setBool(_key, true);
      setState(() {
        _isDoneGuide = true;
      });
    });

    _checkFinishedGuide();
    super.initState();
  }

  @override
  void dispose() {
    _tooltipRef.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayTooltipScaffold(
      overlayColor: Colors.black.withValues(alpha: 0.65),
      tooltipAnimationCurve: Curves.linear,
      tooltipAnimationDuration: const Duration(milliseconds: 1000),
      controller: _tooltipRef,
      startWhen: (initializedWidgetLength) async {
        await Future.delayed(const Duration(milliseconds: 500));
        return initializedWidgetLength == 1 && !_isDoneGuide;
      },
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: HomeHeader(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// WALLET AND MENU
              isOnDesktopAndWeb() ? VSpaceShort() : SizedBox(height: spacingUnit(8)),
              OverlayTooltipItem(
                displayIndex: 0,
                tooltip: (controller) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: MTooltip(title: 'Topup your balance, make a transfer or request and check your finance stats', controller: controller),
                ),
                tooltipVerticalPosition: TooltipVerticalPosition.BOTTOM,
                tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
                child: WalletBalance(),
              ),
              OverlayTooltipItem(
                displayIndex: 1,
                tooltip: (controller) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: MTooltip(title: 'Purchase your favorite packages, vouchers, topup credit or even pay monthly billings', controller: controller),
                ),
                tooltipVerticalPosition: TooltipVerticalPosition.BOTTOM,
                tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
                child: HomeMenu(),
              ),
              VSpaceBig(),
              PromoSlider(),
              VSpaceBig(),

              /// PERSONAL SECTIONS
              ActiveBillings(),
              VSpaceBig(),
              ContactPanel(),
              VSpaceBig(),
              LatestTransactions(
                items: purchaseList,
                counts: 3,
              ),
              VSpaceBig(),

              /// PROMO AND FEATURES
              FeaturedGameList(),
              VSpaceBig(),
              PromoGamePackage(),
              VSpaceBig(),
              FeaturedMobileList(),
              VSpaceBig(),
              PromoMobileCredit(),
              VSpaceBig(),
              PartnersLogo(),
              SizedBox(height: 120)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: OverlayTooltipItem(
          displayIndex: 2,
          tooltip: (controller) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: MTooltip(title: 'Scan QR Code for fast payment', controller: controller),
          ),
          tooltipVerticalPosition: TooltipVerticalPosition.TOP,
          tooltipHorizontalPosition: TooltipHorizontalPosition.CENTER,
          child: PayScanBtn(),
        ),
        bottomNavigationBar: const BottomNavMenu(),
      ),
    );
  }
  
}