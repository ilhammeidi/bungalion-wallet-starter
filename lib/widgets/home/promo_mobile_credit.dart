import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/credit.dart';
import 'package:ewallet_app/widgets/product/topup/topup_list_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PromoMobileCredit extends StatelessWidget {
  const PromoMobileCredit({super.key, this.withCover = true});

  final bool withCover;

  @override
  Widget build(BuildContext context) {
    return TopupListSlider(
      title: 'Mobile Credit Vouchers',
      creditList: mobileCredits,
      withCover: true,
      coverHeadline: 'MOBILE',
      coverTitle: 'The best only for you',
      coverImg: ImgApi.promoMobile,
      category: 'mobile',
      creditType: CreditType.money,
      onViewAll: () {
        Get.toNamed(AppLink.mobileList);
      },
    );
  }
}