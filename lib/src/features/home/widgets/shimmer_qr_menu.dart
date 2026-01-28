import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerQrMenu extends StatelessWidget {
  const ShimmerQrMenu({
    super.key,
    this.height = 150,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Shimmer.fromColors(
              baseColor: AppComponents.shimmerBase,
              highlightColor: AppComponents.shimmerHighlight,
              child: Container(
                height: context.mediaQuery.size.width / 1.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.primitiveNeutral0,
                ),
              ),
            ),
            const ColumnSpacer(1.2),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: AppPaddings.horizontal16,
                itemCount: 12,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const RowSpacer(1),
                itemBuilder: (context, index) => Shimmer.fromColors(
                  baseColor: AppComponents.shimmerBase,
                  highlightColor: AppComponents.shimmerHighlight,
                  child: Container(
                    height: 40,
                    width: 85,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: AppColors.primitiveNeutral0,
                    ),
                  ),
                ),
              ),
            ),
            const ColumnSpacer(1),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: AppComponents.shimmerBase,
                  highlightColor: AppComponents.shimmerHighlight,
                  child: Padding(
                    padding: AppPaddings.horizontal16,
                    child: Container(
                      height: 34,
                      width: 120,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: AppColors.primitiveNeutral0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const ColumnSpacer(1),
            ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const ColumnSpacer(1.2),
              itemBuilder: (context, index) => Padding(
                padding: AppPaddings.horizontal16,
                child: Shimmer.fromColors(
                  baseColor: AppComponents.shimmerBase,
                  highlightColor: AppComponents.shimmerHighlight,
                  child: SizedBox(
                    child: Row(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            color: AppColors.primitiveNeutral0,
                          ),
                        ),
                        const RowSpacer(1.2),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 48,
                                width: 240,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: AppColors.primitiveNeutral0,
                                ),
                              ),
                              const ColumnSpacer(0.4),
                              Container(
                                height: 30,
                                width: 240,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: AppColors.primitiveNeutral0,
                                ),
                              ),
                              const ColumnSpacer(1.2),
                              Container(
                                height: 40,
                                width: 107,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: AppColors.primitiveNeutral0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
