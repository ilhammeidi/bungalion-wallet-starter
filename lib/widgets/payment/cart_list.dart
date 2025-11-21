import 'package:ewallet_app/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/models/cart_item.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:get/route_manager.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: cartItems.length,
          padding: EdgeInsets.all(spacingUnit(2)),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final item = cartItems[index];
            final double discount = item.discount * item.price / 100;
            final double totalPrice = item.price - discount;
        
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: 0),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: ThemeRadius.small,
                      image: DecorationImage(image: NetworkImage(item.thumbnail), fit: BoxFit.fitHeight)
                    ),
                    width: 40,
                    height: 40,
                  ),
                  title: Text(item.name, style: ThemeText.paragraphBold),
                  subtitle: Text(item.number),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      item.discount > 0 ? Text('${userAccount.currencySymbol}${item.price.toStringAsFixed(2)}', style: ThemeText.paragraph.copyWith(color: colorScheme(context).onSurfaceVariant, decoration: TextDecoration.lineThrough),) : SizedBox.shrink(),
                      Text('${userAccount.currencySymbol}${totalPrice.toStringAsFixed(2)}', style: ThemeText.subtitle.copyWith(height: 1, color: colorScheme(context).onSurface),),
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        item.discount > 0 ? 
                          Row(
                            children: [
                              Icon(Icons.discount_outlined, color: ThemePalette.secondaryMain, size: 12),
                              Text(' Discount ${item.discount.toStringAsFixed(0)}%: -${userAccount.currencySymbol}$discount', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: ThemePalette.secondaryMain,)),
                            ],
                          ) : Container(),
                        Text('Admin fee: ${userAccount.currencySymbol}${item.adminFee}', style: ThemeText.caption),
                      ],
                    ),
                    InkWell(
                      borderRadius: ThemeRadius.medium,
                      onTap: () {},
                      child: Row(children: [
                        Icon(Icons.remove_circle_outline, color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text('Remove', style: ThemeText.caption.copyWith(color: Colors.red))
                      ])
                    ),
                  ]),
                ),
                index < cartItems.length - 1 ? Divider(color: colorScheme(context).outline, height: spacingUnit(3), thickness: 1) : Container(),
              ],
            );
          },
        ),
      ),

      /// TOTAL PRICE
      Container(
        margin: EdgeInsets.all(spacingUnit(1)),
        decoration: BoxDecoration(
          borderRadius: ThemeRadius.medium,
          color: isDark ? ThemePalette.secondaryDark : ThemePalette.primaryLight, 
        ),
        child: ListTile(
          minTileHeight: 0,
          contentPadding: EdgeInsets.only(
            left: spacingUnit(2),
            right: spacingUnit(2),
            bottom: 0,
            top: 0,
          ),
          title: Text('Total', style: ThemeText.subtitle,),
          trailing: Text('${userAccount.currencySymbol}28', style: ThemeText.subtitle.copyWith(color: colorScheme(context).onSurface),),
        )
      )
    ]);
  }
}