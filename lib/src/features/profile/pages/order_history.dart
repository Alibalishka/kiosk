import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/profile/widgets/item_hitory.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/not_authorized_view.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  late HistoryOrderBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HistoryOrderBloc(authRepository: sl<AuthRepository>())
      ..add(const HistoryOrderEvent.fetchHistoryOrder());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.orderHistory.tr(),
        hasLeading: true,
      ),
      body: BlocBuilder<HistoryOrderBloc, HistoryOrderState>(
        bloc: bloc,
        builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const ShimmerLoadingHorizontal(count: 10),
            failed: (_) => const ShimmerLoadingHorizontal(count: 10),
            success: (data) => data.isEmpty
                ? Padding(
                    padding: AppPaddings.horizontal16,
                    child: NotAutorizedView(
                      title: LocaleKeys.ordersHere.tr(),
                      subtitle: LocaleKeys.ordersHereDesc.tr(),
                      buttonText: '',
                      button: false,
                      image: AppWebpImages.noOrders,
                    ),
                  )
                : SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              padding: AppPaddings.all,
                              decoration: BoxDecoration(
                                color: AppComponents.blockBgColorDefault,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getDayMonth2(entry.key),
                                    style: AppTextStyles.bodyLStrong.copyWith(
                                      color: AppComponents
                                          .blockBlocktitleSubtitleColorDefault,
                                    ),
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: entry.value.length,
                                    itemBuilder: (context, orderIndex) =>
                                        ItemHistoryOrder(
                                            data: entry.value[orderIndex]),
                                    separatorBuilder: (context, orderIndex) =>
                                        const Divider(
                                      color: AppComponents.dividerColorDefault,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )

            // SingleChildScrollView(
            //     child: SafeArea(
            //       child: ListView(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         children: data.entries.map((entry) {
            //           return Column(
            //             children: [
            //               Text('Дата: ${entry.key}'),
            //               Column(
            //                 children: entry.value.map((order) {
            //                   return ItemHistoryOrder(data: order);
            //                 }).toList(),
            //               ),
            //             ],
            //           );
            //         }).toList(),
            //       ),
            //       // GroupedListView<HistoryOrderDatum, String>(
            //       //   shrinkWrap: true,
            //       //   reverse: true,
            //       //   physics: const NeverScrollableScrollPhysics(),
            //       //   //  padding: AppPaddings.horizontal16,
            //       //   elements: data.data ?? [],
            //       //   groupBy: (element) =>
            //       //       (element.createdAt ?? DateTime.now())
            //       //           .toString()
            //       //           .substring(0, 10),
            //       //   itemComparator: (e1, e2) =>
            //       //       (e1.createdAt ?? DateTime.now())
            //       //           .compareTo(e2.createdAt ?? DateTime.now()),
            //       //   // groupHeaderBuilder: (w) => Text(w.id.toString()),
            //       //   groupSeparatorBuilder: (value) => Padding(
            //       //     padding: EdgeInsets.symmetric(vertical: 8),
            //       //     child: Text(
            //       //       getDayMonth2(value),
            //       //       style: AppTextStyles.headingH3.copyWith(
            //       //         color:
            //       //             AppComponents.blockBlocktitleTitleColorDefault,
            //       //       ),
            //       //     ),
            //       //   ),
            //       //   // separator: const ColumnSpacer(0.8),

            //       //   itemBuilder: (ctx, e) => ItemHistoryOrder(
            //       //     data: e,
            //       //     // date: getDayMonth2((e.createdAt ?? DateTime.now())
            //       //     //     .toString()
            //       //     //     .substring(0, 10)),
            //       //   ),
            //       // ),
            //     ),
            //   ),
            ),
      ),
    );
  }
}
