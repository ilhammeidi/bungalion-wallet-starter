import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class TitleBasic extends StatelessWidget {
  const TitleBasic({
    super.key,
    required this.title,
    this.desc,
    this.size = 'medium',
    this.align
  });

  final String title;
  final String size;
  final String? desc;
  final CrossAxisAlignment? align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align ?? CrossAxisAlignment.start,
      children: [
        Text(title, style: size != 'medium' ? ThemeText.subtitle2 : ThemeText.subtitle),
        const SizedBox(height: 4),
        desc != null ? Text(desc!, overflow: TextOverflow.ellipsis) : Container(),
      ],
    );
  }
}

class TitleBasicSmall extends StatelessWidget {
  const TitleBasicSmall({
    super.key,
    required this.title,
    this.desc
  });

  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: ThemeText.headline),
        desc != null ? const SizedBox(height: 4) : Container(),
        desc != null ? Text(desc!, overflow: TextOverflow.ellipsis) : Container(),
      ],
    );
  }
}

class TitleBasicSeparator extends StatelessWidget {
  const TitleBasicSeparator({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: spacingUnit(2)),
      decoration: BoxDecoration(
        color: colorScheme.surfaceDim
      ),
      child: TitleBasicSmall(title: title)
    );
  }
}