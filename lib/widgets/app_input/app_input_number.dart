import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

class AppInputNumber extends StatefulWidget {
  const AppInputNumber({
    super.key,
    this.onAdd,
    this.onRemove,
    this.value,
    this.maxValue,
    this.unit,
  });

  final Function()? onAdd;
  final Function()? onRemove;
  final double? value;
  final double? maxValue;
  final String? unit;

  @override
  State<AppInputNumber> createState() => _AppInputNumberState();
}

class _AppInputNumberState extends State<AppInputNumber> {
  double _localValue = 0;

  void onAdd() {
    if (widget.maxValue != null && _localValue >= widget.maxValue!) return;
    setState(() {
      _localValue++;
    });
  }

  void onRemove() {
    if (_localValue == 0) return;
    setState(() {
      _localValue--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      IconButton(
        onPressed: widget.onRemove ?? onRemove,
        icon: Icon(Icons.remove_circle_outline, color: colorScheme(context).onSurface),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: spacingUnit(1), horizontal: 4),
        child: Text(widget.value != null ? widget.value!.toStringAsFixed(0) : _localValue.toStringAsFixed(0), style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
        child: widget.unit != null ? Text(widget.unit!) : Container(),
      ),
      IconButton(
        onPressed: widget.onAdd ?? onAdd,
        icon: Icon(Icons.add_circle_outline, color: colorScheme(context).onSurface),
      ),
    ]);
  }
}