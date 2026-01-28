import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/order_status.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/block_title.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';

class HistoryOrderDetailPage extends StatefulWidget {
  const HistoryOrderDetailPage({super.key, required this.id});
  final int id;

  @override
  State<HistoryOrderDetailPage> createState() => _HistoryOrderDetailPageState();
}

class _HistoryOrderDetailPageState extends State<HistoryOrderDetailPage> {
  late HistoryOrderBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HistoryOrderBloc(authRepository: sl<AuthRepository>())
      ..add(HistoryOrderEvent.fetchHistoryDetailOrder(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.yourOrder.tr(),
        hasLeading: true,
      ),
      body: BlocBuilder<HistoryOrderBloc, HistoryOrderState>(
        bloc: bloc,
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const ShimmerLoadingHorizontal(count: 10),
          successDetail: (data) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.semanticBgSurface1,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      BlockTitleWidget(
                        title: data.data?.item?.name ?? '',
                        isSubtitle: true,
                        subtitle:
                            '${LocaleKeys.invoiceFrom.tr()}: ${dayMonthYearByDotAndTime.format(data.data?.createdAt ?? DateTime.now())}',
                        text: data.data?.statusText ?? '',
                        textColor: OrderStatus()
                            .getStatusColor(data.data?.statusRaw ?? ''),
                        divider: false,
                      ),
                      const SeparatorContainer(),
                      const ColumnSpacer(0.8),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         LocaleKeys.orderNumber.tr(),
                      //         style: AppTextStyles.headingH4.copyWith(
                      //             color:
                      //                 AppComponents.listitemTitleColorDefault),
                      //       ),
                      //       const Spacer(),
                      //       Text(
                      //         data.data?.id.toString() ?? '',
                      //         style: AppTextStyles.bodyLStrong.copyWith(
                      //             color: AppComponents
                      //                 .listitemPricetextColorDefault),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const ColumnSpacer(1.6),
                    ],
                  ),
                ),
                //const ColumnSpacer(1.2),
                // Container(
                //   decoration: BoxDecoration(
                //       color: AppComponents.blockBgColorDefault,
                //       borderRadius: BorderRadius.circular(12)),
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: AppPaddings.sym16x12,
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             SvgPicture.asset(AppSvgImages.storefront),
                //             const RowSpacer(1.2),
                //             Expanded(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     data.data?.item?.address ?? '',
                //                     style: AppTextStyles.bodyM.copyWith(
                //                         color: AppComponents
                //                             .listitemBodytextColorDefault),
                //                   ),
                //                   const ColumnSpacer(0.4),
                //                   Text(
                //                     LocaleKeys.restaurantAddress.tr(),
                //                     style: AppTextStyles.bodyM.copyWith(
                //                         color: AppComponents
                //                             .listitemSubtitleColorDefault),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                //const ColumnSpacer(1.2),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.semanticBgSurface1,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      // const ColumnSpacer(1.2),
                      SectionTitle(
                        title: LocaleKeys.yourOrder.tr(),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: AppColors.primitiveNeutralwarm0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Text(
                            data.data?.paymentStatusText ?? '',
                            style: AppTextStyles.bodyM.copyWith(
                                color: OrderStatus().getStatusColorByIndec(
                                    data.data?.paymentStatus ?? 0)),
                          ),
                        ),
                      ),
                      // const ColumnSpacer(1.2),
                      // const CustomDivider(),
                      data.data?.totalPrice == 0
                          ? BlockTitleWidget2(
                              title:
                                  '${LocaleKeys.drinkGift.tr()} ${priceFormat(data.data?.dishes?[0].name.toString() ?? '0')} ₸',
                              price:
                                  '${data.data?.dishes?[0].count}х * ${priceFormat(data.data?.dishes?[0].totalPrice.toString() ?? '0')}  ₸',
                            )
                          : ListView.separated(
                              padding: AppPaddings.empty,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.data?.dishes?.length ?? 0,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const CustomDivider(),
                              itemBuilder: (BuildContext context, int index) {
                                return BlockTitleWidget2(
                                  subtitle:
                                      '${priceFormat(data.data?.dishes?[index].totalPrice.toString() ?? '0')} ₸',
                                  title: data.data?.dishes?[index].name ?? '',
                                  price:
                                      '${data.data?.dishes?[index].count}х * ${priceFormat(data.data?.dishes?[index].totalPrice.toString() ?? '0')}  ₸',
                                );
                              },
                            ),
                    ],
                  ),
                ),
                const SeparatorContainer(),
                //const ColumnSpacer(1.2),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.semanticBgSurface1,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      ListItem2(
                          title: LocaleKeys.orderAmount.tr(),
                          subtitle:
                              '${priceFormat(((data.data?.totalPrice ?? 0) - (data.data?.serviceSum ?? 0)).toString())} ₸'),
                      ListItem2(
                        title: LocaleKeys.service.tr(),
                        subtitle:
                            '${priceFormat(data.data?.serviceSum.toString() ?? '')} ₸',
                      ),
                      ListItem2(
                        title: LocaleKeys.total.tr(),
                        subtitle:
                            '${priceFormat(((data.data?.totalPrice ?? 0) - (data.data?.bonus ?? 0)).toString())} ₸',
                        divider: false,
                        titleStyle: AppTextStyles.headingH4,
                      )
                    ],
                  ),
                ),
                // const ColumnSpacer(1.2),
                // Container(
                //   decoration: const BoxDecoration(
                //     color: AppColors.semanticBgSurface1,
                //     borderRadius: BorderRadius.all(Radius.circular(12)),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       ListItem2(
                //         title: LocaleKeys.bonusesAccrued.tr(),
                //         subtitle: '',
                //       ),
                //       // ListItem2(
                //       //   title: 'Реферальная программа',
                //       //   subtitle: '+ 1000',
                //       // ),
                //       ListItem2(
                //         title: LocaleKeys.cashback.tr(),
                //         subtitle:
                //             '+ ${priceFormat(data.data?.bonusAccured.toString() ?? '0')}',
                //         divider: false,
                //       ),
                //     ],
                //   ),
                // ),
                // const ColumnSpacer(1.2),
                // CustomButton(
                //   text: LocaleKeys.leaveFeedback.tr(),
                //   onPressed: () => context.router.push(
                //     ReviewProviderRoute(
                //       id: data.data?.item?.id ?? 0,
                //       showModal: false,
                //     ),
                //   ),
                // ),
                const ColumnSpacer(1.6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
