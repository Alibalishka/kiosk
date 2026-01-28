import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({
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
          SizedBox(
            height: 150,
            child: ListView.separated(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const RowSpacer(0.95),
              itemBuilder: (context, index) => GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 0, right: index == 4 - 1 ? 8 : 0),
                  child: Container(
                    width: context.mediaQuery.size.width / 1.12,
                    decoration: const BoxDecoration(
                      color: AppColors.primitiveBlue100,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                  ),
                ),
              ),
            ),
          )
          // SizedBox(
          //   height: context.mediaQuery.size.width / 3,
          //   // height: 144,
          //   child: ListView.separated(
          //     itemCount: 4,
          //     scrollDirection: Axis.horizontal,
          //     separatorBuilder: (context, index) => const RowSpacer(0.95),
          //     itemBuilder: (context, index) => GestureDetector(
          //       child: Padding(
          //         padding: EdgeInsets.only(
          //             left: index == 0 ? 8 : 0, right: index == 4 - 1 ? 8 : 0),
          //         child: Container(
          //           width: 104,
          //           decoration: const BoxDecoration(
          //             color: AppColors.primitiveBlue100,
          //             borderRadius: BorderRadius.all(Radius.circular(24)),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
