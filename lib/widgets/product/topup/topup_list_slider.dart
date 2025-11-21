import 'package:change_case/change_case.dart';
import 'package:ewallet_app/constants/app_const.dart';
import 'package:ewallet_app/models/credit.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/cards/product_portrait_card.dart';
import 'package:ewallet_app/widgets/product/detail/product_detail.dart';
import 'package:ewallet_app/widgets/title/title_action.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';

class TopupListSlider extends StatelessWidget {
  const TopupListSlider({
    super.key,
    this.withCover = false,
    required this.title,
    this.onViewAll,
    required this.creditList,
    this.coverHeadline,
    this.coverTitle,
    this.coverImg,
    required this.creditType,
    required this.category
  });

  final String title;
  final Function()? onViewAll;
  final List<Credit> creditList;
  final bool withCover;
  final String? coverHeadline;
  final String? coverTitle;
  final String? coverImg ;
  final CreditType creditType;
  final String category;

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 240;
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
      SizedBox(height: spacingUnit(1)),
      SizedBox(
        height: cardHeight + 40,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            /// COVER
            withCover ? Positioned(
              left: spacingUnit(1),
              child: Container(
                width: cardHeight + 10,
                height: cardHeight + 40,
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.big,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme(context).primaryContainer,
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
                itemCount: creditList.length,
                itemBuilder: ((context, index) {
                  if (index == 0 && withCover) {
                    return SizedBox(width: 130, child: _illustrationTitle(context));
                  }
  
                  Credit item = creditList[index - indexStart];
                  return SizedBox(
                    width: 180,
                    child: GestureDetector(
                      onTap: () {
                        showProductDetail(context, item: item, withActionBtn: true);
                      },
                      child: ProductPortraitCard(
                        title: '${item.amount.toStringAsFixed(0)} ${item.unit.toCapitalCase()}',
                        additionalWidget: item.description != null ? 
                          Column(
                            children: [
                              Text(item.description!, style: ThemeText.caption),
                              Text(userAccount.phone, style: ThemeText.caption),
                            ],
                          )
                          : Text('Balance', style: ThemeText.caption),
                        thumb: item.thumb,
                        category: category,
                        type: creditType,
                        price: item.price,
                        discount: item.discount,
                        points: item.points,
                        hasPromo: item.isPromo,
                        label: item.isPromo ? 'Promo' : null
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
      Text(coverHeadline!, style: ThemeText.caption.copyWith(color: colorScheme(context).onPrimaryContainer, fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Text(coverTitle!, style: ThemeText.subtitle2),
      SizedBox(height: 4),
      Image.asset(coverImg!)
    ]);
  }
}