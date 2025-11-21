import 'dart:ui';

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

class PackagePortraitCard extends StatelessWidget {
  const PackagePortraitCard({
    super.key,
    this.label, required this.image, this.discount = 0,
    required this.name,
    this.vendor,
    required this.price,
    this.feature1, this.feature2,
    this.points,
    this.timeleft,
    this.biggerThumb = false,
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
  final bool biggerThumb;
  final String? timeleft;
  final Widget? additionalWidget;
  final bool isSelected;
  final Function()? onTapDetail;

  @override
  Widget build(BuildContext context) {
    double thumbHeight = biggerThumb ? 150 : 100;
    double cardHeight = biggerThumb ? 230 : 180;

    String finalPrice() => '${userAccount.currencySymbol}${(price - price * discount / 100).toStringAsFixed(2)}';

    return Stack(children: [
      /// CARD CONTENT
      Container(
        margin: EdgeInsets.only(top: 20),
        height: cardHeight,
        child: PaperCard(
          content: Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.medium,
              color: isSelected ? colorScheme(context).outline : Colors.transparent,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
              /// TITLE
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(name, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.paragraphBold,),
                    SizedBox(height: 4),
                    Row(children: [
                      vendor != null ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Row(children: [
                            AvatarNetwork(
                              radius: 6,
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
                  ])
                ),
                isSelected ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(finalPrice(), style: ThemeText.subtitle2.copyWith(color: colorScheme(context).onPrimaryContainer)),
                ) : Container(),
              ]),
              SizedBox(height: 4,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    /// FEATURES
                    Row(children: [
                      feature1 != null ? Flexible(child: _featureTag(context, feature1!, colorScheme(context).primaryContainer)) : Container(),
                      SizedBox(width: 4),
                      feature2 != null ? Flexible(child: _featureTag(context, feature2!, colorScheme(context).secondaryContainer)) : Container(),
                    ]),
                    SizedBox(height: 4),

                    /// POINTS
                    points != null ? Container(
                      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: ThemeRadius.big,
                        border: !isSelected ? BoxBorder.all(width: 1, color: ThemePalette.primaryMain) : null
                      ),
                      child: Text('+${points!.toStringAsFixed(0)} Points', textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: colorScheme(context).onPrimaryContainer),),
                    ) : Container(),
                  ]),
                ),
                SizedBox(width: 4),

                /// PRICE
                isSelected ? GestureDetector(
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
                ) : Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
                  discount > 0 ? Text('\$${price.toStringAsFixed(2)}', style: ThemeText.caption.copyWith(decoration: TextDecoration.lineThrough, color: colorScheme(context).onSurfaceVariant)) : Container(),
                  Text(finalPrice(), style: ThemeText.subtitle2.copyWith(color: colorScheme(context).onPrimaryContainer)),
                ]),
              ])
            ])
          )
        ),
      ),

      /// IMAGE THUMBNAIL
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
        child: ClipRRect(
          borderRadius: ThemeRadius.medium,
          child: Stack(
            children: [
              /// IMAGE
              Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: thumbHeight,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: double.infinity,
                    height: thumbHeight,
                    child: ShimmerPreloader()
                  );
                },
              ),
        
              /// LEFT LABEL
              label != null ? Positioned(
                top: spacingUnit(1),
                left: spacingUnit(1),
                child: ClipRRect(
                  borderRadius: ThemeRadius.big,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: ThemeRadius.small,
                        color: colorScheme(context).surface.withValues(alpha: 0.65),
                      ),
                      child: Text(label!, style: biggerThumb ? ThemeText.paragraphBold : ThemeText.caption.copyWith(fontWeight: FontWeight.w600),)
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
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ThemeRadius.medium
      ),
      child: Text(facility, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface)),
    );
  }
}