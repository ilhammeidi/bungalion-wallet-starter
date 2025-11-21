import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';

class LikeBtn extends StatefulWidget {
  const LikeBtn({
    super.key,
    this.invert = false,
    this.highContrast = false,
    this.hasBg = false
  });

  final bool invert;
  final bool hasBg;
  final bool highContrast;

  @override
  State<LikeBtn> createState() => _LikeBtnState();
}

class _LikeBtnState extends State<LikeBtn> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
      style: widget.hasBg ? IconButton.styleFrom(
        backgroundColor: colorScheme(context).surface,
        shadowColor: Colors.grey.withValues(alpha: 0.5),
        elevation: 3
      ) : null,
      icon: _isLiked ? Icon(Icons.favorite, size: 32, color: ThemePalette.tertiaryMain)
        : Icon(
            Icons.favorite_border_outlined,
            size: 32,
            shadows: widget.highContrast ? const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)] : null,
            color: widget.invert ? Colors.white : colorScheme(context).onSurface
          )
    );
  }
}