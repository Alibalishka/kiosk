import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/order_status.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/booking/pages/booking_time.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/reserv_bloc/reserv_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/detail_item_repository.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/reservation_response.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/not_authorized_view.dart';

class HistoryBookinPage extends StatefulWidget {
  const HistoryBookinPage({super.key});

  @override
  State<HistoryBookinPage> createState() => _HistoryBookinPageState();
}

class _HistoryBookinPageState extends State<HistoryBookinPage> {
  late ReservBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ReservBloc(detailItemRepository: sl<DetailItemRepository>())
      ..add(const ReservEvent.fetchReserv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.reservations.tr(),
        hasLeading: true,
      ),
      body: BlocConsumer<ReservBloc, ReservState>(
        bloc: bloc,
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
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const ShimmerLoadingHorizontal(count: 10),
          failed: (_) => const ShimmerLoadingHorizontal(count: 10),
          successFetchReserv: (data) => data.data?.isEmpty ?? true
              ? Padding(
                  padding: AppPaddings.horizontal16,
                  child: NotAutorizedView(
                    title: LocaleKeys.noActive.tr(),
                    subtitle: LocaleKeys.noActiveDesc.tr(),
                    buttonText: '',
                    button: false,
                    image: AppWebpImages.reserve,
                  ),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: GroupedListView<ReservationDatum, String>(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: AppPaddings.horizontal16,
                      elements: data.data ?? [],
                      groupBy: (element) => (element.date ?? DateTime.now())
                          .toString()
                          .substring(0, 10),
                      itemComparator: (e1, e2) => (e1.date ?? DateTime.now())
                          .compareTo(e2.date ?? DateTime.now()),
                      groupSeparatorBuilder: (value) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          getDayMonth2(value),
                          style: AppTextStyles.headingH3.copyWith(
                            color:
                                AppComponents.blockBlocktitleTitleColorDefault,
                          ),
                        ),
                      ),
                      separator: const ColumnSpacer(1.2),
                      itemBuilder: (ctx, e) => BookingItem(data: e),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class BookingItem extends StatelessWidget {
  const BookingItem({
    super.key,
    required this.data,
  });
  final ReservationDatum? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.router.push(HistoryBookingDetailPageRoute(data: data)),
      child: Container(
        decoration: BoxDecoration(
          color: AppComponents.blockBgColorDefault,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.all,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          AppComponents.buttongroupButtonPrimaryBgColorDefault,
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
                            color: AppComponents.listitemSubtitleColorDefault,
                          ),
                        ),
                        const ColumnSpacer(0.4),
                        Text(
                          OrderStatus().getStatus(data?.statusRaw ?? ''),
                          style: AppTextStyles.bodyM.copyWith(
                            color: OrderStatus()
                                .getStatusColor(data?.statusRaw ?? ''),
                          ),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    AppSvgImages.chevronForward,
                    color: AppComponents.listitemIconrightColorDefault,
                  ),
                ],
              ),
            ),
            const CustomDivider(),
            const ColumnSpacer(1.2),
            Padding(
              padding: AppPaddings.horizontal16,
              child: ListItem(
                  svgPath: AppSvgImages.timeCircle,
                  title: LocaleKeys.time.tr(),
                  subtitle:
                      DateFormat('HH:mm').format(data?.date ?? DateTime.now())),
            ),
            const ColumnSpacer(1.6),
            Padding(
              padding: AppPaddings.horizontal16,
              child: ListItem(
                svgPath: AppSvgImages.people,
                title: LocaleKeys.numberOfGuests.tr(),
                subtitle: data?.guestsCount ?? 'null',
              ),
            ),
            const ColumnSpacer(1.6),
          ],
        ),
      ),
    );
  }
}
