import 'package:change_case/change_case.dart';
import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/package.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PackageDetail extends StatefulWidget {
  const PackageDetail({
    super.key,
    this.withActionbtn = false,
    required this.name,
    required this.image,
    this.vendor,
    required this.category,
    required this.description,
    this.isPromo = false,
    required this.price,
    this.discount = 0,
    this.features,
    this.points,
    this.additionalWidget,
  });

  final bool withActionbtn;
  final Vendor? vendor;
  final String category;
  final bool isPromo;
  final String image;
  final String name;
  final String description;
  final List<String>? features;
  final Widget? additionalWidget;
  final double? points;
  final double discount;
  final double price;

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final CategoryType categoryAttr = getCategory(widget.category);
    String finalPrice() => '${userAccount.currencySymbol}${(widget.price - widget.price * widget.discount / 100).toStringAsFixed(2)}';

    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              color: categoryAttr.color.withValues(alpha: 0.15),
              borderRadius: ThemeRadius.big
            ),
            child: Text(categoryAttr.name.toCapitalCase(), style: ThemeText.paragraphBold.merge(TextStyle(color: categoryAttr.color))),
          ),
        ]),
        SizedBox(height: spacingUnit(1)),
      
        Stack(children: [
          /// THUMB
          Padding(
            padding: EdgeInsets.only(left: widget.isPromo ? 8.0 : 0),
            child: ClipRRect(
              borderRadius: ThemeRadius.medium,
              child: Image.network(
                widget.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: ShimmerPreloader()
                  );
                },
              )
            ),
          ),

          /// LABEL RIBBON
          widget.isPromo ? Positioned(
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
                child: Text('PROMO', textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: Colors.white),),
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
        ]),
        VSpaceShort(),
      
        /// DESCRIPTION
        Text(widget.name, style: ThemeText.title2),
        SizedBox(height: spacingUnit(1),),
        widget.additionalWidget ?? Container(),
        Text(widget.description, style: ThemeText.headline),
        SizedBox(height: spacingUnit(1),),
        widget.features != null ? Row(children: [
          widget.features!.isNotEmpty ? _featureTag(context, widget.features![0], colorScheme(context).primaryContainer) : Container(),
          SizedBox(width: 4),
          widget.features!.length > 1 ? _featureTag(context, widget.features![1], colorScheme(context).secondaryContainer) : Container(),
          SizedBox(width: 4),
        ]) : Container(),
        VSpaceShort(),

        /// PRICE
        Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          widget.points != null ? Container(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: 4),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.big,
              border: BoxBorder.all(width: 1, color: ThemePalette.primaryMain)
            ),
            child: Text('+${widget.points?.toStringAsFixed(0)} Points', textAlign: TextAlign.center, style: ThemeText.paragraph.copyWith(color: colorScheme(context).onPrimaryContainer),),
          ) : Container(),
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
      ]),
    );
  }

  Widget _featureTag(BuildContext context, String facility, Color color) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: ThemeRadius.big
      ),
      child: Text(facility, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1, style: ThemeText.paragraph.copyWith(color: colorScheme(context).onSurface.withValues(alpha: 0.75))),
    );
  }
}

Future<void> showPackageDetail(
  BuildContext context, {
    required Package item,
    bool withActionBtn = false
  }
) {
  return Get.bottomSheet(
    Wrap(children: [
      VSpaceShort(),
      GrabberIcon(),
      VSpaceShort(),
      PackageDetail(
        name: item.name,
        image: item.images,
        category: item.category,
        description: item.description,
        price: item.price,
        discount: item.discount,
        features: item.features,
        isPromo: item.discount > 0,
        points: item.points,
        vendor: item.vendor,
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
