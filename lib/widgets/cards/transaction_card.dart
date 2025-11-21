import 'package:change_case/change_case.dart';
import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/category_type.dart';
import 'package:ewallet_app/models/transaction.dart';
import 'package:ewallet_app/models/vendor.dart';
import 'package:ewallet_app/utils/check_platforms.dart';
import 'package:ewallet_app/utils/color_type.dart';
import 'package:ewallet_app/utils/confirm_dialog.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/app_input/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:ewallet_app/widgets/decorations/dashed_border.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.userId,
    required this.productName,
    this.vendor,
    required this.groupName,
    this.thumb,
    required this.transactionDate,
    required this.status,
    required this.price,
    this.onShowOpt,
    this.onTap,
    this.onTapAction,
    this.isIncome = false,
    this.mini = false,
  });

  final String userId;
  final String productName;
  final Vendor? vendor;
  final CategoryType groupName;
  final String? thumb;
  final DateTime transactionDate;
  final TransactionStatus status;
  final double price;
  final bool isIncome;
  final bool mini;

  final Function()? onShowOpt;
  final Function()? onTap;
  final Function()? onTapAction;

  @override
  Widget build(BuildContext context) {
    ImageProvider vendorLogo(String urlPath){
      if(isUrl(urlPath)) {
        return FadeInImage.assetNetwork(
          placeholder: ImgApi.placholderLogo, // Path to your local placeholder image
          image: urlPath, // URL of the network image
          fit: BoxFit.cover, // How the image should be fitted inside the circle
          fadeInDuration: const Duration(milliseconds: 300), // Duration of the fade-in animation
          fadeOutDuration: const Duration(milliseconds: 100), // Duration of the fade-out animation for the placeholder
        ).image;
      } else {
        return AssetImage(urlPath);
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: PaperCard(
        flat: true,
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(1), horizontal: spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// TOP
            !mini ? Row(children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.transparent,
                backgroundImage: vendor != null ? vendorLogo(vendor!.logo) : null,
                child: vendor == null ? Icon(Icons.payments, size: 24, color: ThemePalette.primaryMain) : null,
              ),
              SizedBox(width: spacingUnit(1),),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(vendor != null ? vendor!.name.toCapitalCase() : 'Transaction', style: ThemeText.paragraphBold, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text(DateFormat.yMMMd().format(transactionDate), style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
                ]),
              ),
              SizedBox(width: spacingUnit(1),),
              _statusChip(context),
              SizedBox(width: 4),
              onShowOpt != null ? SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onShowOpt,
                  icon: Icon(Icons.more_vert_outlined, size: 18, color: colorScheme(context).onSurfaceVariant),
                ),
              ) : Container()
            ]) : SizedBox.shrink(),
        
            /// LINE DECORATION
            !mini ? Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: DashedBorder(),
            ) : SizedBox.shrink(),
        
            /// BOTTOM
            Row(children: [
              ClipRRect(
                borderRadius: ThemeRadius.small,
                child: thumb != null ? Image.network(
                  thumb!,
                  width: 32,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: 32,
                      height: 32,
                      child: ShimmerPreloader()
                    );
                  },
                ) : Image.asset(groupName.image, width: 32,),
              ),
              SizedBox(width: spacingUnit(1)),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(productName, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeText.paragraphBold),
                  mini ? Text(DateFormat.yMMMd().format(transactionDate), style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant))
                  : Text(userId, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant)),
                ]),
              ),
              SizedBox(width: spacingUnit(1)),
              onShowOpt != null && mini ? SizedBox(
                width: 24,
                height: 24,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onShowOpt,
                  icon: Icon(Icons.more_vert_outlined, size: 18, color: colorScheme(context).onSurfaceVariant),
                ),
              ) : Container()
            ]),
            SizedBox(height: spacingUnit(1)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text('${isIncome ? '+' : ''}${userAccount.currencySymbol}${price.toStringAsFixed(2)}', style: ThemeText.subtitle.copyWith(color: isIncome ? Colors.green : colorScheme(context).onSurface)),
              mini ? _statusChip(context) : OutlinedButton(
                onPressed: onTapAction,
                style: ThemeButton.btnSmall.merge(ThemeButton.outlinedPrimary(context)),
                child: Text('BUY AGAIN', style: ThemeText.caption)
              )
            ])
          ]),
        )
      ),
    );
  }

  Widget _statusChip(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(borderRadius: ThemeRadius.big, color: transactionColor(status).withValues(alpha: 0.25)),
      child: Text(
        status.toString().split('.').last.toUpperCase(),
        style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: transactionColor(status)),
      ),
    );
  }
}

Future<void> showOptTransaction(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Wrap(children: [
        Column(
          children: [
            VSpace(),
            GrabberIcon(),
            VSpaceShort(),
            ListView(padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)), shrinkWrap: true, children: [
              ListTile(
                leading: Icon(Icons.info_outline, color: ThemePalette.primaryMain, size: 32),
                title: Text('Show Receipt', style: ThemeText.headline),
                onTap: () {
                  Get.toNamed(AppLink.purchaseDetail);
                },
              ),
              ListTile(
                leading: Icon(Icons.chat_bubble_outline, color: ThemePalette.primaryMain, size: 32),
                title: Text('Ask Support', style: ThemeText.headline),
                onTap: () {
                  Get.toNamed(AppLink.chatSupport);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border, color: ThemePalette.primaryMain, size: 32),
                title: Text('Save Number', style: ThemeText.headline),
                onTap: () {
                  confirmDialog(
                    context,
                    title: 'Save Number',
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: AppTextField(label: 'Name', onChanged: (_) {})
                    ),
                    confirmAction: () {
                      Navigator.of(context).pop();
                    },
                    confirmText: 'Save'
                  );
                },
              )
            ]),
            VSpace()
          ],
        )
      ]);
    },
  );
}