import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeItems extends StatelessWidget {
  const ShimmerHomeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppComponents.shimmerBase,
      highlightColor: AppComponents.shimmerHighlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.horizontal16,
            child: Container(
              height: 44,
              //width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: AppColors.primitiveNeutral0,
              ),
            ),
          ),
          const ColumnSpacer(1.2),
          // SizedBox(
          //   height: 36,
          //   child: Container(
          //     width: context.mediaQuery.size.width / 4,
          //     decoration: const BoxDecoration(
          //       color: AppColors.primitiveNeutral0,
          //       borderRadius: BorderRadius.all(Radius.circular(8)),
          //     ),
          //   ),
          //   // ListView.separated(
          //   //   scrollDirection: Axis.horizontal,
          //   //   itemBuilder: (context, index) => Padding(
          //   //     padding: EdgeInsets.only(
          //   //       left: index == 0 ? 16 : 0,
          //   //       right: index == -1 ? 16 : 0,
          //   //     ),
          //   //     child: Container(
          //   //       width: context.mediaQuery.size.width / 4,
          //   //       decoration: const BoxDecoration(
          //   //         color: AppColors.primitiveNeutral0,
          //   //         borderRadius: BorderRadius.all(Radius.circular(8)),
          //   //       ),
          //   //     ),
          //   //   ),
          //   //   separatorBuilder: (context, index) => const RowSpacer(0.8),
          //   //   itemCount: 10,
          //   // ),
          // ),
          const ColumnSpacer(1.6),
          Padding(
            padding: AppPaddings.horizontal16,
            child: ListView.separated(
                padding: AppPaddings.empty,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: AppComponents.productcardBgColorDefault),
                    height: 260,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const ColumnSpacer(1.6),
                itemCount: 2),
          ),
          // AlignedGridView.count(
          //   padding: AppPaddings.horizontal16,
          //   crossAxisCount: 2,
          //   mainAxisSpacing: 12,
          //   crossAxisSpacing: 8,
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: 4,
          //   itemBuilder: (context, index) => Container(
          //     height: context.mediaQuery.size.width / 1.8,
          //     decoration: const BoxDecoration(
          //         color: AppColors.primitiveNeutral0,
          //         borderRadius: BorderRadius.all(Radius.circular(12))),
          //   ),
          // ),
          const ColumnSpacer(1.6),
        ],
      ),
    );
  }
}
