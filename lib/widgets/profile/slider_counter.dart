import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:get/route_manager.dart';

class SliderCounter extends StatelessWidget {
  const SliderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.mdUp(context);
    double cardWidth = wideScreen ? 320 : 260;

    return SizedBox(
      height: 160,
      child: ListView(
        padding: EdgeInsets.all(spacingUnit(2)),
        scrollDirection: Axis.horizontal,
        children: [
          /// POINTS
          SizedBox(
            width: cardWidth,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppLink.reward);
              },
              child: PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Container(
                      padding: EdgeInsets.all(spacingUnit(1)),
                      width: 100,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: 0.7,
                              strokeWidth: 10.0,
                              backgroundColor: Colors.amber.withValues(alpha: 0.5),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                            ),
                          ),
                          Text('Gold', style: ThemeText.subtitle)
                        ],
                      )
                    ),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('700 Points', style: ThemeText.title2),
                        Text('Achieved', style: ThemeText.paragraph),
                      ])
                    )
                  ]),
                )
              ),
            ),
          ),
          SizedBox(width: spacingUnit(1)),

          /// VOUCHERS
          SizedBox(
            width: cardWidth,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppLink.myVouchers);
              },
              child: PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Image.asset(ImgApi.iconGrdTicket, width: 60, height: 60),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('5 Coupons', style: ThemeText.title2),
                        Text('Available', style: ThemeText.paragraph),
                      ])
                    )
                  ]),
                )
              ),
            ),
          ),
          SizedBox(width: spacingUnit(1)),

          /// HISTORY
          SizedBox(
            width: cardWidth,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppLink.history);
              },
              child: PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Image.asset(ImgApi.iconGrdVoucher, width: 60, height: 60),
                    SizedBox(width: spacingUnit(2)),
                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('3 New', style: ThemeText.title2),
                        Text('History Transaction', style: ThemeText.paragraph),
                      ])
                    )
                  ]),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}