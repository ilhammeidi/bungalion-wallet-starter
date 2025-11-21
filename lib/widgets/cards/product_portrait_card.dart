import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/credit.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

class ProductPortraitCard extends StatelessWidget {
  const ProductPortraitCard({
    super.key,
    required this.title,
    this.thumb,
    required this.category,
    required this.type,
    required this.price,
    required this.discount,
    required this.points,
    this.hasPromo = false,
    this.additionalWidget,
    this.label,
    this.isSelected = false,
    this.mini = false,
    this.onTapDetail
  });

  final String title;
  final String? thumb;
  final String category;
  final CreditType type;
  final double price;
  final double discount;
  final double? points;
  final bool hasPromo;
  final Widget? additionalWidget;
  final String? label;
  final bool isSelected;
  final bool mini;
  final Function()? onTapDetail;

  @override
  Widget build(BuildContext context) {
    final CategoryType categoryAttr = getCategory(category);
    String finalPrice() => '${userAccount.currencySymbol}${(price - price * discount / 100).toStringAsFixed(2)}';
    
    return Stack(
      children: [
        /// CARD
        Container(
          margin: EdgeInsets.only(left: hasPromo ? 6 : 0),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.big,
            color: categoryAttr.color,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[colorScheme(context).outline, categoryAttr.color]
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: isSelected ? colorScheme(context).outline : colorScheme(context).surface
            ),
            child: Column(children: [
              /// CATEGORY
              Row(mainAxisAlignment: hasPromo ? MainAxisAlignment.end : MainAxisAlignment.center, children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: spacingUnit(1)),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.medium,
                    color: categoryAttr.color.withValues(alpha: 0.25),
                  ),
                  child: Text(category.toUpperCase(), style: ThemeText.caption.copyWith(color: categoryAttr.color),),
                )
              ]),
              SizedBox(height: spacingUnit(1)),

              /// PROPERTIES
              Column(children: [
                !mini ? CircleAvatar(
                  radius: 20,
                  backgroundColor: colorScheme(context).outline,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: thumb != null ? FadeInImage.assetNetwork(
                      placeholder: ImgApi.placholderLogo, // Path to your local placeholder image
                      image: thumb!, // URL of the network image
                      fit: BoxFit.cover, // How the image should be fitted inside the circle
                      fadeInDuration: const Duration(milliseconds: 300), // Duration of the fade-in animation
                      fadeOutDuration: const Duration(milliseconds: 100), // Duration of the fade-out animation for the placeholder
                    ).image : AssetImage(categoryAttr.image),
                    backgroundColor: lighten(categoryAttr.color, 0.15)
                  ),
                ) : Container(),
                SizedBox(width: spacingUnit(1)),
                Text(title, style: ThemeText.subtitle2),
                SizedBox(height: 4),
                additionalWidget ?? Text(type.toString().split('.').last.toUpperCase(), style: ThemeText.caption,)
              ]),
              SizedBox(height: spacingUnit(1)),

              /// PRICE
              Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                hasPromo ? Padding(
                  padding: EdgeInsets.only(right: spacingUnit(3)),
                  child: Stack(alignment: Alignment.center, children: [
                    Icon(Icons.label, size: 50, color: ThemePalette.tertiaryMain),
                    Text('-${discount.toStringAsFixed(0)}%', style: ThemeText.paragraph.copyWith(color: Colors.white),)
                  ]),
                ) : Container(),
                Column(crossAxisAlignment: hasPromo ? CrossAxisAlignment.end : CrossAxisAlignment.center, children: [
                  hasPromo ? Text(
                    '${userAccount.currencySymbol} ${price.toStringAsFixed(2)}',
                    style: ThemeText.paragraph.copyWith(decoration: TextDecoration.lineThrough),
                  ) : Container(),
                  Text(
                    finalPrice(),
                    style: ThemeText.subtitle.copyWith(color: colorScheme(context).onPrimaryContainer),
                  )
                ])
              ]),
              SizedBox(height: spacingUnit(1)),
              
              /// POINTS AND DETAIL BTN
              Row(mainAxisAlignment: isSelected ? MainAxisAlignment.spaceAround : MainAxisAlignment.center, children: [
                points != null ? Container(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.big,
                    border: !isSelected ? BoxBorder.all(width: 1, color: ThemePalette.primaryMain) : null
                  ),
                  child: Text('+$points Points', textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: colorScheme(context).onPrimaryContainer),),
                ) : Container(),
                isSelected ? OutlinedButton(
                  onPressed: onTapDetail,
                  style: ThemeButton.btnSmall.merge(ThemeButton.outlinedInvert(context)),
                  child: Row(
                    children: [
                      Text('More Info', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_outlined, size: 9)
                    ],
                  ),
                ) : Container(),
              ])
            ]),
          )
        ),

        /// LABEL RIBBON
        label != null ? Positioned(
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
              child: Text(label!.toUpperCase(), textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: Colors.white),),
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
        ) : SizedBox.shrink(),
      ],
    );
  }
}