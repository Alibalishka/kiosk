import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:shimmer/shimmer.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.viewModel,
    this.item,
  });
  final Item? item;
  final BonusVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppComponents.productcardBgColorDefault),
      child: GestureDetector(
        onTap: () {},
        // context.router.push(DrinksPageRoute(idItem: item!.id!.toString())),
        child: Padding(
          padding: AppPaddings.all,
          child: Row(
            children: [
              CachedNetworkImage(
                height: 60,
                width: 80,
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
                imageUrl: item?.images?.first.path ?? '',
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
              const RowSpacer(1.2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item?.name ?? '',
                      style: AppTextStyles.bodyLStrong
                          .copyWith(color: AppComponents.tileTitleColorDefault),
                    ),
                    const ColumnSpacer(0.4),
                    Text(
                      item?.address ?? '',
                      style: AppTextStyles.bodyM
                          .copyWith(color: AppComponents.tileTitleColorDefault),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(AppSvgImages.chevronForward),
            ],
          ),
        ),
      ),
    );
  }
}
