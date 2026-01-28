import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScrollItems extends StatelessWidget {
  const ShimmerScrollItems({
    super.key,
    this.height = 150,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const ColumnSpacer(1.2),
        itemBuilder: (context, index) => Padding(
          padding: AppPaddings.horizontal16,
          child: Shimmer.fromColors(
            baseColor: AppComponents.shimmerBase,
            highlightColor: AppComponents.shimmerHighlight,
            child: Container(
              height: height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: AppColors.primitiveNeutral0,
              ),
            ),
          ),
        ),
      ),
    );
    // Shimmer.fromColors(
    //   baseColor: AppComponents.shimmerBase,
    //   highlightColor: AppComponents.shimmerHighlight,
    //   child: ListView.separated(
    //     padding: AppPaddings.horizontal16,
    //     physics: const NeverScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) =>
    // Container(
    //       height: height,
    //       decoration: const BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(6)),
    //         color: AppColors.primitiveNeutral0,
    //       ),
    //     ),
    //     separatorBuilder: (context, index) => const ColumnSpacer(1.2),
    //     itemCount: 10,
    //   ),
    // );
  }
}
