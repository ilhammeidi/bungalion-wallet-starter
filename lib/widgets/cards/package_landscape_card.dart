import 'dart:ui';

import 'package:change_case/change_case.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';

class PackageLandscapeCard extends StatelessWidget {
  const PackageLandscapeCard({
    super.key,
    this.label, required this.image, this.discount = 0,
    required this.name,
    this.vendor,
    required this.price,
    this.feature1, this.feature2,
    this.points,
    this.hasPromo = false,
    this.additionalWidget,
    this.isSelected = false,
    this.onTapDetail
  });

  final String? label;
  final String image;
  final String name;
  final Vendor? vendor;
  final double discount;
  final double price;
  final String? feature1;
  final String? feature2;
  final double? points;
  final bool hasPromo;
  final Widget? additionalWidget;
  final bool isSelected;
  final Function()? onTapDetail;

  @override
  Widget build(BuildContext context) {
    double thumbSize = 120;
    double cardHeight = 160;
    double marginLeft = 20;

    String finalPrice() => '${userAccount.currencySymbol}${(price - price * discount / 100).toStringAsFixed(2)}';

    return Stack(alignment: Alignment.centerLeft, children: [
      /// CARD CONTENT
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        height: cardHeight,
        child: PaperCard(
          content: Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              color: isSelected ? colorScheme(context).outline : Colors.transparent,
              borderRadius: ThemeRadius.medium
            ),
            child: Row(
              children: [
                SizedBox(width: thumbSize - marginLeft,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    /// TITLE
                    Text(name, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.subtitle2,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(children: [
                        vendor != null ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Row(children: [
                              AvatarNetwork(
                                radius: 10,
                                backgroundImage: vendor!.logo,
                                type: 'vendor',
                              ),
                              SizedBox(width: 4),
                              Text(vendor!.name, style: ThemeText.caption)
                            ]),
                          ),
                        ) : SizedBox.shrink(),
                        additionalWidget ?? SizedBox.shrink(),
                      ]),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          /// FEATURES
                          Row(children: [
                            feature1 != null ? _featureTag(context, feature1!, colorScheme(context).primaryContainer) : Container(),
                            SizedBox(width: 4),
                            feature2 != null ? _featureTag(context, feature2!, colorScheme(context).secondaryContainer) : Container(),
                          ]),
                          SizedBox(height: 4,),
                        
                          /// POINTS
                          points != null ? Container(
                            padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: ThemeRadius.big,
                              border: BoxBorder.all(width: 1, color: ThemePalette.primaryMain)
                            ),
                            child: Text('+${points!.toStringAsFixed(0)} Points', textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: colorScheme(context).onPrimaryContainer),),
                          ) : Container(),
                        ]),
                      ),
                      SizedBox(width: spacingUnit(1),),
                  
                      /// PRICE AND DETAIL BTN
                      isSelected ? Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(finalPrice(), style: ThemeText.subtitle.copyWith(height: 1)),
                        SizedBox(height: 8,),
                        GestureDetector(
                          onTap: onTapDetail,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: ThemeRadius.xbig,
                              border: Border.all(width: 1, color: colorScheme(context).onSurface),
                            ),
                            child: Row(
                              children: [
                                Text('More Info', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
                                Icon(Icons.arrow_forward_ios_outlined, size: 9)
                              ],
                            ),
                          ),
                        )
                      ]) : Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                        hasPromo ? Row(children: [
                          Stack(alignment: Alignment.center, children: [
                            Icon(Icons.label, size: 36, color: ThemePalette.tertiaryMain),
                            Text('-${discount.toStringAsFixed(0)}%', style: ThemeText.caption.copyWith(color: Colors.white),)
                          ]),
                          Text(
                            '${userAccount.currencySymbol} ${price.toStringAsFixed(2)}',
                            style: ThemeText.paragraph.copyWith(decoration: TextDecoration.lineThrough),
                          )
                        ]) : Container(),
                        Text(finalPrice(), style: ThemeText.subtitle)
                      ]),
                    ])
                  ]),
                ),
              ],
            )
          )
        ),
      ),

      /// IMAGE THUMBNAIL
      SizedBox(
        width: thumbSize,
        child: ClipRRect(
          borderRadius: ThemeRadius.medium,
          child: Stack(
            children: [
              /// IMAGE
              Image.network(
                image,
                fit: BoxFit.cover,
                width: thumbSize,
                height: thumbSize,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: thumbSize,
                    height: thumbSize,
                    child: ShimmerPreloader()
                  );
                },
              ),
        
              /// LEFT LABEL
              label != null ? Positioned(
                top: spacingUnit(1),
                left: spacingUnit(1),
                child: ClipRRect(
                  borderRadius: ThemeRadius.small,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: ThemeRadius.small,
                        color: colorScheme(context).surface.withValues(alpha: 0.65),
                      ),
                      child: Text(label!.toCapitalCase(), style: ThemeText.caption.copyWith(fontWeight: FontWeight.w600),)
                    )
                  ),
                ),
              ) : Container(),
        
              /// DISCOUNT LABEL
              discount > 0 ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: ThemePalette.tertiaryMain,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                    )
                  ),
                  child: Text('${discount.toStringAsFixed(0)}% OFF', textAlign: TextAlign.end, style: ThemeText.paragraphBold.copyWith(color: Colors.white, height: 1.1))
                )
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _featureTag(BuildContext context, String facility, Color color) {
    return Container(
      constraints: BoxConstraints(maxWidth: 65),
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ThemeRadius.medium
      ),
      child: Text(facility, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface.withValues(alpha: 0.75))),
    );
  }
}