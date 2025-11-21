import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/image_viewer.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';

class PromoDesc extends StatelessWidget {
  const PromoDesc({
    super.key,
    required this.title,
    required this.desc,
    required this.thumb,
    required this.terms1,
    required this.terms2,
    required this.terms3,
    required this.date,
    required this.point,
    required this.liked
  });

  final String title;
  final String desc;
  final String thumb;
  final String terms1;
  final String terms2;
  final String terms3;
  final String date;
  final double point;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            /// EVENT TITLE
            Expanded(child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold))
            ),
            SizedBox(width: spacingUnit(2)),

            /// TIME REMAINING
            Container(
              width: 120,
              padding: EdgeInsets.all(spacingUnit(1)),
              margin: EdgeInsets.only(bottom: spacingUnit(1)),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: ThemeRadius.xbig
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.access_time_outlined, size: 15, color: Colors.white),
                const SizedBox(width: 2),
                Text(date, style: ThemeText.paragraph.copyWith(color: Colors.white)),
              ],)
            ),
          ]),
        ),

        /// THUMBNAIL HERO
        Hero(
          tag: thumb,
          child: GestureDetector(
            onTap: () {
              Get.to(() => ImageViewer(img: thumb));
            },
            child: ClipRRect(
              borderRadius: ThemeRadius.medium,
              child: Image.network(
                thumb,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ShimmerPreloader()
                  );
                },
              ),
            ),
          )
        ),

        /// DESCRIPTION AND termsS
        Container(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(desc, style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(2)),
            Text('Terms of use:', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: spacingUnit(1)),
            Text('1. $terms1', style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text('2. $terms2', style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text('3. $terms3', style: ThemeText.paragraph),
          ]),
        )
      ]),
    );
  }
}