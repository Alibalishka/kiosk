import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

enum Status { guest, calendar, time }

class StatusBooking extends StatelessWidget {
  const StatusBooking({
    super.key,
    this.status = Status.guest,
  });
  final Status status;

  @override
  Widget build(BuildContext context) {
    Color guestColor, calendarColor, timeColor;

    switch (status) {
      case Status.guest:
        guestColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
        calendarColor = AppComponents.buttongroupButtonGrayBgColorDefault;
        timeColor = AppComponents.buttongroupButtonGrayBgColorDefault;
        break;
      case Status.calendar:
        guestColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
        calendarColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
        timeColor = AppComponents.buttongroupButtonGrayBgColorDefault;
        break;
      case Status.time:
        guestColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
        calendarColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
        timeColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
        break;
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: guestColor,
          ),
          child: SvgPicture.asset(
            AppSvgImages.people,
            color: AppComponents.buttongroupButtonPrimaryIconColorDefault,
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppComponents.dividerColorDefault),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: calendarColor,
          ),
          child: SvgPicture.asset(
            AppSvgImages.calendar2,
            color: AppComponents.buttongroupButtonPrimaryIconColorDefault,
          ),
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppComponents.dividerColorDefault),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: timeColor,
          ),
          child: SvgPicture.asset(
            AppSvgImages.timeCircle,
            color: AppComponents.buttongroupButtonPrimaryIconColorDefault,
          ),
        ),
      ],
    );
  }
}
