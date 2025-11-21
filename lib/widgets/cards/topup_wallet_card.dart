import 'package:ewallet_app/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:ewallet_app/models/topup_history.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class TopupWalletCard extends StatelessWidget {
  const TopupWalletCard({
    super.key,
    required this.date,
    required this.amount,
    required this.isLast,
    required this.timeLeft,
    required this.status,
    this.onTapInfo
  });

  final DateTime date;
  final String timeLeft;
  final double amount;
  final bool isLast;
  final int status;
  final Function()? onTapInfo;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    TopupStatus setStatus() {
      if (status == 1) {
        return TopupStatus(color: Colors.orange, text: 'Waiting for Payment', icon: Icons.access_time);
      } else if (status == 2) {
        return TopupStatus(color: Colors.red, text: 'Failed', icon: Icons.remove_circle_outline);
      } else {
        return TopupStatus(color: Colors.green, text: 'Success', icon: Icons.add_circle_outline);
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(DateFormat.yMMMd().format(date), style: ThemeText.paragraphBold),
        IconButton(onPressed: onTapInfo, icon: Icon(Icons.info_outline, size: 18, color: isDark ? Colors.grey.shade500 : Colors.grey.shade600))
      ]),
      ListTile(
        contentPadding: EdgeInsets.zero,
        minTileHeight: 0,
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: setStatus().color.withValues(alpha: 0.25),
          child: Icon(setStatus().icon, size: 24, color: setStatus().color),
        ),
        title: Row(
          children: [
            Text(userAccount.currencySymbol, style: ThemeText.subtitle),
            Text(amount.toStringAsFixed(0), style: ThemeText.title2),
          ],
        ),
        subtitle: Text(setStatus().text.toUpperCase(), style: ThemeText.caption.copyWith(color: status == 1 ? setStatus().color : colorScheme(context).onSurface, fontWeight: FontWeight.bold)
        ),
        trailing: status == 1 ? IconButton(onPressed: () {}, icon: Icon(Icons.copy_rounded, size: 24, color: colorScheme(context).onPrimaryContainer)) : null,
      ),
      status == 1 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.cancel_outlined, size: 16, color: Colors.red),
              SizedBox(width: 2),
              Text('CANCEL', style: ThemeText.caption.copyWith(color: colorScheme(context).onSurface)),
            ],
          )
        ),
        RichText(
          text: TextSpan(
            text: 'Timeleft: ',
            style: ThemeText.paragraph.copyWith(color: colorScheme(context).onSurface),
            children: [
              TextSpan(
                text: timeLeft,
                style: ThemeText.paragraphBold.copyWith(color: colorScheme(context).onPrimaryContainer),
              ),
            ],
          ),
        ),
      ]) : Container(),
      !isLast ? Divider(color: colorScheme(context).outline, height: spacingUnit(4),) : Container()
    ]);
  }
}