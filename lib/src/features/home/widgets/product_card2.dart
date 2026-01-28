import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:qr_pay_app/src/features/home/widgets/free_item_sheet.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({
    super.key,
    required this.items,
    required this.viewModel,
  });
  final Item? items;
  final BonusVm viewModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: GestureDetector(
        onTap: () => viewModel.selectCoffe(items?.id ?? 0).then(
              (_) => showCustomSheet(
                context,
                child: FreeItemSheet(items: items),
              ),
            ),
        child: Container(
          height: 280,
          decoration: const BoxDecoration(
            color: AppColors.semanticBgSurface1,
            borderRadius: BorderRadius.all(
                Radius.circular(AppComponents.productcardBorderradius)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                height: context.mediaQuery.size.width / 2.7,
                progressIndicatorBuilder: (context, url, progress) =>
                    Shimmer.fromColors(
                  baseColor: AppComponents.shimmerBase,
                  highlightColor: AppComponents.shimmerHighlight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.primitiveNeutral0,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                imageUrl: items?.images?[0].path ?? '',
                imageBuilder: (context, placeholder) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: placeholder,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const ColumnSpacer(0.8),
              Expanded(
                child: Container(
                  color: AppColors.none,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          items?.name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyL
                              .copyWith(color: AppColors.semanticFgDefault),
                        ),
                        const Spacer(),
                        CustomButton(
                          text: LocaleKeys.choose.tr(),
                          onPressed: () =>
                              viewModel.selectCoffe(items?.id ?? 0).then(
                                    (_) => showCustomSheet(
                                      context,
                                      child: FreeItemSheet(items: items),
                                    ),
                                  ),
                        ),
                        const ColumnSpacer(0.8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
