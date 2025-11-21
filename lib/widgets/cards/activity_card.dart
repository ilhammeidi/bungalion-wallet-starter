import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/ui/themes/theme_text.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
    this.isHighlighted = false,
  });

  final String title;
  final String time;
  final IconData icon;
  final Color color;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: spacingUnit(2),
      ),
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            width: 4,
            color: colorScheme(context).surface
          )
        ),
      ),
      title: Text(time, style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,  style: ThemeText.headline.copyWith(color: isHighlighted ? Colors.orange : colorScheme(context).onSurface)),
        ],
      ),
    );
  }
}