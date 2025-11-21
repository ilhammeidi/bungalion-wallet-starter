import 'dart:ui';

import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key, required this.saveIntroStatus});

  final Function() saveIntroStatus;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _current = 0;
  final CarouselSliderController _sliderRef = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> introList = [
      _contentIntro(
        context,
        'Lorem ipsum dolor sit amet', 'Integer sem massa, interdum commodo leo ac, posuere molestie.',
        ImgApi.intro[0],
        ThemePalette.primaryMain
      ),
      _contentIntro(
        context,
        'Donec ultrices vestibulum nibh elementum eget', 'Donec blandit turpis nulla, nec bibendum urna elementum eget. Fusce et sagittis risus.',
        ImgApi.intro[1],
        ThemePalette.secondaryMain
      ),
      _contentIntro(
        context,
        'Vivamus dui tortor',
        'Nullam felis mauris, egestas eu velit ut, porttitor fermentum dolor. Ut iaculis sapien sit amet quam convallis.',
        ImgApi.intro[2],
        ThemePalette.tertiaryMain
      ),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: darken(ThemePalette.primaryDark, 0.15),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: CarouselSlider(
                items: introList,
                carouselController: _sliderRef,
                options: CarouselOptions(
                  autoPlay: false,
                  initialPage: 0,
                  enlargeFactor: 1,
                  reverse: false,
                  enableInfiniteScroll: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  aspectRatio: 1,
                  viewportFraction: 1,
                  disableCenter: true,
                  height: 400,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
                )
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: introList.asMap().entries.map((entry) {
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
                      color: Colors.white.withValues(alpha: _current == curSlide ? 0.9 : 0.2)),
                  )
                );
              }).toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        padding: EdgeInsets.only(
          left: spacingUnit(2),
          right: spacingUnit(2),
          bottom: spacingUnit(4)
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          /// SKIP BUTTON
          TextButton(
            onPressed: () {
              widget.saveIntroStatus();
            },
            child: Text('SKIP', style: ThemeText.subtitle.copyWith(color: Colors.white))
          ),

          /// NEXT BUTTON
          _current < introList.length - 1 ? FilledButton(
            style: ThemeButton.btnBig.merge(ThemeButton.primary),
            onPressed: () => _sliderRef.nextPage(),
            child: Row(children: [
              Text('NEXT', style: ThemeText.subtitle),
              const SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 16, color: colorScheme(context).onPrimaryContainer)
            ])
          ) : FilledButton(
            style: ThemeButton.btnBig.merge(ThemeButton.primary),
            onPressed: () {
              widget.saveIntroStatus();
            },
            child: Row(children: [
              Text('CONTINUE', style: ThemeText.subtitle),
              const SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 16, color: colorScheme(context).onPrimaryContainer)
            ])
          )
        ])
      ),
    );
  }

  Widget _contentIntro(BuildContext context, String title, String desc, String image, Color color) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: -256,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.withValues(alpha: 0.75)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(image, height: 256, fit: BoxFit.contain),
        ]
      ),
      const VSpace(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: Column(children: [
          Text(title, textAlign: TextAlign.center, style: ThemeText.title.copyWith(color: Colors.white)),
          SizedBox(height: spacingUnit(2)),
          Text(desc, textAlign: TextAlign.center, style: ThemeText.headline.copyWith(color: Colors.white)),
        ],)
      ),
    ]);
  }
}
