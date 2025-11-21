import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/models/billing.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/cards/billing_card.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ActiveBillings extends StatelessWidget {
  const ActiveBillings({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 100;
    final List<Billing> activeBillingList = [
      mobileBilling[0],
      electricBilling[0],
      internetBilling[0],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: TitleBasic(title: 'Your Active Billing', desc: 'Please pay your billing before due date',)
        ),
        SizedBox(height: spacingUnit(1),),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: spacingUnit(1));
            },
            itemBuilder: ((BuildContext context, int index) {
              Billing item = activeBillingList[index];
              return SizedBox(width: 300, child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppLink.payment);
                },
                child: BillingCard(
                  name: item.name,
                  icon: item.icon,
                  thumb: item.thumb,
                  period: item.period,
                  dueDate: item.dueDate,
                  price: item.price,
                  status: item.status,
                ),
              ));
            }),
          ),
        ),
      ],
    );
  }
}