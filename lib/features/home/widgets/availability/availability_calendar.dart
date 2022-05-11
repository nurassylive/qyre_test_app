import 'package:flutter/material.dart';
import 'package:qyre_test/features/home/models/day.dart';
import 'package:qyre_test/features/home/widgets/availability/availability_calendar_container.dart';

class AvailabilityCalendar extends StatelessWidget {
  final bool inAppBar;
  final EdgeInsets padding;

  AvailabilityCalendar({
    Key? key,
    required this.inAppBar,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
    ),
  }) : super(key: key);

  final List<Day> _calendarData = [
    Day(time: '2021-10-18T00:00:00.000Z', active: false),
    Day(time: '2021-10-19T00:00:00.000Z'),
    Day(time: '2021-10-20T00:00:00.000Z', active: true),
    Day(time: '2021-10-21T00:00:00.000Z', active: false),
    Day(time: '2021-10-22T00:00:00.000Z'),
    Day(time: '2021-10-23T00:00:00.000Z'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          _calendarData.length,
          (index) => AvailabilityCalendarContainer(
            index: index,
            day: _calendarData[index],
            sameHight: inAppBar,
          ),
        ),
      ),
    );
  }
}
