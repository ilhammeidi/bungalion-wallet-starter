import 'package:ewallet_app/app/app_link.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:get/route_manager.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, this.indent = true});

  final bool indent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: indent ? spacingUnit(1) : 0),
      child: IconButton(
        onPressed: () {
          Get.toNamed(AppLink.cart);
        },
        icon: Badge.count(
          count: 2,
          child: Icon(Icons.shopping_cart_outlined, color: colorScheme(context).onSurface, size: 36)
        ),
      ),
    );
  }
}