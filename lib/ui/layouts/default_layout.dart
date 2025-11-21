import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/app_button/back_icon_button.dart';
import 'package:ewallet_app/widgets/header/search_header.dart';
import 'package:ewallet_app/widgets/header/top_decoration.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.showSearch = false,
    this.searchHint
  });

  final String title;
  final Widget content;
  final List<Widget>? actions;
  final bool showSearch;
  final String? searchHint;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Scaffold(
      /// SEARCH HEADER
      appBar: showSearch ? AppBar(
        title: SearchHeader(hint: searchHint),
        leading: BackIconButton(onTap: () {
          Get.back();
        }),
        backgroundColor: colorScheme(context).surface,
        surfaceTintColor: Colors.transparent,
        actions: actions ?? [],
        systemOverlayStyle: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ) : AppBar(
        /// DEFAULT HEADER
        title: Text(title, style: ThemeText.subtitle.copyWith(color: colorScheme(context).onSurface)),
        leading: BackIconButton(onTap: () {
          Get.back();
        }),
        centerTitle: true,
        backgroundColor: colorScheme(context).surface,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: TopDecoration(),
        forceMaterialTransparency: true,
        systemOverlayStyle: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        actions: actions ?? [],
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1024,
          minHeight: 480
        ),
        child: content,
      )
    );
  }
}