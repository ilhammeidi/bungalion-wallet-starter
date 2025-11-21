import 'package:ewallet_app/models/package.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/cards/featured_card.dart';
import 'package:ewallet_app/widgets/product/detail/package_detail.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';

class FeaturedGameList extends StatelessWidget {
  const FeaturedGameList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Package> gamePackageList = [
      gamePackages[5],
      gamePackages[10],
      gamePackages[12],
      gamePackages[14],
      gamePackages[7],
      gamePackages[17],
      gamePackages[13],
      gamePackages[1],
      gamePackages[8],
      gamePackages[11],
    ];
    const double cardHeight = 160;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleBasic(title: 'Featured Game Vouchers',),
      ),
      SizedBox(height: spacingUnit(2)),
      SizedBox(
        height: cardHeight,
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: spacingUnit(2)),
          itemCount: gamePackageList.length,
          itemBuilder: ((context, index) {
            Package item = gamePackageList[index];
            return SizedBox(
              width: 300,
              child: GestureDetector(
                onTap: () {
                  showPackageDetail(context, item: item, withActionBtn: true);
                },
                child: FeaturedCard(
                  name: item.name,
                  category: item.category,
                  price: item.price,
                  points: item.points,
                  discount: item.discount,
                  hasPromo: item.isPromo,
                  images: item.images,
                  thumb: item.thumb,
                  timeleft: item.timeleft,
                  vendor: item.vendor,
                ),
              )
            );
          })
        )
      )
    ]);
  }
}