import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_order.dart';

class ItemHistoryOrder extends StatelessWidget {
  const ItemHistoryOrder({
    super.key,
    required this.data,
    // required this.date,
  });
  final HistoryOrderDatum? data;
  // final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.router.push(HistoryOrderDetailPageRoute(id: data!.id!)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.none,

          // color: AppComponents.blockBgColorDefault,
          // borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   date,
            //   style: AppTextStyles.bodyLStrong.copyWith(
            //     color: AppComponents.blockBlocktitleSubtitleColorDefault,
            //   ),
            // ),
            const ColumnSpacer(1.6),
            Row(
              children: [
                Expanded(
                  child: Text(
                    data?.item?.name ?? '',
                    style: AppTextStyles.headingH4.copyWith(
                        color: AppComponents.listitemTitleColorDefault),
                  ),
                ),
                Text(
                  '${priceFormat((((data?.totalPrice ?? 0) - (data?.bonus ?? 0)).floor().toInt()).toString())} ₸',
                  style: AppTextStyles.bodyLStrong
                      .copyWith(color: AppComponents.listitemTitleColorDefault),
                ),
                const RowSpacer(1.2),
                SvgPicture.asset(AppSvgImages.chevronForward)
              ],
            ),
            const ColumnSpacer(0.4),
            Text(
              data?.statusText ?? '',
              style: AppTextStyles.bodyM
                  .copyWith(color: AppComponents.listitemSubtitleColorDefault),
              // OrderStatus().getStatus(data?.statusRaw ?? ''),
              // style: AppTextStyles.bodyM.copyWith(
              //     color:
              //         OrderStatus().getStatusColor(data?.statusRaw ?? '')),
            )
            // data?.totalPrice == 0
            //     ? const SizedBox()
            //     : Column(
            //         children: [
            //           const ColumnSpacer(0.8),
            //           // const CustomDivider(),
            //           const ColumnSpacer(0.8),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 16),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   LocaleKeys.total.tr(),
            //                   style: AppTextStyles.headingH4.copyWith(
            //                       color: AppComponents
            //                           .listitemTitleColorDefault),
            //                 ),
            //                 const Spacer(),
            //                 Text(
            //                   '${priceFormat((((data?.totalPrice ?? 0) - (data?.bonus ?? 0)).floor().toInt()).toString())} ₸',
            //                   style: AppTextStyles.bodyLStrong.copyWith(
            //                       color: AppComponents
            //                           .listitemTitleColorDefault),
            //                 )
            //               ],
            //             ),
            //           ),
            //           const CustomDivider(),
            //           const ColumnSpacer(0.8),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 16),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   LocaleKeys.addBonus.tr(),
            //                   style: AppTextStyles.headingH4.copyWith(
            //                       color: AppComponents
            //                           .listitemTitleColorDefault),
            //                 ),
            //                 const Spacer(),
            //                 Text(
            //                   '+ ${priceFormat((data?.bonusAccured ?? 0).toString())}',
            //                   style: AppTextStyles.bodyLStrong.copyWith(
            //                       color: AppComponents
            //                           .listitemTitleColorDefault),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
          ],
        ),
      ),
    );
  }
}
