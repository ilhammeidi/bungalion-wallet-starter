import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/billing.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:ewallet_app/utils/color_type.dart';
import 'package:ewallet_app/utils/formatter.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';

class BillingCard extends StatelessWidget {
  const BillingCard({
    super.key,
    required this.name,
    required this.period,
    required this.dueDate,
    required this.price,
    this.thumb,
    required this.icon,
    required this.status
  });

  final String name;
  final String period;
  final DateTime dueDate;
  final double price;
  final String? thumb;
  final IconData icon;
  final BillingStatus status;

  @override
  Widget build(BuildContext context) {
    final String statusText = status.toString().split('.').last;

    return PaperCard(flat: true, content: Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        /// THUMB
        Stack(alignment: AlignmentGeometry.bottomCenter, children: [
          thumb != null ? CircleAvatar(
            radius: 32,
            backgroundImage: isUrl(thumb!) ? FadeInImage.assetNetwork(
              placeholder: ImgApi.placholderLogo, // Path to your local placeholder image
              image: thumb!, // URL of the network image
              fit: BoxFit.cover, // How the image should be fitted inside the circle
              fadeInDuration: const Duration(milliseconds: 300), // Duration of the fade-in animation
              fadeOutDuration: const Duration(milliseconds: 100), // Duration of the fade-out animation for the placeholder
            ).image : AssetImage(thumb!),
          ) : CircleAvatar(
            radius: 32,
            backgroundColor: ThemePalette.primaryLight,
            child: Icon(icon, size: 24, color: ThemePalette.primaryMain),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: billingType(status),
              borderRadius: ThemeRadius.medium,
            ),
            child: Text(statusText.toUpperCase(), style: ThemeText.caption.copyWith(color: Colors.white),),
          )
        ]),
        SizedBox(width: spacingUnit(1),),

        /// INFO
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(period, style: ThemeText.caption),
              Text(name, style: ThemeText.subtitle2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  status == BillingStatus.unpaid ?
                    Expanded(child: Text(
                      'Due date: ${formatDate(dueDate)}',
                      style: ThemeText.paragraph.copyWith(color: billingType(BillingStatus.pending)))
                    ) : Container(),
                  Text(userAccount.currencySymbol, style: ThemeText.paragraph.copyWith(height: 1.5)),
                  Text(price.toStringAsFixed(2), style: ThemeText.subtitle2,),
                ],
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}