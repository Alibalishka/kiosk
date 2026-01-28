import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/checkout_model.dart';

class BlockTitleWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool isSubtitle;
  final String? subtitle;
  final bool divider;
  final bool title2;
  final Color? textColor;

  const BlockTitleWidget({
    super.key,
    required this.title,
    required this.text,
    this.isSubtitle = false,
    this.divider = true,
    this.title2 = false,
    this.subtitle,
    this.textColor = AppComponents.listitemSubtitleColorDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.sym16x12,
          child: Row(
            children: [
              // SvgPicture.asset(AppSvgImages.storefront),
              // const RowSpacer(1.2),
              Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: title2
                            ? AppTextStyles.bodyM.copyWith(
                                color: AppComponents
                                    .blockBlocktitleTitleColorDefault)
                            : AppTextStyles.headingH4.copyWith(
                                color: AppComponents
                                    .blockBlocktitleTitleColorDefault),
                      ),
                      isSubtitle ? const ColumnSpacer(0.4) : const SizedBox(),
                      isSubtitle
                          ? Text(
                              subtitle ?? '',
                              style: AppTextStyles.bodyM.copyWith(
                                  color: AppComponents
                                      .blockBlocktitleTitleColorDefault),
                            )
                          : const SizedBox(),
                      const ColumnSpacer(0.4),
                      Text(
                        text,
                        style: AppTextStyles.bodyM.copyWith(color: textColor),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        divider ? const CustomDivider() : const SizedBox()
      ],
    );
  }
}

class BlockTitleWidget2 extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String price;
  final List<Dish>? modifires;
  const BlockTitleWidget2({
    super.key,
    required this.title,
    required this.price,
    this.subtitle,
    this.modifires,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.vertical12,
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.horizontal16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.headingH4.copyWith(
                              color: AppComponents
                                  .blockBlocktitleTitleColorDefault),
                        ),
                        subtitle == null
                            ? const SizedBox.shrink()
                            : const ColumnSpacer(0.4),
                        subtitle == null
                            ? const SizedBox.shrink()
                            : Text(
                                subtitle ?? '',
                                style: AppTextStyles.bodyM.copyWith(
                                    color: AppColors.primitiveNeutralwarm300),
                              ),
                      ]),
                ),
                const RowSpacer(3),
                Text(
                  price,
                  style: AppTextStyles.bodyM.copyWith(
                      color: AppComponents.listitemPricetextColorDefault),
                )
              ],
            ),
          ),
          modifires?.isNotEmpty ?? false
              ? const ColumnSpacer(1)
              : const SizedBox.shrink(),
          ListView.separated(
            padding: const EdgeInsets.only(left: 32, right: 16),
            itemCount: modifires?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              children: [
                Expanded(
                  child: Text(
                    modifires?[index].name ?? 'null',
                    style: AppTextStyles.bodyL.copyWith(
                        color: AppComponents.blockBlocktitleTitleColorDefault),
                  ),
                ),
                Text(
                  '${priceFormat(modifires?[index].totalPrice.toString() ?? '0')}  ₸',
                  style: AppTextStyles.bodyL.copyWith(
                      color: AppComponents.listitemPricetextColorDefault),
                )
              ],
            ),
            separatorBuilder: (context, index) => const ColumnSpacer(1),
          ),
        ],
      ),
    );
  }
}
