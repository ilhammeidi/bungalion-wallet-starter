import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/utils/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/settings/account_info.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';

class SettingList extends StatelessWidget {
  SettingList({super.key}) {
     _getThemeStatus();
  }

  final RxString _themeMode = 'dark'.obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _getThemeStatus() async {
    var mode = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('appTheme') ?? 'dark';
    }).obs;

    _themeMode.value = await mode.value;
  }

  Future<void> _saveThemeStatus(String val) async {
    SharedPreferences pref = await _prefs;

    _themeMode.value = val;

    switch(val) {
      case 'dark':
        pref.setString('appTheme', val);
        Get.changeThemeMode(ThemeMode.dark);
      break;
      case 'light':
        pref.setString('appTheme', 'light');
        Get.changeThemeMode(ThemeMode.light);
      break;
      default:
        pref.setString('appTheme', 'auto');
        pref.remove('appTheme');
        
        var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(spacingUnit(2)),
      children: [
        /// UI SETTINGS
        const TitleBasicSmall(title: 'UI Settings'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.brightness_6_outlined, color: colorScheme(context).onSurface),
                title: const Text('Auto'),
                onTap: () {
                  _saveThemeStatus('auto');
                },
                trailing: Obx(() => _themeMode.value == 'auto' ?  Icon(Icons.check_circle, color: ThemePalette.primaryMain) : const Icon(Icons.circle_outlined)),
              ),
              const LineList(),
              ListTile(
                leading: Icon(Icons.dark_mode, color: colorScheme(context).onSurface),
                title: const Text('Dark Mode'),
                onTap: () {
                  _saveThemeStatus('dark');
                },
                trailing: Obx(() => _themeMode.value == 'dark' ? Icon(Icons.check_circle, color: ThemePalette.primaryMain) : const Icon(Icons.circle_outlined)),
              ),
              const LineList(),
              ListTile(
                leading: Icon(Icons.light_mode, color: colorScheme(context).onSurface),
                title: const Text('Light Mode'),
                onTap: () {
                  _saveThemeStatus('light');
                },
                trailing: Obx(() => _themeMode.value == 'light' ? Icon(Icons.check_circle, color: ThemePalette.primaryMain) : const Icon(Icons.circle_outlined) ),
              ),
            ]),
          )
        ),
        const VSpace(),

        /// AUTH PAGES
        const TitleBasicSmall(title: 'Auth Pages'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.waving_hand_outlined),
                title: const Text('Welcome Page'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/welcome');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_circle_outlined),
                title: const Text('Login'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/login');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_box_outlined),
                title: const Text('Register'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/register');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.pin),
                title: const Text('Pin OTP'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/otp');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.key_sharp),
                title: const Text('Reset Password'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed('/reset-password');
                },
               ),
               const LineList(),
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.money),
                title: const Text('PIN Setting'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.settingPin);
                },
               ),
            ])
          )
         ),
         const VSpace(),

        /// ACCOUNT SETTING
        const TitleBasicSmall(title: 'Help and Account'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.person),
                title: const Text('Account Information'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const Wrap(
                        children: [
                          AccountInfo()
                        ],
                      );
                    }
                  );
                },
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppLink.reward);
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.stars),
                title: const Text('Reward'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppLink.detailPoint);
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.checklist),
                title: const Text('Detail Point'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppLink.myVouchers);
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.local_attraction_outlined),
                title: const Text('My Coupons'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppLink.favoriteProducts);
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.dynamic_feed),
                title: const Text('Favorite Products'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppLink.favoritesContact);
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.quick_contacts_dialer),
                title: const Text('Favorite Contacts'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
               ListTile(
                onTap: () {
                  Get.toNamed(AppLink.helpSupport);
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.live_help_outlined),
                title: const Text('Help Center'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/faq');
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.help_outline),
                title: const Text('FAQ'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/contact');
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.message_outlined),
                title: const Text('Contact Admin'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
              const LineList(),
              ListTile(
                onTap: () {
                  Get.toNamed('/terms-conditions');
                },
                leading: Icon(color: colorScheme(context).onSurface, Icons.insert_drive_file_outlined),
                title: const Text('Terms and Conditions'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
              ),
            ]),
          )
        ),
        const VSpace(),

        /// GENERAL PAGES
        const TitleBasicSmall(title: 'General Pages'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
               ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.notifications_on_rounded),
                title: const Text('Notification'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.notification);
                },
               ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.flag),
                title: const Text('Intro'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.intro);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.store_mall_directory),
                title: const Text('Home Page'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.home);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.search),
                title: const Text('Search'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.search);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.manage_search_sharp),
                title: const Text('Search ID'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.searchId);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.saved_search_outlined),
                title: const Text('Search Product'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.searchProduct);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.person_search_outlined),
                title: const Text('Search Contact'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.searchContact);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.crop_square_sharp),
                title: const Text('Not Found'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.notFound);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.search_off),
                title: const Text('Search Not Found'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.searchNotFound);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// PRODUCT
        const TitleBasicSmall(title: 'Products'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.videogame_asset),
                title: const Text('Game List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.gameList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.videogame_asset_outlined),
                title: const Text('Game Purchase'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.gamePurchase);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.phone_iphone),
                title: const Text('Mobile List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.mobileList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.phone_android),
                title: const Text('Mobile Purchase'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.mobilePurchase);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.apps),
                title: const Text('App List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.appList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.grid_view),
                title: const Text('App Purchase'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.appPurchase);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.wifi),
                title: const Text('Internet List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.internetList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.wifi_tethering),
                title: const Text('Internet Billing'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.internetBilling);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.live_tv),
                title: const Text('TV List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.tvList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.monitor),
                title: const Text('TV Billing'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.tvBilling);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.medical_information),
                title: const Text('Insurance List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.insuranceList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.health_and_safety_rounded),
                title: const Text('Insurance Billing'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.insuranceBilling);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.bolt),
                title: const Text('Electricity Purchase'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.electricityPurchase);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.subscriptions),
                title: const Text('Entertainment List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.entertainmentList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.play_circle),
                title: const Text('Entertainment Purchase'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.entertainmentPurchase);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.school),
                title: const Text('Education List'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.educationList);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.school_outlined),
                title: const Text('Education Purchase'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.educationPurchase);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.folder_copy),
                title: const Text('Package Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.packageDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.dashboard),
                title: const Text('Product Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.productDetail);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// WALLET Topup
        const TitleBasicSmall(title: 'Wallet Topup'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.add_box_outlined),
                title: const Text('Topup'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topup);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.credit_card),
                title: const Text('Topup Credit Card'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topupCc);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.credit_score_sharp),
                title: const Text('Topup Virtual Account'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topupVac);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_balance),
                title: const Text('Topup Transfer'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topupTransfer);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.other_houses),
                title: const Text('Topup Merchant'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topupMerchant);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.file_upload_outlined),
                title: const Text('Topup Status'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topupStatus);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.history),
                title: const Text('Topup History'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.topupHistory);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// WALLET TRANSFER
        const TitleBasicSmall(title: 'Wallet Transfer'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.qr_code_scanner),
                title: const Text('Scan QR'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.scanqr);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.shortcut),
                title: const Text('Transfer'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.transfer);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.person),
                title: const Text('Transfer Personal'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.transferPersonal);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.list_alt),
                title: const Text('Transfer Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.transferDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.account_balance_outlined),
                title: const Text('Transfer Bank'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.transferBank);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// WALLET WITHDRAW
        const TitleBasicSmall(title: 'Wallet Withdraw'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.file_download_outlined),
                title: const Text('Withdraw'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.withdraw);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.payments),
                title: const Text('Withdraw ATM'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.withdrawAtmDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.maps_home_work),
                title: const Text('Withdraw Merchant'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.withdrawMerchantDetail);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// WALLET REQUEST
        const TitleBasicSmall(title: 'Wallet Request'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.reply),
                title: const Text('Request'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.request);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.record_voice_over),
                title: const Text('Request Personal'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.requestPersonal);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.groups),
                title: const Text('Split Bill'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.splitBillIntro);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// WALLET HISTORY
        const TitleBasicSmall(title: 'Wallet History'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.history),
                title: const Text('History'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.history);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.wallet),
                title: const Text('Wallet History'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.walletHistory);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.shopping_cart),
                title: const Text('Purchase History'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.purchaseHistory);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.receipt),
                title: const Text('Transaction Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.transactionDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.receipt_long),
                title: const Text('Purchase Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.purchaseDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.insert_chart_outlined),
                title: const Text('Report'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.report);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// PAYMENT
        const TitleBasicSmall(title: 'Payment'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.shopping_cart_checkout),
                title: const Text('Cart'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.cart);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.local_atm),
                title: const Text('Payment'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.payment);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.money),
                title: const Text('Payment PIN'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentPin);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.check_circle_outline),
                title: const Text('Payment Status'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.paymentStatus);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// PROMO
        const TitleBasicSmall(title: 'Promo'),
        PaperCard(content: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.campaign),
                title: const Text('Promo'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.promo);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.bookmark_outline),
                title: const Text('Promo Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.promoDetail);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.discount_outlined),
                title: const Text('Voucher Detail'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.voucherDetail);
                },
              ),
            ])
          )
        ),
        const VSpace(),

        /// UI LIST
        const TitleBasicSmall(title: 'UI Collection'),
        PaperCard(content:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.ads_click),
                title: const Text('Buttons'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.buttonCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.rounded_corner),
                title: const Text('Shadow and Border Radius'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.shadowRoundedCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.abc),
                title: const Text('Typography'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.typographyCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.palette_outlined),
                title: const Text('Colors and Gradient'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.colorCollection);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.format_list_bulleted),
                title: const Text('Form Input'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.formSample);
                },
              ),
              const LineList(),
              ListTile(
                leading: Icon(color: colorScheme(context).onSurface, Icons.collections_outlined),
                title: const Text('Card Collection'),
                trailing: Icon(color: colorScheme(context).onSurface, Icons.arrow_forward_ios, size: 12),
                onTap: () {
                  Get.toNamed(AppLink.cardCollection);
                },
              ),
            ]),
          )
        ),
        const VSpace(),

        /// FOOTER
        SizedBox(
          height: 50,
          child: FilledButton(
            onPressed: () {
              confirmDialog(
                context, title: 'Logout',
                content: Text('Are you sure want to logout?', textAlign: TextAlign.center),
                confirmText: 'Yes, I\'m sure',
                confirmAction: () {
                  Get.toNamed(AppLink.welcome);
                }
              );
            }, 
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red
            ),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('LOGOUT'),
              SizedBox(width: 4),
              Icon(Icons.exit_to_app)
            ])
          ),
        ),
        const VSpace(),
        Center(child: Text('${branding.name} Version: ${branding.version}', style: ThemeText.caption)),
        const VSpaceBig(),
      ]
    );
  }
}