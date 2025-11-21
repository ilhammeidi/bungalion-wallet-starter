import 'package:flutter/material.dart';

class DatepickerRange extends StatefulWidget {
  const DatepickerRange({
    super.key, this.restorationId,
    required this.startDate, required this.endDate,
    required this.selectDateRange, required this.calendarButton, 
  });

  final String? restorationId;
  final RestorableDateTimeN startDate;
  final RestorableDateTimeN endDate;
  final Function(DateTimeRange?) selectDateRange;
  final Widget calendarButton;

  @override
  State<DatepickerRange> createState() => _DatepickerRangeState();
}

class _DatepickerRangeState extends State<DatepickerRange> with RestorationMixin  {
  @override
  String? get restorationId => widget.restorationId;

  late final RestorableRouteFuture<DateTimeRange?> _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
        onComplete: widget.selectDateRange,
        onPresent: (NavigatorState navigator, Object? arguments) {
          return navigator.restorablePush(
            _dateRangePickerRoute,
            arguments: <String, dynamic>{
              'initialStartDate': widget.startDate.value?.millisecondsSinceEpoch,
              'initialEndDate': widget.endDate.value?.millisecondsSinceEpoch,
            },
          );
        },
      );

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  @pragma('vm:entry-point')
  static Route<DateTimeRange?> _dateRangePickerRoute(BuildContext context, Object? arguments) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return DateRangePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDateRange: _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
          firstDate: DateTime(2024),
          currentDate: DateTime.now(),
          lastDate: DateTime(2027),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null && arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(arguments['initialEndDate'] as int),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _restorableDateRangePickerRouteFuture.present();
      },
      child: widget.calendarButton
    );
  }
}