import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_palette.dart';

class DashedBorder extends StatelessWidget {
  const DashedBorder({super.key, this.color, this.direction = 'horizontal'});

  final Color? color;
  final String direction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        int dashLength = direction == 'horizontal' ?
          (constrains.constrainWidth()/10).floor() 
          : (constrains.constrainHeight()/10).floor();

        return Flex(
          direction: direction == 'horizontal' ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            dashLength,
            (index) => SizedBox(
              width: direction == 'horizontal' ? 5 : 2,
              height: direction == 'horizontal' ? 2 : 5,
              child: DecoratedBox(decoration: BoxDecoration(
                color: color ?? colorScheme(context).outline,
              ))
            ),
          ),
        );
      },
    );
  }
}
