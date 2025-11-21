import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';

class SearchPromo extends StatelessWidget {
  const SearchPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).surfaceContainerLow
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(AppLink.searchProduct);
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.all(spacingUnit(1)),
            padding: EdgeInsets.all(spacingUnit(1)),
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: ThemeSize.sm
            ),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.xbig,
              color: colorScheme(context).surfaceDim 
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Icon(Icons.search),
              SizedBox(width: spacingUnit(1)),
              const Text('Search promos, packages, or vouchers')
            ])
          ),
        ),
      )
    );
  }
}