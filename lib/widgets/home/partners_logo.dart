import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/product/detail/vendor_detail.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';

class PartnersLogo extends StatelessWidget {
  const PartnersLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.smUp(context);

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: const TitleBasic(
          title: 'Get Coupon from Our Partners',
        ),
      ),

      GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(spacingUnit(2)),
        physics: const ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: wideScreen ? 6 : 4,
          crossAxisSpacing: wideScreen ? 24 : 16,
          mainAxisSpacing: wideScreen ? 24 : 16,
          childAspectRatio: 1,
        ),
        itemCount: 12, // Replace with the actual number of items
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showVendorDetail(context);
            },
            child: ClipRRect(
              borderRadius: ThemeRadius.medium,
              child: Image.network(
                ImgApi.photo[261+index], // Replace with the actual image URL
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: ShimmerPreloader()
                  );
                },
              ),
            ),
          );
        },
      )
    ],);
  }
}