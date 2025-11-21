import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.subtitle,
    required this.point,
  });
  
  final String image;
  final String logo;
  final String title;
  final String subtitle;
  final int point;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.big,
        color: colorScheme(context).primaryContainer
      ),
      child: Column(
        children: [
          Expanded(
            child: PaperCard(
              content: Padding(
                padding: EdgeInsets.all(spacingUnit(1)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 100,
                    child: ClipRRect(
                      borderRadius: ThemeRadius.medium,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: ShimmerPreloader()
                          );
                        },
                    )),
                  ),
                  SizedBox(height: spacingUnit(1)),
                  Row(
                    children: [
                      AvatarNetwork(
                        radius: 10,
                        backgroundImage: logo,
                        type: 'vandor',
                      ),
                      const SizedBox(width: 4),
                      Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeText.subtitle2),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeText.paragraph)
                ]),
              )
            ),
          ),

          /// POINT AND ACTION BUTTON
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: 4),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('$point Point', style: ThemeText.paragraph.copyWith(color: colorScheme(context).onPrimaryContainer, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_circle_right_outlined, color: colorScheme(context).onPrimaryContainer, size: 16)
            ]),
          )
        ],
      )
    );
  }
}