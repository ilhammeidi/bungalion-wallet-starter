import 'package:ewallet_app/models/voucher.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/widgets/app_input/app_textfield.dart';
import 'package:ewallet_app/widgets/cards/voucher_card.dart';
import 'package:ewallet_app/widgets/title/title_basic.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class VoucherList extends StatelessWidget {
  const VoucherList({super.key, required this.selectedVouchers, required this.onSelected});

  final List<Voucher> selectedVouchers;
  final Function(String type, Voucher item) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(
        children: [
          const GrabberIcon(),
          Expanded(
            child: ListView(shrinkWrap: true, children: [
              const VSpaceShort(),
              const TitleBasic(title: 'Use Promo Code', size: 'small'),
              const VSpaceShort(),
              AppTextField(
                label: 'Input Promo Code',
                onChanged: (_) {},
                suffix: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ThemeButton.btnSmall.merge(ThemeButton.outlinedPrimary(context)),
                    child: Text('USE CODE', style: ThemeText.caption),
                  ),
                ),
              ),
              const VSpaceBig(),
              const TitleBasic(title: 'Available Vouchers', size: 'small'),
              const VSpaceShort(),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: ((BuildContext context, int index) {
                  Voucher item = voucherList[index];
                  return Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.only(bottom: spacingUnit(2)),
                    child: VoucherCard(
                      title: item.title,
                      desc: item.desc,
                      onSelected: (bool? value) {
                        if (value == true) {
                          onSelected('add', item);
                        } else {
                          onSelected('remove', item);
                        }
                      },
                      isSelected: selectedVouchers.contains(item),
                      color: item.color,
                      image: item.image ?? item.image,
                    ),
                  );
                }),
              ),
              const VSpace(),
              const TitleBasicSmall(title: 'Unavailable Vouchers'),
              const VSpaceShort(),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: ((BuildContext context, int index) {
                  Voucher item = voucherList[index + 5];
                  return Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.only(bottom: spacingUnit(2)),
                    child: VoucherCard(
                      title: item.title,
                      desc: item.desc,
                      onSelected: (_) {},
                      isSelected: false,
                      color: item.color,
                      image: item.image ?? item.image,
                      status: VoucherStatus.disable,
                    ),
                  );
                }),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Get.back();
                },
                style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
                child: Text('DONE', style: ThemeText.subtitle2)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
