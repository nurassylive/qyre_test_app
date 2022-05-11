import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qyre_test/core/globals/constants.dart';
import 'package:qyre_test/features/home/models/day.dart';

class AvailabilityCalendarContainer extends StatelessWidget {
  final int index;
  final Day day;
  final bool sameHight;

  const AvailabilityCalendarContainer({
    Key? key,
    required this.index,
    required this.day,
    this.sameHight = false,
  }) : super(key: key);

  double get _getHeight {
    if (sameHight) return 36;
    if (index % 3 == 0) return 111;
    if (index % 3 == 1) return 95;
    return 79.0;
  }

  Widget get circleWidget {
    return Container(
      height: 8.sp,
      width: 8.sp,
      decoration: BoxDecoration(
        color: day.active! ? const Color(0xff87c6f5) : const Color(0xffEC4E27),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateTime = DateTime.tryParse(this.day.time) ?? DateTime.now();
    final weekday = DateFormat(weekdayFmt).format(dateTime);
    final month = DateFormat(monthFmt).format(dateTime);
    final day = DateFormat(dayFmt).format(dateTime);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).backgroundColor,
      ),
      height: _getHeight,
      width: 62.h,
      child: sameHight
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (index == 0)
                      Text(
                        'TODAY',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.subtitle1!.color,
                        ),
                      ),
                    Text(
                      weekday,
                      style: TextStyle(
                        fontSize: sameHight ? 10.sp : 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (this.day.active != null) circleWidget,
                    if (this.day.active != null) const SizedBox(width: 2),
                    Text(
                      '$month $day',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index == 0)
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'TODAY',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.subtitle1!.color,
                      ),
                    ),
                  ),
                if (index == 0) const SizedBox(height: 6),
                Text(
                  weekday,
                  style: TextStyle(
                    fontSize: sameHight ? 10.sp : 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                if (sameHight && this.day.active != null) circleWidget,
                Text(
                  sameHight ? '$month $day' : month,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                if (!sameHight)
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: sameHight ? 10.sp : 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                if (!sameHight && this.day.active != null)
                  const SizedBox(height: 6),
                if (!sameHight && this.day.active != null) circleWidget,
              ],
            ),
    );
  }
}
