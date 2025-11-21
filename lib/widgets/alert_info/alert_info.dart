import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_radius.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

enum AlertType { error, warning, success, info }

class AlertInfo extends StatelessWidget {
  const AlertInfo({super.key, required this.type, required this.text});

  final AlertType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color statusColor(type) {
      switch(type) {
        case AlertType.error:
          return Colors.red;
        case AlertType.warning:
          return Colors.orangeAccent;
        case AlertType.success:
          return Colors.green;
        case AlertType.info:
          return Colors.lightBlue;
        default:
          return Colors.transparent;
      }
    }

    Icon statusIcon(type) {
      switch(type) {
        case AlertType.error:
          return const Icon(Icons.close, color: Colors.red);
        case AlertType.warning:
          return const Icon(Icons.warning_amber_outlined, color: Colors.orangeAccent);
        case AlertType.success:
          return const Icon(Icons.check_circle_outline, color: Colors.green);
        case AlertType.info:
          return const Icon(Icons.info_outline, color: Colors.lightBlue);
        default:
          return const Icon(Icons.info_outline);
      }
    }
    
    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        color: statusColor(type).withValues(alpha: 0.25)
      ),
      child: Row(children: [
        statusIcon(type),
        SizedBox(width: spacingUnit(1)),
        Expanded(child: Text(text, style: ThemeText.paragraph))
      ]),
    );
  }
}