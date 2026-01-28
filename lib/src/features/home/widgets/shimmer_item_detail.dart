import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemDetail extends StatelessWidget {
  const ShimmerItemDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppComponents.shimmerBase,
      highlightColor: AppComponents.shimmerHighlight,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 450,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: AppColors.primitiveNeutral0,
              ),
            ),
            const ColumnSpacer(1.6),
            Container(
              margin: AppPaddings.horizontal16,
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: AppColors.primitiveNeutral0,
              ),
            ),
            const ColumnSpacer(1.6),
            Padding(
              padding: AppPaddings.horizontal16,
              child: Container(
                height: 44,
                //width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.primitiveNeutral0,
                ),
              ),
            ),
            const ColumnSpacer(1.2),
            SizedBox(
              height: 150,
              child: ListView.separated(
                padding: AppPaddings.horizontal16,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: context.mediaQuery.size.width * 0.9,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: AppColors.primitiveNeutral0,
                  ),
                ),
                separatorBuilder: (context, index) => const RowSpacer(0.8),
                itemCount: 10,
              ),
            ),
            const ColumnSpacer(1.6),
          ],
        ),
      ),
    );
  }
}
