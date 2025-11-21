import 'dart:ui';

import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({
    super.key,
    required this.name,
    this.images,
    this.thumb,
    this.vendor,
    required this.category,
    required this.price,
    this.discount = 0,
    this.points,
    this.timeleft,
    this.hasPromo = false,
    this.label = 'featured',
  });

  final String name;
  final String? images;
  final String? thumb;
  final Vendor? vendor;
  final String category;
  final double price;
  final double discount;
  final double? points;
  final String? timeleft;
  final bool hasPromo;
  final String label;

  @override
  Widget build(BuildContext context) {
    final CategoryType categoryAttr = getCategory(category);
    String finalPrice() => '${userAccount.currencySymbol}${(price - price * discount / 100).toStringAsFixed(2)}';
    final bool isDark = Get.isDarkMode;

    return Stack(alignment: Alignment.centerRight, children: [
      /// Main Content
      Container(
        padding: EdgeInsets.only(left: spacingUnit(1), right: spacingUnit(3)),
        child: ClipRRect(
          borderRadius: ThemeRadius.medium,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// CARD
              Opacity(
                opacity: isDark ? 1 : 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    image: images != null ? DecorationImage(image: NetworkImage(images!), fit: BoxFit.cover) : null,
                    gradient: images == null ? RadialGradient(
                      colors: [categoryAttr.color, colorScheme(context).surface],
                      center: Alignment.topLeft,
                      radius: 0.8,
                      stops: [0.0, 0.5], //
                    ) : null
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.only(right: spacingUnit(8)),
                  decoration: BoxDecoration(
                    color: colorScheme(context).surface.withValues(alpha: 0.75)
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(
                      top: spacingUnit(1),
                      bottom: spacingUnit(1),
                      left: spacingUnit(1),
                      right: spacingUnit(4),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                      /// TITLE
                      SizedBox(height: spacingUnit(2)),
                      Text(name, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeText.subtitle2),
                      SizedBox(height: 4),
                      vendor != null ? Row(children: [
                        AvatarNetwork(
                          radius: 8,
                          backgroundImage: vendor!.logo,
                        ),
                        SizedBox(width: 4),
                        Expanded(child: Text(vendor!.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeText.caption))
                      ]) : Container(),
                    
                      /// PRICE
                      SizedBox(height: 4),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        hasPromo ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Stack(alignment: Alignment.center, children: [
                            Icon(Icons.label, size: 36, color: ThemePalette.tertiaryMain),
                            Text('-${discount.toStringAsFixed(0)}%', style: ThemeText.caption.copyWith(color: Colors.white),)
                          ]),
                          Text(
                            '${userAccount.currencySymbol} ${price.toStringAsFixed(2)}',
                            style: ThemeText.paragraph.copyWith(decoration: TextDecoration.lineThrough),
                          )
                        ]) : SizedBox(height: spacingUnit(2),),
                        Text(
                          finalPrice(),
                          style: ThemeText.subtitle.copyWith(color: colorScheme(context).onPrimaryContainer, height: 1),
                        )
                      ])
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /// LABEL RIBBON
      Positioned(
        top: 4,
        left: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(10),
              ),
              color: ThemePalette.tertiaryMain,
            ),
            child: Text(label.toUpperCase(), textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: Colors.white),),
          ),
          Container(
            width: 8,
            height: 6,
            decoration: BoxDecoration(
              color: ThemePalette.tertiaryDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
              ),
            ),
          )
        ])
      ),

      /// THUMB
      Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: ThemeRadius.medium,
          color: ThemePalette.primaryMain,
          boxShadow: [ThemeShade.shadeMedium(context)]
        ),
        child: Column(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.medium,
                image: DecorationImage(
                  image: thumb != null ? NetworkImage(thumb!) : AssetImage(categoryAttr.image),
                  fit: BoxFit.cover
                ),
                color: lighten(categoryAttr.color, 0.15)
              ),
            ),
          ),
          points != null ? Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 4),
            child: Text('+${points!.toStringAsFixed(0)} Points', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
          ) : SizedBox.shrink(),
        ]),
      )
    ]);
  }
}