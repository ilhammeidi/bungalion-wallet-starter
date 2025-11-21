import 'package:flutter/material.dart';
import 'package:ewallet_app/widgets/decorations/rounded_bottom.dart';
import 'package:ewallet_app/widgets/decorations/rounded_top.dart';

class RoundedDecoMain extends StatelessWidget {
  const RoundedDecoMain({
    super.key,
    this.toBottom = false,
    this.baseHeight = 5,
    required this.height,
    required this.bgDecoration
  });

  final bool toBottom;
  final double height;
  final double baseHeight;
  final BoxDecoration bgDecoration;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: toBottom ? RoundedClipPathBottom() : RoundedClipPathTop(height: baseHeight),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: bgDecoration
      ),
    );
  }
}