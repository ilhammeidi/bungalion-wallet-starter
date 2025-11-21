import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      Text('Account Info', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      const VSpaceShort(),

      /// ACCOUNT INFO
      SizedBox(
        height: 400,
        child: Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(children: [
              Text('Name', style: ThemeText.paragraphBold.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(userAccount.name),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: const LineList(),
            ),
            Row(children: [
              Text('Email', style: ThemeText.paragraphBold.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text('name@mail.com'),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: const LineList(),
            ),
            Row(children: [
              Text('Phone Number/WhatsApp', style: ThemeText.paragraphBold.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text('+621234567890'),
            ]),
            const VSpaceBig(),
            SizedBox(
              width: 250,
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  Get.toNamed(AppLink.editProfile);
                },
                style: ThemeButton.outlinedInvert(context),
                child: Text('Change Profile', style: ThemeText.subtitle)
              ),
            ),
            const VSpaceShort(),
            SizedBox(
              width: 250,
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  Get.toNamed(AppLink.editPassword);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red.shade300),
                  foregroundColor: Colors.red.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: ThemeRadius.xbig,
                  ),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.lock, color: Colors.red.shade300),
                  Text('Change Password', style: ThemeText.subtitle),
                ])
              ),
            ),
            const VSpaceBig(),
          ])
        ),
      ),
    ]);
  }
}