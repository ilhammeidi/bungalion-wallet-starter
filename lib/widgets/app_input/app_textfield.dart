import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.hint,
    this.errorText,
    this.initialValue,
    this.height = 56,
    this.readOnly = false,
    this.maxLines = 1,
    this.controller,
    this.prefixIcon,
    this.suffix,
    this.prefix,
    this.onTap,
    this.obscureText = false,
    this.validator,
    this.focusCallback,
    this.blurCallback,
    this.type
  });

  final String label;
  final String? hint;
  final String? errorText;
  final String? initialValue;
  final double height;
  final bool readOnly;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final int maxLines;
  final void Function()? onTap;
  final void Function(String) onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function()? focusCallback;
  final Function()? blurCallback;
  final TextInputType? type;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final focusNode = FocusNode();
  bool boxFocus = false;

  @override
  void initState(){
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        if (widget.focusCallback != null) {
          widget.focusCallback!();
        }
        setState(() {
          boxFocus = true;
        });
      } else {
        if (widget.blurCallback != null) {
          widget.blurCallback!();
        }
        setState(() {
          boxFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor() {
      if (widget.errorText != null) {
        return Colors.red[400]!;
      } else {
        if (boxFocus) {
          return ThemePalette.primaryMain;
        } else {
          return Theme.of(context).colorScheme.outline;
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.maxLines == 1 ? widget.height : null,
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.medium,
            color: colorScheme(context).surface,
            border: Border.all(
              width: 1,
              color: borderColor(),
            )
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: widget.prefixIcon != null ? 0 : spacingUnit(1),
              right: widget.suffix != null ? 0 : spacingUnit(1)
            ),
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.initialValue,
              focusNode: focusNode,
              readOnly: widget.readOnly,
              maxLines: widget.maxLines,
              obscureText: widget.maxLines == 1 ? widget.obscureText : false,
              onTap: widget.onTap,
              onChanged: (String value) => widget.onChanged(value),
              validator: widget.validator,
              keyboardType: widget.type,
              decoration: InputDecoration(
                border: InputBorder.none,
                errorStyle: const TextStyle(fontSize: 0),
                enabledBorder: InputBorder.none,
                labelText: widget.label,
                labelStyle: TextStyle(
                  color: widget.errorText != null ? Colors.red : null
                ),
                alignLabelWithHint: widget.maxLines != 1 ? true : false,
                hintText: widget.hint ?? widget.hint,
                prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, size: 20, color: colorScheme(context).onSurface,) : widget.prefix,
                suffixIcon: widget.suffix ?? widget.suffix,
              ),
            ),
          ),
        ),
        widget.errorText != null ?
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(widget.errorText!, style: ThemeText.caption.copyWith(color: Colors.red[400]),)
          ) : Container()
      ],
    );
  }
}