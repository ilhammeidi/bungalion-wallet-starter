import 'package:ewallet_app/models/list_item.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:ewallet_app/utils/grabber_icon.dart';
import 'package:flutter/material.dart';

class BottomPickerRadio extends StatefulWidget {
  const BottomPickerRadio({
    super.key,
    this.title,
    this.initialValue,
    required this.options,
  });

  final String? title;
  final String? initialValue;
  final List<ListItem> options;

  @override
  State<BottomPickerRadio> createState() => _BottomPickerRadioState();
}

class _BottomPickerRadioState extends State<BottomPickerRadio> {
  String? _value;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      setState(() {
        _value = widget.initialValue ?? widget.options[0].value;
      });
    }
  }

  void _onChanged(String? newValue, BuildContext context) {
    setState(() {
      _value = newValue;
    });
    Navigator.pop(context, newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colorScheme(context).surface,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const GrabberIcon(),
            const VSpace(),
            Text(
              widget.title ?? '',
              style: ThemeText.subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorScheme(context).surface,
              ),
              child: RadioGroup<String>(
                groupValue: _value,
                onChanged: (String? value) => _onChanged(value, context),
                child: Column(
                  children: [
                    ...widget.options.map(
                      (option) => ListTile(
                        onTap: () => _onChanged(option.value, context),
                        title: Text(option.label),
                        subtitle:
                          option.text != null ? Text(option.text ?? '') : null,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                          ),
                        contentPadding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        minVerticalPadding: 0,
                        leading: Radio<String>(
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                          ),
                          value: option.value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const VSpace()
          ],
        ),
      ),
    );
  }
}