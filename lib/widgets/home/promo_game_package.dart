import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/package.dart';
import 'package:ewallet_app/widgets/product/package/package_list_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PromoGamePackage extends StatelessWidget {
  const PromoGamePackage({super.key, this.withCover = true});

  final bool withCover;

  @override
  Widget build(BuildContext context) {
    final List<Package> packageList = [
      gamePackages[0],
      gamePackages[9],
      gamePackages[4],
      gamePackages[10],
      gamePackages[7],
      gamePackages[1],
      gamePackages[11],
      gamePackages[15],
      gamePackages[12],
      gamePackages[14],
    ];

    return PackageListSlider(
      title: 'New Game Package',
      onViewAll: () {
        Get.toNamed(AppLink.gameList);
      },
      packageList: packageList,
      withCover: true,
      coverHeadline: 'GAME',
      coverTitle: 'Most purchased game packages',
      coverImg: ImgApi.promoGame,
    );
  }
}