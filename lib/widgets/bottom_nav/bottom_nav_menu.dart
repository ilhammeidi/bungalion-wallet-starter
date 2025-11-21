import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomNavMenu extends StatelessWidget {
  const BottomNavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = Get.currentRoute;
    
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      elevation: 20,
      shadowColor: Colors.black,
      notchMargin: 10,
      height: 80,
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      padding: const EdgeInsets.all(0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              height: 60,
              width: constraints.maxWidth / 2 - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MenuItem(
                    title: 'Home',
                    icon: Icons.home_filled, 
                    isActive: currentRoute == AppLink.home,
                    onTap: () {
                      Get.toNamed(AppLink.home);
                    }
                  ),
                  MenuItem(
                    title: 'Promo',
                    icon: Icons.sell,
                    isActive: currentRoute == AppLink.promo,
                    onTap: () {
                      Get.toNamed(AppLink.promo);
                    }
                  )
                ]
              )
            ),
            SizedBox(
              height: 60,
              width: constraints.maxWidth / 2 - 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      MenuItem(
                        title: 'Inbox',
                        icon: Icons.notifications,
                        isActive: currentRoute == AppLink.notification,
                        onTap: () {
                          Get.toNamed(AppLink.notification);
                        }
                      ),
                      Positioned(
                        right: 18,
                        top: 5,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: ThemeRadius.big,
                          ),
                        ),
                      )
                    ],
                  ),
                  MenuItem(
                    title: 'You',
                    icon: Icons.person,
                    isActive: currentRoute == AppLink.profile,
                    onTap: () => Get.toNamed(AppLink.profile)
                  ),
                ]
              )
            )
          ]);
        }
      )
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation (
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => {
          onTap()
        },
        child: SizedBox(
          width: 60,
          height: 60,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            isActive ?
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => ThemePalette.gradientMixedMain.createShader(bounds),
                child: Icon(icon),
              ) : Icon(icon),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.big,
                gradient: isActive ? ThemePalette.gradientMixedMain : null
              ),
            )
          ]),
        ),
      ),
    );
  }
}