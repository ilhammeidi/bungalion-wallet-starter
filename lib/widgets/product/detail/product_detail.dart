import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/credit.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    this.withActionbtn = false,
    required this.amount,
    this.description,
    this.thumb,
    this.icon = Icons.monetization_on,
    this.vendor,
    required this.category,
    this.type = CreditType.coin,
    this.unit = 'Credit',
    required this.price,
    this.discount = 0,
    this.isPromo = false,
    this.points,
    this.additionalWidget
  });

  final bool withActionbtn;
  final String? thumb;
  final IconData icon;
  final bool isPromo;
  final String category;
  final double amount;
  final String unit;
  final Vendor? vendor;
  final String? description;
  final Widget? additionalWidget;
  final CreditType type;
  final double discount;
  final double price;
  final double? points;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final CategoryType categoryAttr = getCategory(widget.category);
    String finalPrice() => '${userAccount.currencySymbol}${(widget.price - widget.price * widget.discount / 100).toStringAsFixed(2)}';

    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          /// LOGO
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              widget.thumb != null ? AvatarNetwork(
                radius: 32,
                backgroundImage: widget.thumb!,
                backgroundColor: lighten(categoryAttr.color, 0.15)
              ) : CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(categoryAttr.image),
                backgroundColor: lighten(categoryAttr.color, 0.15)
              ),
              widget.isPromo ? Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: ThemePalette.tertiaryMain,
                  borderRadius: ThemeRadius.big
                ),
                child: Text('PROMO', textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: Colors.white)),
              ) : SizedBox.shrink()
            ],
          ),
          SizedBox(width: spacingUnit(1)),
          Expanded(child: Column(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /// VENDOR
              Row(children: [
                widget.vendor != null ? Row(children: [
                  AvatarNetwork(
                    radius: 10,
                    backgroundImage: widget.vendor!.logo,
                    type: 'vendor',
                  ),
                  SizedBox(width: 4),
                  Text(widget.vendor!.name, style: ThemeText.paragraph),
                ]) : Container(),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
                  decoration: BoxDecoration(
                    color: categoryAttr.color.withValues(alpha: 0.25),
                    borderRadius: ThemeRadius.big
                  ),
                  child: Text(categoryAttr.name.toUpperCase(), style: ThemeText.caption.merge(TextStyle(color: categoryAttr.color))),
                ),
              ]),
              SizedBox(height: spacingUnit(1)),

              /// TITLE
              Text('${widget.amount.toStringAsFixed(0)} ${widget.unit.toUpperCase()}', style: ThemeText.title2),
            ])
          ]))
        ]),
        VSpaceShort(),

        /// PRICE
        Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// DESCRIPTIONS
            widget.additionalWidget ?? Container(),
            Text(widget.description ?? widget.type.toString().split('.').last.toUpperCase(), style: ThemeText.headline),

            /// POINTS
            SizedBox(height: 4,),
            widget.points != null ? Container(
              padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 2),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.big,
                border: BoxBorder.all(width: 1, color: ThemePalette.primaryMain)
              ),
              child: Text('+${widget.points?.toStringAsFixed(0)} Points', textAlign: TextAlign.center, style: ThemeText.paragraph.copyWith(color: colorScheme(context).onPrimaryContainer),),
            ) : Container(),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.end, children: [
            widget.isPromo ? Row(children: [
              Stack(alignment: Alignment.center, children: [
                Icon(Icons.label, size: 36, color: ThemePalette.tertiaryMain),
                Text('-${widget.discount.toStringAsFixed(0)}%', style: ThemeText.caption.copyWith(color: Colors.white),)
              ]),
              Text(
                '${userAccount.currencySymbol} ${widget.price.toStringAsFixed(2)}',
                style: ThemeText.paragraph.copyWith(decoration: TextDecoration.lineThrough),
              )
            ]) : Container(),
            Text(finalPrice(), style: ThemeText.title2)
          ]),
        ]),
        VSpace(),
        
        /// BUTTONS
        widget.withActionbtn ? Row(children: [
          SizedBox(
            height: 40,
            width: 40,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _liked = !_liked;
                });
              },
              style: ThemeButton.btnSmall.merge(ThemeButton.outlinedDefault(context)),
              child: Icon(_liked ? Icons.favorite : Icons.favorite_outline, size: 18, color: _liked ? Colors.pink : colorScheme(context).onSurface)
            ),
          ),
          SizedBox(width: spacingUnit(1)),
          Expanded(child: FilledButton(
            onPressed: () {
              Get.toNamed(AppLink.payment);
            },
            style: ThemeButton.btnBig.merge(ThemeButton.invert(context)),
            child: Text('BUY NOW', style: ThemeText.subtitle2,)
          ))
        ]) : Container(),
        VSpace()
      ])
    );
  }
}

Future<void> showProductDetail(
  BuildContext context, {
    required Credit item,
    bool withActionBtn = false
  }
) {
  return Get.bottomSheet(
    Wrap(children: [
      VSpaceShort(),
      GrabberIcon(),
      VSpaceShort(),
      ProductDetail(
        amount: item.amount,
        category: item.category,
        price: item.price,
        description: item.description,
        discount: item.discount,
        icon: item.icon,
        isPromo: item.isPromo,
        points: item.points,
        thumb: item.thumb,
        vendor: item.vendor,
        type: item.type,
        unit: item.unit,
        withActionbtn: withActionBtn,
      )
    ]),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: colorScheme(context).surface,
  );
}
