import 'package:ewallet_app/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.image, required this.title, required this.desc, required this.price, this.onTap});

  final AssetImage image;
  final String title;
  final String desc;
  final double price;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      flat: true,
      content: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.contain)
            ),
          ),
          title: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeText.paragraphBold),
          subtitle: Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeText.paragraph),
          trailing: Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.big,
              color: colorScheme(context).primaryContainer
            ),
            child: Text('${userAccount.currencySymbol}${price.toStringAsFixed(2)}', style: ThemeText.paragraphBold.copyWith(color: colorScheme(context).onPrimaryContainer))
          ),
        ),
      ),
    );
  }
}