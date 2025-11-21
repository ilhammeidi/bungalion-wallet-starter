import 'package:flutter/material.dart';

typedef WidgetBuilderCallback = Widget Function(BuildContext);

void pushScreen(BuildContext context, WidgetBuilderCallback builder) {
  Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: builder,
    ),
  );
}