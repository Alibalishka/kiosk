import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingHorizontal extends StatelessWidget {
  const ShimmerLoadingHorizontal({
    super.key,
    this.count = 2,
  });
  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppComponents.shimmerBase,
      highlightColor: AppComponents.shimmerHighlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              height: context.mediaQuery.size.width / 8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: AppColors.primitiveNeutral0,
              ),
            ),
            separatorBuilder: (context, index) => const ColumnSpacer(1.6),
            itemCount: count,
          ),
        ],
      ),
    );
  }
}
