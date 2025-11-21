import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/shimmer_preloader.dart';
import 'package:ewallet_app/widgets/decorations/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum VoucherStatus { disable, enable, readonly }

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    super.key,
    this.image,
    this.color = Colors.orange,
    required this.title,
    required this.desc,
    required this.onSelected,
    required this.isSelected,
    this.status = VoucherStatus.enable
  });

  final String? image;
  final Color color;
  final String title;
  final String desc;
  final Function(bool? val) onSelected;
  final bool isSelected;
  final VoucherStatus status;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: status == VoucherStatus.disable ? 0.5 : 1,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        /// IMAGE OR ICON
        Container(
          height: 100,
          width: 80,
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            border: Border(
              top: BorderSide(color: color, width: 1),
              left: BorderSide(color: color, width: 1),
              bottom: BorderSide(color: color, width: 1),
            ),
          ),
          child: image != null ? ClipRRect(
            borderRadius: ThemeRadius.small,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                image!,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 50,
                    height: 50,
                    child: ShimmerPreloader()
                  );
                },
              )
            ),
          ) : Icon(FontAwesomeIcons.tag, size: 50, color: color),
        ),
        
        /// CUT DECORATION
        SizedBox(
          width: 12,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            _cutDeco(context, false),
            Expanded(child: DashedBorder(direction: 'vertical', color: color, )),
            _cutDeco(context, true),
          ],),
        ),
        
        /// VOUCHER INFO
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 100,
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border(
                top: BorderSide(color: color, width: 1),
                right: BorderSide(color: color, width: 1),
                bottom: BorderSide(color: color, width: 1),
              ),
            ),
            child: ListTile(
              minTileHeight: 0,
              contentPadding: const EdgeInsets.all(0),
              title: Text(title, style: ThemeText.paragraph, maxLines: 1, overflow: TextOverflow.ellipsis,),
              subtitle: Text(desc, style: ThemeText.caption, maxLines: 2, overflow: TextOverflow.ellipsis,),
              trailing: _voucherState(context, status)
            ),
          ),
        )
        
      ]),
    );
  }

  Widget _cutDeco(BuildContext context, bool isLast) {
    const double radius = 12;

    return Container(
      width: radius,
      height: 10,
      decoration: BoxDecoration(
        color: colorScheme(context).surfaceContainerLowest,
        border: Border(
          left: BorderSide(color: color, width: 1),
          right: BorderSide(color: color, width: 1),
          bottom: BorderSide(color: color, width: 1, style: isLast ? BorderStyle.none : BorderStyle.solid),
          top: BorderSide(color: color, width: 1, style: isLast ? BorderStyle.solid : BorderStyle.none),
          
        ),
        borderRadius: BorderRadius.only(
          topLeft: isLast ? const Radius.circular(radius) : const Radius.circular(0),
          topRight: isLast ? const Radius.circular(radius) : const Radius.circular(0),
          bottomLeft: isLast ? const Radius.circular(0) : const Radius.circular(radius),
          bottomRight: isLast ? const Radius.circular(0) : const Radius.circular(radius),
        )
      ),
    );
  }

  Widget _voucherState(BuildContext context, VoucherStatus st) {
    switch(st) {
      case VoucherStatus.disable:
        return SizedBox(width: 60,child: Text('Not Available', textAlign: TextAlign.center, style: ThemeText.caption));
      case VoucherStatus.readonly:
        return Icon(Icons.arrow_forward_ios, color: color, size: 22);
      case VoucherStatus.enable:
        return Checkbox(
          value: isSelected,
          onChanged: onSelected,
          checkColor: Colors.white,
          side: BorderSide(color: color),
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return color;
              }
              return Colors.transparent;
            }
          ),
        );
    }
  }
}