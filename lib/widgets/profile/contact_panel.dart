import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/models/user.dart';
import 'package:ewallet_app/ui/themes/theme_breakpoints.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/widgets/title/title_action.dart';
import 'package:ewallet_app/widgets/user/avatar_network.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ContactPanel extends StatelessWidget {
  const ContactPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final bool wideScreen = ThemeBreakpoints.smUp(context);
    
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Favorite Contacts & ID\'s',
          textAction: 'View All',
          onTap: () {
            Get.toNamed(AppLink.favoritesContact);
          },
        ),
      ),
      VSpaceShort(),
      Padding(
        padding: EdgeInsets.only(left: spacingUnit(3), right: spacingUnit(2)),
        child: Row(
          children: [
            Row(children: List.generate(6, (index) {
              return Align(
                widthFactor: wideScreen ? 1.1 : 0.7,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppLink.transferPersonal);
                  },
                  child: AvatarNetwork(
                    radius: 22,
                    backgroundImage: userList[index].avatar
                  ),
                ),
              );
            })),
            Container(
              margin: EdgeInsets.only(left: wideScreen ? spacingUnit(1) : 0),
              width: 150,
              height: 45,
              child: FilledButton(
                onPressed: () {
                  Get.toNamed(AppLink.transfer);
                },
                style: ThemeButton.btnBig.merge(ThemeButton.tonalSecondary(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Send Money', style: ThemeText.paragraphBold,),
                    SizedBox(width: 4),
                    Icon(Icons.shortcut, size: 18),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}