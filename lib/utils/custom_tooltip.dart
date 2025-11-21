import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

class MTooltip extends StatelessWidget {
  final TooltipController controller;
  final String title;

  const MTooltip({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentDisplayIndex = controller.nextPlayIndex + 1;
    final totalLength = controller.playWidgetLength;
    final hasNextItem = currentDisplayIndex < totalLength;
    final hasPreviousItem = currentDisplayIndex != 1;
    final canPause = currentDisplayIndex < totalLength;

    return Container(
      width: size.width * .7,
      decoration: BoxDecoration(
        color: colorScheme(context).surface,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(spacingUnit(1)),
      margin: EdgeInsets.all(spacingUnit(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(title, style: ThemeText.paragraph)),
              Opacity(
                opacity: totalLength == 1 ? 0 : 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '$currentDisplayIndex of $totalLength',
                    style: TextStyle(
                        color: colorScheme(context).onSurfaceVariant,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme(context).outline,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: canPause ? 1 : 0,
                child: TextButton(
                  style: ThemeButton.textInvert(context),
                  onPressed: () {
                    controller.dismiss();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Skip'),
                  ),
                ),
              ),
              const Spacer(),
              Opacity(
                opacity: hasPreviousItem ? 1 : 0,
                child: OutlinedButton(
                  onPressed: () {
                    controller.previous();
                  },
                  style: ThemeButton.btnSmall.merge(ThemeButton.outlinedInvert(context)),
                  child: const Text('Prev'),
                ),
              ),
              SizedBox(width: spacingUnit(1)),
              FilledButton(
                onPressed: () {
                  controller.next();
                },
                style: ThemeButton.btnSmall.merge(ThemeButton.invert(context)),
                child: Text(hasNextItem ? 'Next' : 'Got It'),
              ),
            ],
          )
        ],
      ),
    );
  }
}