import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/booking/vm/booking_vm.dart';
import 'package:qr_pay_app/src/features/booking/widgets/item_main_info.dart';
import 'package:qr_pay_app/src/features/booking/widgets/status_booking.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/reserv_bloc/reserv_bloc.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class BookingTimePage extends StatefulWidget {
  const BookingTimePage({
    super.key,
    required this.viewModel,
  });
  final BookingVm viewModel;

  @override
  State<BookingTimePage> createState() => _BookingTimePageState();
}

class _BookingTimePageState extends State<BookingTimePage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchTimes();
  }

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
      floatingActionButton: widget.viewModel.availableTimes.data?.isEmpty ??
              true
          ? const SizedBox.shrink()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: AppPaddings.horizontal16,
                  child: Text(
                    LocaleKeys.visitingime.tr(),
                    style: AppTextStyles.headingH3.copyWith(
                        color: AppComponents.listitemTitleColorDefault),
                  ),
                ),
                const ColumnSpacer(2),
                SizedBox(
                  height: 48,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
                      child: GestureDetector(
                        onTap: !(widget.viewModel.availableTimes.data![index]
                                    .isFree ??
                                false)
                            ? null
                            : () => widget.viewModel
                                .selectTime(index)
                                .then((value) => setState(() {})),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: !(widget.viewModel.availableTimes
                                        .data![index].isFree ??
                                    false)
                                ? AppComponents
                                    .buttongroupButtonGrayBgColorDefault
                                    .withOpacity(0.5)
                                : widget.viewModel.selectedTime ==
                                        widget.viewModel.availableTimes
                                            .data?[index].startDatetime
                                    ? AppComponents
                                        .buttongroupButtonPrimaryBgColorDefault
                                    : AppComponents
                                        .buttongroupButtonGrayBgColorDefault,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                  AppComponents.buttongroupButtonLBorderradius),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              DateFormat('HH:mm').format(widget
                                      .viewModel
                                      .availableTimes
                                      .data?[index]
                                      .startDatetime ??
                                  DateTime.now()),
                              style: AppTextStyles.bodyLStrong.copyWith(
                                color: !(widget.viewModel.availableTimes
                                            .data![index].isFree ??
                                        false)
                                    ? AppComponents
                                        .buttongroupButtonGrayTextColorDefault
                                        .withOpacity(0.5)
                                    : widget.viewModel.selectedTime ==
                                            widget.viewModel.availableTimes
                                                .data?[index].startDatetime
                                        ? AppComponents
                                            .buttongroupButtonGrayBgColorDefault
                                        : AppComponents
                                            .buttongroupButtonGrayTextColorDefault,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const RowSpacer(0.8),
                    itemCount:
                        widget.viewModel.availableTimes.data?.length ?? 0,
                  ),
                ),
                const ColumnSpacer(2.8),
                Padding(
                  padding: AppPaddings.horizontal16,
                  child: CustomButton(
                    text: widget.viewModel.availableTimes.data?.isEmpty ?? true
                        ? LocaleKeys.back.tr()
                        : LocaleKeys.cont.tr(),
                    onPressed: widget.viewModel.selectedTime == null
                        ? null
                        : () => showCustomSheet(
                              context,
                              child: ModalBooking(viewModel: widget.viewModel),
                            ),
                  ),
                ),
              ],
            ),
      body: BlocConsumer<ReservBloc, ReservState>(
        bloc: widget.viewModel.reservBloc,
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          failed: (error) => showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              textAlign: TextAlign.start,
              message: error,
            ),
            dismissType: DismissType.onSwipe,
          ),
          successFetchTimes: (response) => widget.viewModel
              .initTimes(response)
              .then((value) => setState(() {})),
        ),
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                padding: AppPaddings.horizontal16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ColumnSpacer(1.6),
                    ItemMainInfo(viewModel: widget.viewModel),
                    const ColumnSpacer(4),
                    const StatusBooking(status: Status.time),
                  ],
                ),
              ),
              state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const CircleLoader(),
                successFetchTimes: (response) => response.data?.isEmpty ?? true
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppWebpImages.calendar,
                              height: 130,
                            ),
                            Text(
                              LocaleKeys.noFreeSlots.tr(),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyL.copyWith(
                                  color: AppComponents
                                      .modalModalcontentSubtitleColorDefault),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ModalBooking extends StatelessWidget {
  const ModalBooking({
    super.key,
    required this.viewModel,
  });

  final BookingVm viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservBloc, ReservState>(
      bloc: viewModel.reservBloc,
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        failed: (error) => showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            textAlign: TextAlign.start,
            message: error,
          ),
          dismissType: DismissType.onSwipe,
        ),
        successReserv: () => showCustomSheet(
          context,
          onClose: () => context.router.pop(),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.semanticBgSurface1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            child: BottomSheetContent(
              notClose: true,
              title: LocaleKeys.tableReserved.tr(),
              text: LocaleKeys.restaurantWillContact.tr(),
              buttonText: LocaleKeys.cont.tr(),
              icon: AppWebpImages.backgroundSquareCheck2,
              onTap: () => context.router.push(const HistoryBookinPageRoute()),
            ),
          ),
        ),
      ),
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.only(
              top: 100,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.semanticBgSurface1,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Padding(
                  padding: AppPaddings.horizontal16,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BottomSheetAppBar(
                            title: LocaleKeys.readyToBook.tr(),
                            svg: AppSvgImages.iconLeft,
                          ),
                          const ColumnSpacer(0.8),
                          Text(
                            LocaleKeys.additionalRequests.tr(),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyL.copyWith(
                                color: AppComponents
                                    .modalModalcontentTextcontentSubtitleColorDefault),
                          ),
                          const ColumnSpacer(3.2),
                          ListItem(
                            svgPath: AppSvgImages.people,
                            title: LocaleKeys.numberOfGuests.tr(),
                            subtitle: viewModel.guestCount.toString(),
                          ),
                          const ColumnSpacer(3.2),
                          ListItem(
                            svgPath: AppSvgImages.calendarNumber,
                            title: LocaleKeys.date.tr(),
                            subtitle: DateFormat.MMMMEEEEd(
                                    context.locale.languageCode)
                                .format(viewModel.selectedDate),
                          ),
                          const ColumnSpacer(3.2),
                          ListItem(
                            svgPath: AppSvgImages.timeCircle,
                            title: LocaleKeys.time.tr(),
                            subtitle: DateFormat('HH:mm')
                                .format(viewModel.selectedTime!),
                          ),
                          const ColumnSpacer(3.2),
                          Text(
                            LocaleKeys.commentForTheRestaurant.tr(),
                            style: AppTextStyles.headingH3.copyWith(
                                color: AppComponents.listitemTitleColorDefault),
                          ),
                          const ColumnSpacer(1.6),
                          TextField(
                            controller: viewModel.commentController,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.forExample.tr(),
                              hintStyle: AppTextStyles.bodyL.copyWith(
                                color: AppColors.primitiveNeutral300,
                              ),
                              filled: true,
                              fillColor:
                                  AppComponents.textareaPrimaryBgColorDefault,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            minLines: 4,
                            maxLines: 6,
                            cursorColor: AppComponents
                                .textareaPrimaryPlaceholdertextColorDefault,
                            style: AppTextStyles.bodyL.copyWith(
                              color: AppColors.primitiveNeutralwarm0,
                            ),
                          ),
                          const ColumnSpacer(1.6),
                          state.maybeWhen(
                            loading: () => const CircleLoader(),
                            orElse: () => CustomButton(
                              text: LocaleKeys.bookNow.tr(),
                              onPressed: () => viewModel.canReserve
                                  ? viewModel.reserv()
                                  : viewModel.openWpp(),
                            ),
                          ),
                          const ColumnSpacer(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.svgPath,
    required this.title,
    required this.subtitle,
  });
  final String svgPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          color: AppComponents.listitemIconleftColorDefault,
        ),
        const RowSpacer(1.2),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyM
                .copyWith(color: AppComponents.listitemBodytextColorDefault),
          ),
        ),
        Text(
          subtitle,
          style: AppTextStyles.bodyLStrong
              .copyWith(color: AppComponents.listitemPricetextColorDefault),
        )
      ],
    );
  }
}
