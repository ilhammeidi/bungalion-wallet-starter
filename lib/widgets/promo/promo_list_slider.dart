import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/cards/promo_card.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/models/promo.dart';
import 'package:get/route_manager.dart';

class PromoListSlider extends StatelessWidget {
  const PromoListSlider({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 300;
    final List<Promotion> promos = [
      promoList[0],
      promoList[25],
      promoList[22],
      promoList[26],
      promoList[4],
      promoList[5],
    ];
  
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleBasic(
          title: 'The New Promos',
          desc: 'Check out the new promos just for you',
        ),
      ),
      const VSpaceShort(),
      SizedBox(
        height: cardHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: promos.length,
          itemBuilder: ((context, index) {
            Promotion item = promos[index];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 4 : 0),
              child: Column(children: [
                SizedBox(width: 320, height: cardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppLink.promoDetail);
                      },
                      child: PromoCard(
                        thumb: item.thumb,
                        title: item.name,
                        liked: false,
                        point: item.price,
                        time: item.date,
                      ),
                    ),
                  )
                ),
              ]),
            );
          }),
        ),
      )
    ]);
  }
}