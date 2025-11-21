import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/app_button/action_appbar_button.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScanQr extends StatelessWidget {
  const ScanQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 56,
        leading: Padding(
          padding: EdgeInsets.only(left: spacingUnit(2)),
          child: ActionAppbarButton(
            icon: Icons.arrow_back_ios_new,
            onTap: () {
              Get.back();
            }, 
          ),
        ),
        actions: [
          ActionAppbarButton(
            icon: Icons.bolt,
            onTap: () {}, 
          ),
          SizedBox(width: spacingUnit(2))
        ],
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/dummy/sample_qr.jpg'), fit: BoxFit.cover)
          ),
        ),
        Container(
          height: 240,
          constraints: BoxConstraints(
            maxWidth: ThemeSize.sm
          ),
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: spacingUnit(3)),
          child: Center(
            child: PaperCard(content: Padding(
              padding: EdgeInsets.all(spacingUnit(2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('More Transfers', style: ThemeText.subtitle2,),
                  SizedBox(height: spacingUnit(2)),
                  Row(children: [
                    Expanded(child: _gradientBtn(context, Icons.person, 'Personal Transfer', ThemePalette.gradientMixedLight, () {
                      Get.toNamed(AppLink.transferPersonal);
                    })),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(child: _gradientBtn(context, Icons.account_balance, 'Bank Transfer', ThemePalette.gradientMixedAllLight, () {
                      Get.toNamed(AppLink.transferBank);
                    })),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(child: _gradientBtn(context, Icons.qr_code, 'Upload QR Code', ThemePalette.gradientPrimaryLight, () {})),
                  ]),
                ],
              ),
            )),
          ),
        )
      ]),
    );
  }

  Widget _gradientBtn(
    BuildContext context,
    IconData icon, String text, Gradient gradient,
    Function() onTap
  ) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        gradient: gradient
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorScheme(context).surface,
        ),
        child: FilledButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 60),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, size: 24, color: colorScheme(context).onSurface),
            SizedBox(height: 4,),
            Text(text, textAlign: TextAlign.center, style: ThemeText.paragraphBold.copyWith(color: colorScheme(context).onSurface))
          ])
        ),
      ),
    );
  }
}