import 'package:ewallet_app/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class PaymentBalance extends StatefulWidget {
  const PaymentBalance({super.key});

  @override
  State<PaymentBalance> createState() => _PaymentBalanceState();
}

class _PaymentBalanceState extends State<PaymentBalance> {
  bool _isUseCoin = false;
  double _discount = 0;
  double coins = 10;
  double price = 102;
  double balance = 123;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.medium,
              border: Border.all(
                width: 1,
                color: ThemePalette.primaryMain,
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Image.asset(branding.logo, width: 32),
              title: RichText(
                text: TextSpan(
                  style: ThemeText.subtitle2.copyWith(color: colorScheme(context).onSurface),
                  children: [
                    TextSpan(
                      text: 'Your Balance: ',
                      style: ThemeText.subtitle2,
                    ),
                    TextSpan(
                      text: '${userAccount.currencySymbol}$balance',
                      style: ThemeText.subtitle.copyWith(color: colorScheme(context).onPrimaryContainer),
                    ),
                  ],
                ),
              ),
              subtitle: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.info_outline, size: 14, color: colorScheme(context).onSecondaryContainer),
                SizedBox(width: 4),
                Text('Remaining balance after usage:', style: ThemeText.caption,),
                SizedBox(width: 4),
                Text('${userAccount.currencySymbol}${balance - price + _discount}', style: ThemeText.paragraphBold),
              ]),
            )
          ),
          SizedBox(height: spacingUnit(2),),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
            child: Row(children: [
              Icon(Icons.motion_photos_on, color: Colors.amber, size: 24,),
              SizedBox(width: spacingUnit(1)),
              Expanded(child: Text('Use ${coins.toStringAsFixed(0)} coins', style: ThemeText.headline,)),
              SizedBox(
                height: 18,
                child: Switch(
                  value: _isUseCoin,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isUseCoin = newValue;
                      if (newValue) {
                        _discount = coins;
                      } else {
                        _discount = 0;
                      }
                    });
                  },
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}