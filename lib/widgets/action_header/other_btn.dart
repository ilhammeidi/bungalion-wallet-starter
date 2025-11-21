import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OtherBtn extends StatelessWidget {
  const OtherBtn({super.key, this.invert = false, this.highContrast = false});

  final bool invert;
  final bool highContrast;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_horiz_outlined,
        color: invert ? Colors.white : colorScheme(context).onSurface,
        shadows: highContrast ? const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)] : null,
      ),
      elevation: 5,
      shadowColor: Colors.black.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
        PopupMenuItem<Widget>(
          child: const Row(children: [
            Icon(Icons.store_outlined),
            SizedBox(width: 4,),
            Text('Home'),
          ]),
          onTap: () {
            Get.offAndToNamed(AppLink.home);
          },
        ),
        PopupMenuItem<Widget>(
          child: const Row(children: [
            Icon(Icons.help_outline_rounded),
            SizedBox(width: 4,),
            Text('Help and supports')
          ]),
          onTap: () {
            Get.offAndToNamed(AppLink.faq);
          },
        ),
        PopupMenuItem<Widget>(
          child: const Row(children: [
            Icon(Icons.report_outlined),
            SizedBox(width: 4,),
            Text('Report this')
          ]),
          onTap: () {
            Get.offAndToNamed(AppLink.contact);
          },
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Widget>(
          child: const Row(children: [
            Icon(Icons.block),
            SizedBox(width: 4,),
            Text('Block this account')
          ]),
          onTap: () {
            Get.offAndToNamed(AppLink.contact);
          },
        ),
      ],
    );
  }
}