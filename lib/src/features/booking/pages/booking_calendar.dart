import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/booking/vm/booking_vm.dart';
import 'package:qr_pay_app/src/features/booking/widgets/item_main_info.dart';
import 'package:qr_pay_app/src/features/booking/widgets/status_booking.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendarPage extends StatefulWidget {
  const BookingCalendarPage({
    super.key,
    required this.viewModel,
  });
  final BookingVm viewModel;

  @override
  State<BookingCalendarPage> createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.booking.tr(),
        actions: [
          GestureDetector(
            onTap: () => context.router.popUntil(
                (route) => route.settings.name == DetailProviderRoute.name),
            child: Container(
                width: 40,
                color: AppColors.none,
                child: SvgPicture.asset(AppSvgImages.closeLarge)),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: AppPaddings.horizontal16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              text: LocaleKeys.cont.tr(),
              onPressed: () => context.router
                  .push(BookingTimePageRoute(viewModel: widget.viewModel)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.horizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ColumnSpacer(1.6),
            ItemMainInfo(viewModel: widget.viewModel),
            const ColumnSpacer(4),
            const StatusBooking(status: Status.calendar),
            const ColumnSpacer(2.4),
            Text(
              '${widget.viewModel.guestCount} ${LocaleKeys.man.tr()}, ${DateFormat.MMMMEEEEd(context.locale.languageCode).format(widget.viewModel.selectedDate)}',
              style: AppTextStyles.bodyL.copyWith(
                color: AppComponents.listitemBodytextColorDefault,
              ),
            ),
            const ColumnSpacer(8),
            Text(
              LocaleKeys.dateOfVisit.tr(),
              style: AppTextStyles.headingH3.copyWith(
                color: AppComponents.listitemTitleColorDefault,
              ),
            ),
            TableCalendar(
              locale: context.locale.languageCode,
              firstDay: widget.viewModel.nowDate,
              lastDay: widget.viewModel.lastDate,
              focusedDay: widget.viewModel.focusedDate,
              daysOfWeekHeight: 32,
              availableGestures: AvailableGestures.all,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: AppTextStyles.bodyM.copyWith(
                  color: AppComponents.listitemBodytextColorDefault,
                ),
                titleTextFormatter: (date, locale) {
                  if (locale == 'ru_RU') {
                    String d = DateFormat.yMMMM(locale)
                        .format(date)
                        .replaceAll('г.', '');
                    return d[0].toUpperCase() + d.substring(1);
                  }
                  return DateFormat.yMMMM(locale).format(date);
                },
                rightChevronIcon: SvgPicture.asset(AppSvgImages.chevronForward),
                leftChevronIcon: SvgPicture.asset(AppSvgImages.chevronBack),
                leftChevronPadding: const EdgeInsets.all(0),
                rightChevronPadding: const EdgeInsets.all(0),
                leftChevronMargin: const EdgeInsets.all(0),
                rightChevronMargin: const EdgeInsets.all(0),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTextStyles.bodyM.copyWith(
                  color: AppComponents.listitemSubtitleColorDefault,
                ),
                weekendStyle: AppTextStyles.bodyM.copyWith(
                  color: AppComponents.listitemSubtitleColorDefault,
                ),
              ),
              calendarStyle: CalendarStyle(
                disabledTextStyle: AppTextStyles.bodyLStrong.copyWith(
                  color: AppComponents.buttongroupButtonGrayTextColorDisabled,
                ),
                defaultTextStyle: AppTextStyles.bodyLStrong.copyWith(
                  color: AppColors.primitiveNeutralcold1000,
                  // AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
                weekendTextStyle: AppTextStyles.bodyLStrong.copyWith(
                  color: AppColors.primitiveNeutralcold1000,
                  // AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
                todayTextStyle: AppTextStyles.bodyLStrong.copyWith(
                  color: AppComponents.functionbuttonAccentTextColorDefault,
                ),
                todayDecoration: const BoxDecoration(shape: BoxShape.circle),
                selectedTextStyle: AppTextStyles.bodyLStrong.copyWith(
                  color: AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
                disabledDecoration: const BoxDecoration(shape: BoxShape.circle),
                selectedDecoration: const BoxDecoration(
                  color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.all(Radius.circular(
                  //     AppComponents.buttongroupButtonLBorderradius)),
                ),
                defaultDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                weekendDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              selectedDayPredicate: (day) =>
                  isSameDay(widget.viewModel.selectedDate, day),
              onDaySelected: (selectedDay, focusedDay) => widget.viewModel
                  .onDaySelect(selectedDay, focusedDay)
                  .then((_) => setState(() {})),
            ),
            const ColumnSpacer(1.6),
          ],
        ),
      ),
    );
  }
}
