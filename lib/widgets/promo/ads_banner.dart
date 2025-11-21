import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';


class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    double getHeight() {
      if (ThemeBreakpoints.smUp(context)) {
        return 300;
      } else {
        return 180;
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: ClipRRect(
        borderRadius: ThemeRadius.big,
        child: SizedBox(
          width: double.infinity,
          height: getHeight(),
          child: Image.network(
            img,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: double.infinity,
                height: getHeight(),
                child: ShimmerPreloader()
              );
            },
          )
        ),
      ),
    );
  }
}
