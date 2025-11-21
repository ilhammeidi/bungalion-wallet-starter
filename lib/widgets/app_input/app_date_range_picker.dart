import 'package:ewallet_app/widgets/app_input/app_textfield.dart';
import 'package:flutter/material.dart';

class AppDateRangePicker extends StatefulWidget {
  const AppDateRangePicker({
    super.key,
    this.restorationId,
    required this.dateRangeRef,
    required this.selectDateRange,
    required this.startDate,
    required this.endDate,
  });

  final String? restorationId;
  final TextEditingController dateRangeRef;
  final Function(DateTimeRange?) selectDateRange;
  final RestorableDateTimeN startDate;
  final RestorableDateTimeN endDate;

  @override
  State<AppDateRangePicker> createState() => _AppDateRangePickerState();
}

class _AppDateRangePickerState extends State<AppDateRangePicker> with RestorationMixin {
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
    registerForRestoration(widget.startDate, 'start_date');
    registerForRestoration(widget.endDate, 'end_date');
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
          firstDate: DateTime(2025, 1, 1),
          currentDate: DateTime.now(),
          lastDate: DateTime(2026),
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
    return AppTextField(
      label: 'Set Date',
      onChanged: (_) => {},
      controller: widget.dateRangeRef,
      readOnly: true,
      prefixIcon: Icons.calendar_month,
      onTap: () {
        _restorableDateRangePickerRouteFuture.present();
      },
    );
  }
}