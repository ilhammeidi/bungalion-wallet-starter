import 'package:ewallet_app/constants/features_const.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/expanded_section.dart';
import 'package:ewallet_app/widgets/cards/paper_card.dart';

class PricingCard extends StatefulWidget {
  const PricingCard({
    super.key,
    required this.title,
    this.desc,
    required this.price,
    this.discount = 0,
    required this.features,
    required this.enableIcons,
    this.refundable = false,
    this.per = '/room/night before taxes',
    this.expanded = false,
    required this.bookingLink,
  });

  final String title;
  final String? desc;
  final bool refundable;
  final double price;
  final double discount;
  final List<String> features;
  final List<bool> enableIcons;
  final String per;
  final bool expanded;
  final String bookingLink;

  @override
  State<PricingCard> createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard> with SingleTickerProviderStateMixin {
  bool? _isExpanded;

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      flat: true,
      content: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: Column(
          children: [
            /// TITLE HEADER
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = _isExpanded != null ? !_isExpanded! : !widget.expanded;
                });
                if(_isExpanded != null && _isExpanded == true) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: Row(children: [
                /// DESCRIPTION
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(widget.title, style: ThemeText.subtitle2),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        widget.refundable ? 'Refundable' : 'Non-refundable',
                        style: ThemeText.caption.copyWith(color: widget.refundable ? Colors.green : colorScheme(context).onSurfaceVariant),
                      ),
                    ),
                    widget.desc != null ? Text(widget.desc!, maxLines: 2, overflow: TextOverflow.ellipsis,) : Container(),
                  ]),
                ),
                SizedBox(width: spacingUnit(2)),
              
                /// PRICE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.discount > 0 ? Text('\$${widget.price}', style: ThemeText.paragraph.copyWith(decoration: TextDecoration.lineThrough)) : Container(),
                    Text('\$${widget.price - widget.price * widget.discount / 100}', style: ThemeText.title2.copyWith(height: 1, color: ThemePalette.primaryMain)),
                    SizedBox(width: 80, child: Text(widget.per, textAlign: TextAlign.end, style: ThemeText.caption.copyWith(color: colorScheme(context).onSurfaceVariant),))
                  ],
                ),

                /// ARROW
                const SizedBox(width: 8),
                RotationTransition(
                  turns: Tween(begin: widget.expanded && _isExpanded == null ? 0.25 : 0.0, end: 0.25).animate(_controller),
                  child: Icon(Icons.arrow_forward_ios_outlined, size: 24, color: colorScheme(context).onSurfaceVariant)
                ),
              ]),
            ),

            /// BODY DETAIL
            ExpandedSection(
              expand: _isExpanded ?? widget.expanded,
              child: Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: spacingUnit(1)),
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.features.length,
                  itemBuilder: ((BuildContext context, int index){
                    String item = widget.features[index];
                    bool icon = widget.enableIcons[index];
                
                    return ListTile(
                      minTileHeight: 0,
                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 0,
                      minVerticalPadding: 4,
                      leading: icon ?
                        Icon(Icons.check_circle, color: Colors.green, size: 14)
                        : Icon(Icons.close, size: 14, color: colorScheme(context).onSurfaceVariant.withValues(alpha: 0.5)),
                      title: Row(
                        children: [
                          Icon(featureIcon[item], size: 14, color: icon ? colorScheme(context).onSurface : colorScheme(context).onSurfaceVariant.withValues(alpha: 0.5)),
                          SizedBox(width: 4),
                          Text(item, style: ThemeText.paragraph.copyWith(color: icon ? colorScheme(context).onSurface : colorScheme(context).onSurfaceVariant.withValues(alpha: 0.5))),
                        ],
                      ),
                    );
                  }) 
                ),
                const VSpaceShort(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Get.toNamed(widget.bookingLink);
                    },
                    style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
                    child: Text('BOOK', style: ThemeText.subtitle2,)
                  ),
                )
              ])
            )
          ],
        ),
      )
    );
  }
}