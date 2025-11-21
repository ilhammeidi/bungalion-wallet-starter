import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';
import 'package:flutter/material.dart';

class VendorPortraitCard extends StatelessWidget {
  const VendorPortraitCard({
    super.key,
    required this.logo,
    required this.name,
    this.hasPromo = false,
    this.onTap
  });

  final String logo;
  final String name;
  final bool hasPromo;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          /// CARD
          Padding(
            padding: EdgeInsets.only(left: hasPromo ? 4 : 0),
            child: PaperCard(
              content: Container(
                width: double.infinity,
                padding: EdgeInsets.all(4),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  ClipRRect(
                    borderRadius: ThemeRadius.medium,
                    child: Image.network(
                      logo,
                      fit: BoxFit.cover,
                      height: 80,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: 80,
                          height: 80,
                          child: ShimmerPreloader()
                        );
                      },
                    ),
                  ),
                  SizedBox(height: spacingUnit(1)),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, height: 1.1),
                  )
                ]),
              ),
            ),
          ),
      
          /// LABEL RIBBON
          hasPromo ? Positioned(
            top: 2,
            left: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(10),
                  ),
                  color: ThemePalette.tertiaryMain,
                ),
                child: Text('PROMO', textAlign: TextAlign.center, style: ThemeText.caption.copyWith(color: Colors.white, fontSize: 8),),
              ),
              Container(
                width: 4,
                height: 3,
                decoration: BoxDecoration(
                  color: ThemePalette.tertiaryDark,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              )
            ])
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }
}