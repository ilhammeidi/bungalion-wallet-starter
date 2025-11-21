import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/title/title_action.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final List<String> imgList = [
    ImgApi.photo[259],
    ImgApi.photo[245],
    ImgApi.photo[221],
    ImgApi.photo[243],
    ImgApi.photo[228],
    ImgApi.photo[249],
  ];

  int _current = 0;
  final CarouselSliderController _sliderRef = CarouselSliderController();
  double _getSliderHeight(BuildContext context) {
    if (ThemeBreakpoints.mdUp(context)) {
      return 400;
    } else if (ThemeBreakpoints.smUp(context)) {
      return 250;
    } else {
      return 160;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = imgList.asMap().entries.map((entry) {
      String item = entry.value;

      return GestureDetector(
        onTap: () {
          Get.toNamed(AppLink.promoDetail);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                item,
                fit: BoxFit.cover,
                width: 1000,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const ShimmerPreloader();
                },
              ),
            ],
          )
        ),
      );
    }).toList();
  
    return Column(children: [
      /// TITLE
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Latest Promotions',
          textAction: 'See All',
          onTap: () {
            Get.toNamed(AppLink.promo);
          }
        ),
      ),
      const VSpaceShort(),
      
      /// CAROUSEL SLIDER IMAGES
      SizedBox(
        height: _getSliderHeight(context),
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _sliderRef,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            initialPage: 0,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            pauseAutoPlayOnTouch: true,
            height: _getSliderHeight(context),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          )
        )
      ),

      /// SLIDER PAGINATION
      const VSpaceShort(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          int curSlide = entry.key;
          return GestureDetector(
            onTap: () => _sliderRef.animateToPage(curSlide),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: _current == curSlide ? 30 : 12,
              height: 12.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.big,
                color: colorScheme(context).onSurface.withValues(alpha: _current == curSlide ? 1 : 0.2)),
            )
          );
        }).toList(),
      )
    ]);
  }
}