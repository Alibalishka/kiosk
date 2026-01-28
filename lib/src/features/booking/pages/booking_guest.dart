import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/booking/vm/booking_vm.dart';
import 'package:qr_pay_app/src/features/booking/widgets/item_main_info.dart';
import 'package:qr_pay_app/src/features/booking/widgets/status_booking.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class BookingGuestPage extends StatefulWidget {
  const BookingGuestPage({
    super.key,
    required this.viewModel,
  });
  final BookingVm viewModel;

  @override
  State<BookingGuestPage> createState() => _BookingPageGuestState();
}

class _BookingPageGuestState extends State<BookingGuestPage>
    with ViewModelMixin<BookingGuestPage, BookingVm> {
  @override
  BookingVm get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.booking.tr(),
        actions: [
          GestureDetector(
            onTap: () => context.router.pop(),
            child: Container(
                width: 40,
                color: AppColors.none,
                child: SvgPicture.asset(AppSvgImages.closeLarge)),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.horizontal16,
            child: Text(
              LocaleKeys.numberOfGuests.tr(),
              style: AppTextStyles.headingH3
                  .copyWith(color: AppComponents.listitemTitleColorDefault),
            ),
          ),
          const ColumnSpacer(2),
          SizedBox(
            height: 48,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const RowSpacer(0.8),
              itemCount: viewModel.guestList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    viewModel.selectGuestCount(viewModel.guestList[index]),
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                  decoration: BoxDecoration(
                    color: viewModel.guestCount == viewModel.guestList[index]
                        ? AppComponents.buttongroupButtonPrimaryBgColorDefault
                        : AppComponents.buttongroupButtonGrayBgColorDefault,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                          AppComponents.buttongroupButtonLBorderradius),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      viewModel.guestList[index].toString(),
                      style: AppTextStyles.bodyLStrong.copyWith(
                        color: viewModel.guestCount ==
                                viewModel.guestList[index]
                            ? AppComponents.buttongroupButtonGrayBgColorDefault
                            : AppComponents
                                .buttongroupButtonGrayTextColorDefault,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const ColumnSpacer(2.8),
          Padding(
            padding: AppPaddings.horizontal16,
            child: CustomButton(
                text: LocaleKeys.cont.tr(),
                onPressed: () {
                  if (viewModel.guestCount == null) {
                    null;
                  } else if (viewModel.guestCount is String) {
                    showCustomSheet(
                      context,
                      child: const NeedMoreInfo(),
                    );
                  } else {
                    context.router
                        .push(BookingCalendarPageRoute(viewModel: viewModel));
                  }
                }

                // viewModel.guestCount == null
                //     ? null
                //     :

                //     () => context.router
                //         .push(BookingCalendarPageRoute(viewModel: viewModel))
                ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.horizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ColumnSpacer(1.6),
            ItemMainInfo(viewModel: viewModel),
            const ColumnSpacer(4),
            const StatusBooking(),
          ],
        ),
      ),
    );
  }
}

class NeedMoreInfo extends StatelessWidget {
  const NeedMoreInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.horizontal16,
      decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ColumnSpacer(0.8),
          const CustomBar(),
          const ColumnSpacer(1.6),
          Image.asset(
            AppWebpImages.backgroundSquarePhone,
            height: 128,
          ),
          const ColumnSpacer(0.8),
          Text(
            LocaleKeys.detailsNeeded.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.headingH2.copyWith(
                color: AppComponents
                    .modalModalcontentTextcontentTitleColorDefault),
          ),
          const ColumnSpacer(1.2),
          Text(
            LocaleKeys.additionalInformationRestaurant.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyL.copyWith(
                color: AppComponents
                    .modalModalcontentTextcontentTitleColorDefault),
          ),
          const ColumnSpacer(1.6),
          CustomButton(
              text: LocaleKeys.call.tr(),
              onPressed: () {
                LaunchInBrowserUtil.launchUrl('https://wa.me/77018512141');
                context.router.pop();
              }),
          const ColumnSpacer(3.2),
        ],
      ),

      // const BottomSheetContent(
      //   notClose: true,
      //   title: 'Нужно уточнить детали',
      //   text:
      //       'Для столиков больше 6 человек, нам нужно больше информации, Пожалуйста, свяжитесь с рестораном.',
      //   buttonText: 'Продолжить',
      //   icon: AppImages.backgroundSquarePhone,
      // ),
    );
  }
}
