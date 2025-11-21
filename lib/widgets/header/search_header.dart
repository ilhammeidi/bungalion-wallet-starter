import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key, this.hint});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint ?? 'Search...',
          hintStyle: ThemeText.paragraph.copyWith(color: colorScheme(context).onSurface.withValues(alpha: 0.6)),
          border: OutlineInputBorder(
            borderRadius: ThemeRadius.medium,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: ThemeRadius.medium,
            borderSide: BorderSide(
              width: 1,
              color: colorScheme(context).primaryContainer
            )
          ),
          filled: true,
          fillColor: colorScheme(context).surface,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search, size: 20, color: colorScheme(context).onSurface.withValues(alpha: 0.6),),
          ),
          prefixIconConstraints: BoxConstraints(
            maxWidth: 28
          ),
        ),
        style: ThemeText.paragraph.copyWith(color: colorScheme(context).onSurface),
      ),
    );
  }
}