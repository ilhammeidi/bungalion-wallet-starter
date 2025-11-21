import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PayScanBtn extends StatelessWidget {
  const PayScanBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
        Get.toNamed(AppLink.scanqr);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          gradient: isDark ? ThemePalette.gradientPrimaryDark : LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.grey[800]!, Colors.black]
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 4,),
            Icon(Icons.qr_code, size: 32, color: Colors.white,),
            Text('PAY', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.white,))
          ],
        ),
      )
    );
  }
}