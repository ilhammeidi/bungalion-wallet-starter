import 'package:flutter/material.dart';

double spacingUnit(int val) {
  return val * 8;
}

class VSpace extends StatelessWidget {
  const VSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacingUnit(3));
  }
}

class VSpaceShort extends StatelessWidget {
  const VSpaceShort({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacingUnit(2));
  }
}

class VSpaceBig extends StatelessWidget {
  const VSpaceBig({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacingUnit(6));
  }
}

class LineSpace extends StatelessWidget {
  const LineSpace({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacingUnit(3)),
      child: Divider(
        color: color ?? Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
        thickness: 8,
        indent: 0,
        endIndent: 0,
        height: 8,
      ),
    );
  }
}

class LineList extends StatelessWidget {
  const LineList({super.key, this.spacing = 0});

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: Divider(
        color: Theme.of(context).colorScheme.outline, 
        height: 1,
        thickness: 1
      ),
    );
  }
}
