import 'package:flutter/cupertino.dart';

class ListItem {
  final String value;
  final String label;
  final String? text;
  final IconData? icon;

  ListItem({
    required this.value,
    required this.label,
    this.text,
    this.icon
  });
}