import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';

class TabMenuBasic extends StatelessWidget {
  const TabMenuBasic({
    super.key,
    required this.onSelect,
    required this.current,
    required this.menus,
  });

  final Function(int) onSelect;
  final int current;
  final List<String> menus; 

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme(context).surface,
        gradient: ThemePalette.gradientMixedAllLight,
        borderRadius: ThemeRadius.big,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menus.asMap().entries.map((entry) {
          String item = entry.value;
          int index = entry.key;

          return Expanded(
            flex: 1,
            child: _buttonTab(current == index, item, () => onSelect(index)),
          );
        }).toList()
      ),
    );
  }

  Widget _buttonTab(bool isSelected, String text, Function() onSelect) {
    return FilledButton(
      onPressed: () {
        onSelect();
      },
      style: FilledButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.transparent,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.big
        ),
        padding: EdgeInsets.symmetric(horizontal: 0)
      ),
      child: Text(text, style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}