import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/booking/pages/booking_time.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/reservation_response.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:share_plus/share_plus.dart';

class HistoryBookingDetailPage extends StatelessWidget {
  const HistoryBookingDetailPage({
    super.key,
    required this.data,
  });
  final ReservationDatum? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.bookingDetails.tr(),
        hasLeading: true,
        actions: [
          data?.statusRaw == 'confirmed'
              ? GestureDetector(
                  onTap: () {
                    final text =
                        'Вас приглашают в ${data?.itemName}. \n🗓️ ${DateFormat.MMMMEEEEd(context.locale.languageCode).format(data?.date ?? DateTime.now())} \n🕑 ${DateFormat('HH:mm').format(data?.date ?? DateTime.now())} \n📍 ${data?.itemAddress}';
                    Share.share(
                        '$text \n\nСкачайте ${context.read<ProfileVm>().configuration?.data?.organizationName} по ссылке: https://chayla.go.qrpay.kz/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(
                      AppSvgImages.share,
                      color: AppComponents.navbarIconrightregularColorDefault,
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.horizontal16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: AppPaddings.all,
              decoration: BoxDecoration(
                color: AppComponents.blockBgColorDefault,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppComponents
                              .buttongroupButtonPrimaryBgColorDefault,
                        ),
                        child: SvgPicture.asset(
                          AppSvgImages.sandyqProductLogo,
                          height: 24,
                        ),
                      ),
                      const RowSpacer(1.2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.itemName ?? 'null',
                              style: AppTextStyles.headingH4.copyWith(
                                color: AppComponents.listitemTitleColorDefault,
                              ),
                            ),
                            Text(
                              data?.itemAddress ?? 'null',
                              style: AppTextStyles.bodyM.copyWith(
                                color:
                                    AppComponents.listitemSubtitleColorDefault,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const ColumnSpacer(1.6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          LocaleKeys.reservationNumber.tr(),
                          style: AppTextStyles.headingH4.copyWith(
                            color: AppComponents.listitemTitleColorDefault,
                          ),
                        ),
                      ),
                      Text(
                        data?.remarkedReserveId.toString() ?? 'null',
                        style: AppTextStyles.bodyLStrong.copyWith(
                          color: AppComponents.listitemPricetextColorDefault,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const ColumnSpacer(1.6),
            Container(
              decoration: BoxDecoration(
                color: AppComponents.blockBgColorDefault,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ColumnSpacer(1.6),
                  Padding(
                    padding: AppPaddings.horizontal16,
                    child: Text(
                      LocaleKeys.bookingDetails.tr(),
                      style: AppTextStyles.headingH4.copyWith(
                        color: AppComponents.blockBlocktitleTitleColorDefault,
                      ),
                    ),
                  ),
                  const ColumnSpacer(0.8),
                  const CustomDivider(),
                  const ColumnSpacer(1.6),
                  Padding(
                    padding: AppPaddings.horizontal16,
                    child: ListItem(
                      svgPath: AppSvgImages.calendar2,
                      title: LocaleKeys.date.tr(),
                      subtitle:
                          DateFormat.MMMMEEEEd(context.locale.languageCode)
                              .format(data?.date ?? DateTime.now()),
                    ),
                  ),
                  const ColumnSpacer(2),
                  Padding(
                    padding: AppPaddings.horizontal16,
                    child: ListItem(
                      svgPath: AppSvgImages.timeCircle,
                      title: LocaleKeys.time.tr(),
                      subtitle: DateFormat('HH:mm')
                          .format(data?.date ?? DateTime.now()),
                    ),
                  ),
                  const ColumnSpacer(2),
                  Padding(
                    padding: AppPaddings.horizontal16,
                    child: ListItem(
                      svgPath: AppSvgImages.people,
                      title: LocaleKeys.numberOfGuests.tr(),
                      subtitle: data?.guestsCount ?? 'null',
                    ),
                  ),
                  data?.iikoTableName == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Padding(
                            padding: AppPaddings.horizontal16,
                            child: ListItem(
                              svgPath: AppSvgImages.tableRound,
                              title: LocaleKeys.bookingNumber.tr(),
                              subtitle: data?.iikoTableName ?? 'null',
                            ),
                          ),
                        ),
                  const ColumnSpacer(1.6),
                ],
              ),
            ),
            data?.comment?.isEmpty ?? true
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppComponents.blockBgColorDefault,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const ColumnSpacer(1.6),
                          Padding(
                            padding: AppPaddings.horizontal16,
                            child: Text(
                              LocaleKeys.commentForTheRestaurant.tr(),
                              style: AppTextStyles.headingH4.copyWith(
                                color: AppComponents
                                    .blockBlocktitleTitleColorDefault,
                              ),
                            ),
                          ),
                          const ColumnSpacer(0.8),
                          const CustomDivider(),
                          Padding(
                            padding: AppPaddings.all,
                            child: Text(
                              data?.comment ?? '',
                              style: AppTextStyles.bodyL.copyWith(
                                  color: AppComponents
                                      .listitemBodytextColorDefault),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            const ColumnSpacer(1.6),
            CustomButton(
              text: LocaleKeys.cancelBooking.tr(),
              onPressed: () =>
                  LaunchInBrowserUtil.launchUrl('https://wa.me/77018512141'),
            ),
          ],
        ),
      ),
    );
  }
}
