import 'package:ewallet_app/ui/themes/theme_palette.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';

class BottomDraggableSheet extends StatefulWidget {
  const BottomDraggableSheet({
    super.key,
    required this.content,
    this.initPosition = 0.3,
    this.maxPosition = 0.9
  });

  final Widget content;
  final double initPosition;
  final double maxPosition;

  @override
  State<BottomDraggableSheet> createState() => _BottomDraggableSheetState();
}

class _BottomDraggableSheetState extends State<BottomDraggableSheet> {
  double _sheetPosition = 0.3;
  final double _dragSensitivity = 600;

  @override
  void initState() {
    setState(() {
      _sheetPosition = widget.initPosition;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: _sheetPosition,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.only(top: spacingUnit(2)),
          decoration: BoxDecoration(
            color: colorScheme(context).surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          child: Column(
            children: <Widget>[
              Grabber(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _sheetPosition -= details.delta.dy / _dragSensitivity;
                    // Min
                    if (_sheetPosition < 0.25) {
                      _sheetPosition = 0.25;
                    }
                    // Max
                    if (_sheetPosition > widget.maxPosition) {
                      _sheetPosition = widget.maxPosition;
                    }
                  });
                },
                isOnDesktopAndWeb: true,
              ),
              Flexible(
                child: widget.content,
              ),
            ],
          ),
        );
      },
    );
  }
}

class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        height: 40,
        color: colorScheme(context).surface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme(context).outline,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}