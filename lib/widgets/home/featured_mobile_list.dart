import 'package:ewallet_app/models/package.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/cards/featured_card.dart';
import 'package:ewallet_app/widgets/product/detail/package_detail.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';

class FeaturedMobileList extends StatelessWidget {
  const FeaturedMobileList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Package> mobilePackageList = [
      mobilePackages[0],
      mobilePackages[3],
      mobilePackages[6],
      mobilePackages[10],
      mobilePackages[13],
      mobilePackages[2],
      mobilePackages[7],
      mobilePackages[12],
      mobilePackages[5],
      mobilePackages[15],
    ];
    const double cardHeight = 165;

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleBasic(title: 'Featured Mobile Packages',),
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
          itemCount: mobilePackageList.length,
          itemBuilder: ((context, index) {
            Package item = mobilePackageList[index];
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