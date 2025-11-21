import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/models/purchase_history.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/cards/transaction_card.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LatestTransactions extends StatelessWidget {
  const LatestTransactions({super.key, required this.items, required this.counts});

  final List<Purchase> items;
  final int counts;

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 185;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: TitleBasic(title: 'Latest Transaction')
        ),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: counts,
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: spacingUnit(1));
            },
            itemBuilder: ((BuildContext context, int index) {
              Purchase item = items[index];
              return SizedBox(width: 300, child: TransactionCard(
                productName: item.productName,
                userId: item.userId,
                transactionDate: item.transactionDate,
                groupName: item.category,
                price: item.price,
                status: item.status,
                vendor: item.vendor,
                thumb: item.thumb,
                onTap: () {
                  Get.toNamed(AppLink.transactionDetail);
                },
                onTapAction: () {
                  Get.toNamed(AppLink.payment);
                },
              ));
            }),
          ),
        ),
      ],
    );
  }
}