import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';

class VendorLandscapeCard extends StatelessWidget {
  const VendorLandscapeCard({
    super.key,
    required this.logo,
    required this.name,
    this.desc,
    this.hasPromo = false,
    this.onTap
  });

  final String logo;
  final String name;
  final String? desc;
  final bool hasPromo;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      flat: true,
      content: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: spacingUnit(2), vertical: spacingUnit(1)),
        minTileHeight: 56,
        leading: SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: ThemeRadius.medium,
            child: Image.network(
              logo,
              fit: BoxFit.contain,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 40,
                  height: 40,
                  child: ShimmerPreloader()
                );
              },
            ),
          ),
        ),
        title: Row(children: [
          Expanded(child: Text(name, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeText.paragraphBold)),
          SizedBox(width: spacingUnit(1)),
          hasPromo ? Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ThemePalette.tertiaryMain,
              borderRadius: ThemeRadius.big
            ),
            child: Text('PROMO', style: ThemeText.caption.copyWith(color: Colors.white)),
          ) : Container()
        ]),
        subtitle: desc != null ? Text(desc!, maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeText.paragraph) : Container(),
        trailing: Icon(Icons.arrow_forward_ios, size: 12, color: colorScheme(context).onPrimaryContainer)
      ),
    );
  }
}