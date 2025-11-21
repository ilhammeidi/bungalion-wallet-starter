import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/models/voucher.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/utils/no_data.dart';
import 'package:ewallet_app/widgets/cards/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PromoVoucherGrid extends StatelessWidget {
  const PromoVoucherGrid({super.key, required this.dataList});

  final List<Voucher> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.isNotEmpty ? GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: spacingUnit(2),
        left: spacingUnit(2),
        right: spacingUnit(2),
        bottom: spacingUnit(10),
      ),
      itemCount: dataList.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 100,
        maxCrossAxisExtent: 400,
        childAspectRatio: 1.1,
        crossAxisSpacing: spacingUnit(2),
        mainAxisSpacing: spacingUnit(2),
      ),
      itemBuilder: (context, index) {
        Voucher item = dataList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(1)),
          child: Container(
            width: double.infinity,
            height: 100,
            padding: EdgeInsets.only(bottom: spacingUnit(2)),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppLink.voucherDetail);
              },
              child: VoucherCard(
                title: item.title,
                desc: item.desc,
                onSelected: (_) {},
                isSelected: false,
                color: item.color,
                image: item.image ?? item.image,
                status: VoucherStatus.readonly
              ),
            ),
          )
        );
      },
    ) : _emptyList(context);
  }

  Widget _emptyList(BuildContext context) {
    return NoData(
      image: ImgApi.nodataVoucher,
      title: 'You don\'t any vouchers yet',
      desc: 'Nulla condimentum pulvinar arcu a pellentesque.',
    );
  }
}

class PromoVoucherList extends StatelessWidget {
  const PromoVoucherList({super.key, required this.dataList});

  final List<Voucher> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.isNotEmpty ? ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: dataList.length,
      padding: EdgeInsets.only(
        top: spacingUnit(2),
        left: spacingUnit(2),
        right: spacingUnit(2),
        bottom: spacingUnit(4),
      ),
      itemBuilder: ((BuildContext context, int index) {
        Voucher item = dataList[index];
        return Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: InkWell(
            onTap: () {
              Get.toNamed(AppLink.voucherDetail);
            },
            child: VoucherCard(
              title: item.title,
              desc: item.desc,
              onSelected: (_) {},
              isSelected: false,
              color: item.color,
              image: item.image ?? item.image,
              status: VoucherStatus.readonly,
            ),
          ),
        );
      }),
    ) : _emptyList(context);
  }

  Widget _emptyList(BuildContext context) {
    return NoData(
      image: ImgApi.nodataVoucher,
      title: 'You don\'t any vouchers yet',
      desc: 'Nulla condimentum pulvinar arcu a pellentesque.',
    );
  }
}