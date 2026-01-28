import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:shimmer/shimmer.dart';

class SomethingElseWidget extends StatelessWidget {
  const SomethingElseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ColumnSpacer(2.4),
        Row(
          children: [
            Padding(
              padding: AppPaddings.horizontal16,
              child: Text(
                LocaleKeys.anythingElse.tr(),
                style: AppTextStyles.headingH3.copyWith(
                    color: AppComponents.blockBlocktitleHeadingColorDefault),
              ),
            ),
          ],
        ),
        const ColumnSpacer(1.6),
        SizedBox(
          height: 255,
          child: ListView.separated(
              padding: AppPaddings.horizontal16,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(36, 28, 28, 1),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                            // color: Color.fromRGBO(48, 36, 36, 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              height: MediaQuery.of(context).size.height / 6.6,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      Shimmer.fromColors(
                                baseColor: AppComponents.shimmerBase,
                                highlightColor: AppComponents.shimmerHighlight,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.primitiveNeutral0,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                  ),
                                ),
                              ),
                              imageUrl:
                                  'https://minio.naprocat.com/tenant-sandyq/catering_menu/PhotoHolder.png',
                              imageBuilder: (context, placeholder) => Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(48, 36, 36, 1),
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  image: DecorationImage(
                                    image: placeholder,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                color: const Color.fromRGBO(36, 28, 28, 1),
                                child: Column(
                                  children: [
                                    const ColumnSpacer(0.8),
                                    Padding(
                                      padding: AppPaddings.cardText,
                                      child: Text(
                                        'Куриный суп с вермишелью большая порция «Из Лавки» 500 г',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: AppTextStyles.bodyL.copyWith(
                                            color: AppComponents
                                                .buttongroupButtonPrimaryTextColorDefault),
                                      ),
                                    ),
                                    const ColumnSpacer(1.2),
                                    Padding(
                                      padding: AppPaddings.cardText,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: AppPaddings.symmetric8x16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.semanticBgSurface3,

                                            // boxShadow: const [
                                            //   BoxShadow(
                                            //     color: Color.fromRGBO(
                                            //         0, 0, 0, 0.1),
                                            //     spreadRadius: 0,
                                            //     blurRadius: 8,
                                            //     offset: Offset(0, 1),
                                            //   ),
                                            // ],
                                          ),
                                          // padding: AppPaddings.vertical12,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(width: 24),
                                              Text(
                                                '4 900 ₸ ',
                                                style: AppTextStyles.bodyMStrong
                                                    .copyWith(
                                                        color: AppComponents
                                                            .buttongroupButtonGrayTextColorDefault),
                                              ),
                                              SvgPicture.asset(
                                                  AppSvgImages.plus,
                                                  color: AppComponents
                                                      .buttongroupButtonGrayTextColorDefault)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const ColumnSpacer(0.8),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const RowSpacer(0.8),
              itemCount: 10),
        ),
      ],
    );
  }
}
