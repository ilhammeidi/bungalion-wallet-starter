import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.thumb, required this.title, required this.date});

  final String thumb;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      content: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: Image.network(
              thumb,
              width: double.infinity,
              height: 80,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: ShimmerPreloader()
                );
              },
            )
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              date,
              style: ThemeText.caption.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)
            ),
          ),
          Text(
            title.toCapitalCase(),
            style: ThemeText.paragraph,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ]),
      )
    );
  }
}