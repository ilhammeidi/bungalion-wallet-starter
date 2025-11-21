import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key, this.actionBtn = 'PAY NOW', this.onSubmit});

  final String actionBtn;
  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacingUnit(2)),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Total Payment'),
              Text('${userAccount.currencySymbol}28', style: ThemeText.title2.copyWith(color: colorScheme(context).onPrimaryContainer)),
            ])
          ),
          SizedBox(width: spacingUnit(1)),
          FilledButton(
            onPressed: onSubmit,
            style: ThemeButton.btnBig.merge(ThemeButton.invert(context)),
            child: Text(actionBtn, style: ThemeText.subtitle2,)
          ),
        ],
      ),
    );
  }
}