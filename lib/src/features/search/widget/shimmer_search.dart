import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearch extends StatelessWidget {
  const ShimmerSearch({
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
          const ColumnSpacer(2.4),
          Padding(
            padding: AppPaddings.horizontal16,
            child: AlignedGridView.count(
              // padding: AppPaddings.horizontal16,
              crossAxisCount: 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.primitiveNeutral0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
