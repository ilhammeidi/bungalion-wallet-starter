import 'package:dropdown_search/dropdown_search.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:ewallet_app/widgets/app_input/app_input_box.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class AppDropdownSearch extends StatefulWidget {
  const AppDropdownSearch({
    super.key,
    required this.hintText,
    this.label,
    required this.items,
    required this.listItem,
    this.filled = false,
  });

  final String hintText;
  final String? label;
  final List<dynamic> items;
  final Widget Function(BuildContext, dynamic) listItem;
  final bool filled;

  @override
  State<AppDropdownSearch> createState() => _AppDropdownSearchState();
}

class _AppDropdownSearchState extends State<AppDropdownSearch> {
  dynamic _selectedItem;

  void onItemChange(dynamic value) {
    setState(() {
      _selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppInputBox(
      filled: widget.filled,
      content: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.label != null ? Padding(
              padding: EdgeInsets.only(bottom: spacingUnit(1)),
              child: Text(widget.label!, style: ThemeText.subtitle2),
            ) : Container(),
            DropdownSearch<dynamic>(
              items: (filter, s) => widget.items,
              compareFn: (i, s) => i == s,
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: ThemeRadius.medium,
                    borderSide: BorderSide(
                      width: 1,
                      color: colorScheme(context).outlineVariant
                    )
                  ),
                ),
              ),
              popupProps: PopupProps.modalBottomSheet(
                title: Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: GrabberIcon(),
                ),
                containerBuilder: (context, popupWidget) => Container(
                  padding: EdgeInsets.only(bottom: spacingUnit(5)),
                  decoration: BoxDecoration(
                    color: colorScheme(context).surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: popupWidget,
                ),
                cacheItems: true,
                showSearchBox: true,
                itemBuilder: (context, value, _, _) => Padding(
                  padding: EdgeInsets.all(spacingUnit(1)),
                  child: widget.listItem(context, value),
                ),
                suggestedItemProps: SuggestedItemProps(
                  showSuggestedItems: true,
                ),
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: OutlineInputBorder(
                      borderRadius: ThemeRadius.medium,
                      borderSide: BorderSide(
                        width: 1,
                        color: colorScheme(context).outline
                      )
                    )
                  )
                ),
              ),
              onChanged: onItemChange,
              selectedItem: _selectedItem,
              dropdownBuilder: (context, selectedItem) {
                return selectedItem != null ? 
                  widget.listItem(context, selectedItem) : Container();
              },
              itemAsString: (item) {
                return item.name;
              },
            ),
          ],
        ),
      ),
    );
  }
}
