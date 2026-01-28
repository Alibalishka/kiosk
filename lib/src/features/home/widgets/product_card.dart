import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/constants/app_url.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    this.item,
  });
  final Item? item;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  void initState() {
    super.initState();
    preloadImages();
  }

  void preloadImages() {
    for (var data in widget.item!.images!) {
      data.path != null
          ? CachedNetworkImageProvider(data.path!)
              .resolve(const ImageConfiguration())
          : null;

      data.filePreview != null
          ? CachedNetworkImageProvider(data.filePreview!)
              .resolve(const ImageConfiguration())
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: GestureDetector(
          onTap: () => context.router.push(DetailProviderRoute(
            id: widget.item?.id ?? 0,
            images: widget.item?.images ?? [],
          )),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: AppComponents.productcardBgColorDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      height: context.mediaQuery.size.width / 1.7,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Shimmer.fromColors(
                        baseColor: AppComponents.shimmerBase,
                        highlightColor: AppComponents.shimmerHighlight,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primitiveNeutral0,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                          ),
                        ),
                      ),
                      imageUrl: widget.item?.images?.first.path ??
                          AppUrls.notFoundUrl,
                      imageBuilder: (context, placeholder) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: placeholder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const ColumnSpacer(0.4),
                    Padding(
                      padding: AppPaddings.vertical16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.item?.name ?? '',
                                  style: AppTextStyles.headingH3.copyWith(
                                      color: AppColors.semanticFgDefault),
                                ),
                              ),
                              // SvgPicture.asset(AppSvgImages.star),
                              // const RowSpacer(0.4),
                              // Text(
                              //   '5.0',
                              //   style: AppTextStyles.bodyL.copyWith(
                              //       color: AppComponents
                              //           .taggroupTagFilledInactiveTextColorDefault),
                              // )
                            ],
                          ),
                          const ColumnSpacer(0.4),
                          Text(
                            widget.item?.address ?? '',
                            style: AppTextStyles.bodyM.copyWith(
                                color: AppComponents
                                    .productcardInfocardProductinfoProductsubtitleColorDefault),
                          ),
                          const ColumnSpacer(1.2),
                          Row(
                            children: [
                              Flexible(
                                flex: 3,
                                fit: FlexFit.loose,
                                child: Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: widget.item?.tags?.map((data) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                    '0xff${data.color?.replaceAll('#', '')}')),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            padding: AppPaddings.tag,
                                            child: Text(data.name ?? 'null',
                                                style: AppTextStyles.bodyMStrong
                                                    .copyWith(
                                                        color: AppComponents
                                                            .taggroupTagFilledActiveTextColorDefault)),
                                          );
                                        }).toList() ??
                                        []),
                              ),
                              // const Expanded(child: SizedBox())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
