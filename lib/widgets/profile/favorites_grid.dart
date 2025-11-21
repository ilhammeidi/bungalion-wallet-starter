import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_shadow.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/title/title_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';

class FavoritesGrid extends StatelessWidget {
  const FavoritesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> favThumbs = [ImgApi.photo[29], ImgApi.photo[57], ImgApi.photo[284], ImgApi.photo[216], ImgApi.photo[196], ImgApi.photo[332], ImgApi.photo[148], ImgApi.photo[336]];
    final bool wideScreen = ThemeBreakpoints.smUp(context);
    final bool isDark = Get.isDarkMode;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          padding: isDark ? EdgeInsets.all(spacingUnit(1)) : EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.medium,
            color: colorScheme(context).surfaceContainerHigh,
            boxShadow: isDark ? [ThemeShade.shadeSoft(context)] : []
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: isDark ? EdgeInsets.all(spacingUnit(1)) : EdgeInsets.zero,
                child: TitleAction(
                  title: 'Favorite Services',
                  desc: 'You have ${favThumbs.length} items',
                  textAction: 'Buy Item',
                  onTap: () {
                    Get.toNamed(AppLink.promo);
                  },
                ),
              ),
              SizedBox(height: spacingUnit(1),),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  bottom: spacingUnit(2)
                ),
                physics: const ClampingScrollPhysics(),
                itemCount: wideScreen ? 8 : 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: wideScreen ? 4 : 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  String item = favThumbs[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppLink.packageDetail);
                    },
                    child: ClipRRect(
                      borderRadius: ThemeRadius.medium,
                      child: Image.network(
                        item,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: 320,
                            height: 320,
                            child: ShimmerPreloader()
                          );
                        },
                      ),
                    )
                  );
                }
              ),
            ],
          )
        ),
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                colorScheme(context).surfaceContainerLow.withValues(alpha: 0),
                colorScheme(context).surfaceContainerLow,
              ]
            )
          ),
          alignment: Alignment.bottomCenter,
          child: FilledButton(
            onPressed: () {
              Get.toNamed(AppLink.favoriteProducts);
            },
            style: ThemeButton.invert(context),
            child: Text('Show All'.toUpperCase()),
          )
        )
      ],
    );
  }
}