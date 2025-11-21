import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/models/voucher.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/widgets/promo/promo_voucher.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class VendorDetail extends StatelessWidget {
  const VendorDetail({
    super.key,
    required this.logo,
    required this.name,
    this.description,
    this.category = 'apps',
  });

  final String logo;
  final String name;
  final String? description;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        /// LOGO
        AvatarNetwork(
          radius: 48,
          backgroundImage: logo,
        ),
        Text(name, style: ThemeText.subtitle),

        /// DESCRIPTIONS
        description != null ? Text(description!, textAlign: TextAlign.center, style: ThemeText.paragraph) : Container(),
        VSpace(),

        /// BUTTONS
        FilledButton(
          onPressed: () {},
          style: ThemeButton.tonalPrimary(context),
          child: Text('VISIT WEBSITE', style: ThemeText.subtitle2)
        ),
        VSpace()
      ])
    );
  }
}

Future<void> showVendorDetail(BuildContext context) {
  Vendor dummyVendor = vendorList[8];
  
  return Get.bottomSheet(
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(children: [
        VSpaceShort(),
        GrabberIcon(),
        VSpaceShort(),
        VendorDetail(
          logo: dummyVendor.logo,
          name: dummyVendor.name,
          category: dummyVendor.category ?? 'apps',
          description: dummyVendor.description,
        ),
        LineSpace(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: TitleBasic(title: 'Available Vouchers'),
        ),
        Expanded(child: SingleChildScrollView(
          child: PromoVoucherList(dataList: voucherList,)
        ))
      ]),
    ),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: colorScheme(context).surface,
  );
}