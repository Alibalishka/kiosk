import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_bloc/history_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_model.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/qr/widgets/not_authorized_view.dart';

class BonusHistoryPage extends StatefulWidget {
  const BonusHistoryPage({super.key});

  @override
  State<BonusHistoryPage> createState() => _BonusHistoryPageState();
}

class _BonusHistoryPageState extends State<BonusHistoryPage> {
  late HistoryBloc bloc;
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  @override
  void initState() {
    super.initState();
    bloc = HistoryBloc(authRepository: sl())
      ..add(const HistoryEvent.fetchHistory());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.bonusHistory.tr(),
        hasLeading: true,
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        bloc: bloc,
        builder: (context, state) => state.maybeWhen(
          orElse: () => Container(),
          loading: () => const ShimmerLoadingHorizontal(count: 10),
          failed: (_) => const ShimmerLoadingHorizontal(count: 10),
          success: (history) => history.data?.isEmpty ?? true
              ? Padding(
                  padding: AppPaddings.horizontal16,
                  child: NotAutorizedView(
                    title: LocaleKeys.bonusesHere.tr(),
                    subtitle: LocaleKeys.bonusesHereDesc.tr(),
                    buttonText: '',
                    button: false,
                    image: AppWebpImages.noOrders,
                  ),
                )
              : GroupedListView<HistoryDatum, String>(
                  shrinkWrap: true,
                  padding: AppPaddings.horizontal16,
                  elements: history.data ?? [],
                  sort: false,
                  floatingHeader: true,
                  groupBy: (element) =>
                      (element.createdAt ?? DateTime.now()).toString(),
                  itemComparator: (e1, e2) => (dateFormat
                          .parse(e1.createdAt ?? DateTime.now().toString()))
                      .compareTo((dateFormat
                          .parse(e2.createdAt ?? DateTime.now().toString()))),
                  groupSeparatorBuilder: (value) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      getDayMonth2(dateFormat.parse(value).toString()),
                      style: AppTextStyles.headingH3.copyWith(
                        color: AppComponents.blockBlocktitleTitleColorDefault,
                      ),
                    ),
                  ),
                  separator: const ColumnSpacer(0.8),
                  itemBuilder: (ctx, e) => OrderItemWidget(
                    onTap: () {
                      if (e.orderId != null && e.orderId != 0) {
                        context.router.push(
                          HistoryOrderDetailPageRoute(id: e.orderId!),
                        );
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.error(
                            textAlign: TextAlign.start,
                            message: 'Нет данных о заказе',
                          ),
                          dismissType: DismissType.onSwipe,
                        );
                      }
                    },
                    title: '${e.bonus} ${LocaleKeys.points.tr()}',
                    subtitle: e.text,
                  ),
                ),
        ),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String? date;
  final String? title;
  final String? subtitle;

  const OrderItemWidget({
    super.key,
    this.onTap,
    this.date,
    this.subtitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppComponents.blockBgColorDefault,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppPaddings.vertical12,
              child: Row(
                children: [
                  SvgPicture.asset(AppSvgImages.addCircle),
                  const RowSpacer(1.2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? '',
                        style: AppTextStyles.headingH4.copyWith(
                            color:
                                AppComponents.blockBlocktitleTitleColorDefault),
                      ),
                      const ColumnSpacer(0.4),
                      Text(
                        subtitle ?? '',
                        style: AppTextStyles.bodyM.copyWith(
                            color: AppComponents.listitemSubtitleColorDefault),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AppSvgImages.chevronForward,
                    color: AppComponents.listitemIconrightColorDefault,
                  ),
                  //  Text('dss')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyOrder extends StatefulWidget {
//   final String? date;
//   const MyOrder({super.key, this.date});

//   @override
//   State<MyOrder> createState() => _MyOrderState();
// }

// class _MyOrderState extends State<MyOrder> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         text: LocaleKeys.yourOrder.tr(),
//         hasLeading: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: AppPaddings.all,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   color: AppColors.semanticBgSurface1,
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 ),
//                 child: BlockTitleWidget(
//                   title: 'Sandyq',
//                   text: 'Счет от ${widget.date ?? ''}, 15:10',
//                   divider: false,
//                 ),
//               ),
//               const ColumnSpacer(1.2),
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppComponents.blockBgColorDefault,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: AppPaddings.sym16x12,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SvgPicture.asset(AppSvgImages.storefront),
//                           const RowSpacer(1.2),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'г. Алматы, проспект Абылай Хана, 55',
//                                 style: AppTextStyles.bodyM.copyWith(
//                                     color: AppComponents
//                                         .listitemBodytextColorDefault),
//                               ),
//                               const ColumnSpacer(0.4),
//                               Text(
//                                 LocaleKeys.restaurantAddress.tr(),
//                                 style: AppTextStyles.bodyM.copyWith(
//                                     color: AppComponents
//                                         .listitemSubtitleColorDefault),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const ColumnSpacer(1.2),
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.semanticBgSurface1,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Column(
//                   children: [
//                     const ColumnSpacer(1.2),
//                     SectionTitle(title: LocaleKeys.yourOrder.tr()),
//                     const ColumnSpacer(1.2),
//                     const CustomDivider(),
//                     ListView.separated(
//                       padding: AppPaddings.empty,
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: 1,
//                       separatorBuilder: (BuildContext context, int index) =>
//                           const CustomDivider(),
//                       itemBuilder: (BuildContext context, int index) {
//                         return const BlockTitleWidget2(
//                           subtitle: '1 400 ₸',
//                           title: 'Кофе капучино 300мл',
//                           price: '1х * 1 400 ₸',
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const ColumnSpacer(1.2),
//               Container(
//                 decoration: const BoxDecoration(
//                   color: AppColors.semanticBgSurface1,
//                   borderRadius: BorderRadius.all(Radius.circular(12)),
//                 ),
//                 child: Column(
//                   children: [
//                     ListItem2(
//                       title: LocaleKeys.orderAmount.tr(),
//                       subtitle: '1 400 ₸',
//                     ),
//                     const ListItem2(
//                       title: 'Баллов начислено',
//                       subtitle: '1 000',
//                     ),
//                     // ListItem2(
//                     //   title: 'Бонусы',
//                     //   subtitle: '- 1 000 ₸',
//                     // ),
//                     ListItem2(
//                       title: LocaleKeys.total.tr(),
//                       subtitle: '1 400 ₸',
//                       divider: false,
//                     )
//                   ],
//                 ),
//               ),
//               const ColumnSpacer(1.2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
