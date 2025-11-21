import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/models/package.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/cards/package_portrait_card.dart';
import 'package:ewallet_app/widgets/title/title_action.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PackageListSlider extends StatelessWidget {
  const PackageListSlider({
    super.key,
    this.withCover = false,
    required this.title,
    this.onViewAll,
    required this.packageList,
    this.coverHeadline,
    this.coverTitle,
    this.coverImg
  });

  final String title;
  final Function()? onViewAll;
  final List<Package> packageList;
  final bool withCover;
  final String? coverHeadline;
  final String? coverTitle;
  final String? coverImg ;

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 220;
    int indexStart = withCover ? 1 : 0;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: onViewAll != null ? TitleAction(
          title: title,
          onTap: onViewAll!,
          textAction: 'View All',
        ) : TitleBasic(title: title),
      ),
      VSpaceShort(),
      SizedBox(
        height: cardHeight + 20,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            /// COVER
            withCover ? Positioned(
              left: spacingUnit(1),
              child: Container(
                width: cardHeight + 10,
                height: cardHeight + 20,
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.big,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme(context).secondaryContainer,
                      colorScheme(context).surfaceContainerLowest,
                    ],
                  ),
                ),
              ),
            ) : SizedBox.shrink(),

            /// SLIDER LIST
            SizedBox(
              height: cardHeight,
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: spacingUnit(1)),
                itemCount: packageList.length,
                itemBuilder: ((context, index) {
                  if (index == 0 && withCover) {
                    return SizedBox(width: 130, child: _illustrationTitle(context));
                  }
  
                  Package item = packageList[index - indexStart];
                  return SizedBox(
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppLink.packageDetail);
                      },
                      child: PackagePortraitCard(
                        name: item.name,
                        image: item.images,
                        price: item.price,
                        points: item.points,
                        discount: item.discount,
                        label: 'Promo',
                        timeleft: item.timeleft,
                        vendor: item.vendor,
                        feature1: item.features![0],
                        feature2: item.features!.length > 1 ? item.features![1] : null,
                      ),
                    )
                  );
                }),
              )
            ),
          ],
        ),
      )
    ]);
  }

  Widget _illustrationTitle(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(coverHeadline!, style: ThemeText.caption.copyWith(color: colorScheme(context).onSecondaryContainer, fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Text(coverTitle!, style: ThemeText.paragraphBold),
      SizedBox(height: 4),
      Image.asset(coverImg!)
    ]);
  }
}