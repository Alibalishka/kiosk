import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_checkout.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';

class TakeAwayContent extends StatefulWidget {
  const TakeAwayContent({
    super.key,
  });

  @override
  State<TakeAwayContent> createState() => _TakeAwayContentState();
}

class _TakeAwayContentState extends State<TakeAwayContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QrMenuVm>(
      builder: (context, value, state) {
        value.basketService.basket.isEmpty ? context.router.pop() : null;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                decoration: const BoxDecoration(
                    color: AppComponents.blockBgColorDefault,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24))),
                child: Padding(
                  padding: AppPaddings.horizontal16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SvgPicture.asset(
                          AppSvgImages.storefront,
                          color: AppComponents.listitemIconleftColorDefault,
                        ),
                      ),
                      const RowSpacer(1.2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.selfPickupAt.tr(),
                              style: AppTextStyles.headingH4.copyWith(
                                color:
                                    AppComponents.listitemBodytextColorDefault,
                              ),
                            ),
                            Text(
                              value.menuData?.organization?.address ??
                                  'Адрес не указан',
                              style: AppTextStyles.bodyM.copyWith(
                                color:
                                    AppComponents.listitemBodytextColorDefault,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SeparatorContainer(),
              Container(
                padding: const EdgeInsets.only(top: 8),
                decoration: const BoxDecoration(
                    color: AppComponents.blockBgColorDefault,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: AppPaddings.horizontal16,
                      child: Text(
                        '${value.basketService.basket.length} ${LocaleKeys.dish.tr()} ${priceFormat(value.getTotalPrice().toInt().toString())} ₸',
                        style: AppTextStyles.headingH3.copyWith(
                            color: AppComponents
                                .blockBlocktitleHeadingColorDefault),
                      ),
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: value.basketService.basket.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: AppPaddings.horizontal12,
                          child: const CustomDivider(),
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            ItemCheckout(
                          item: value.basketService.basket[index],
                          removeTap: () => value.removeFromBasket(
                              value.basketService.basket[index]),
                          addTap: () => value.addToBasket(
                            context,
                            value.basketService.basket[index],
                            1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const ColumnSpacer(0.8),
              value.getRecommended().isEmpty
                  ? const SizedBox.shrink()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPaddings.horizontal12,
                          child: Text(
                            LocaleKeys.anythingElse.tr(),
                            style: AppTextStyles.headingH3.copyWith(
                                color: AppComponents
                                    .blockBlocktitleHeadingColorDefault),
                          ),
                        ),
                        const ColumnSpacer(1.6),
                        SizedBox(
                          height: 379,
                          child: Padding(
                            padding: AppPaddings.horizontal12,
                            child: ListView.separated(
                              padding: AppPaddings.empty,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  const RowSpacer(1.2),
                              itemCount: value.getRecommended().length,
                              itemBuilder: (context, index) {
                                return ItemRecomended(
                                  item: value.getRecommended()[index],
                                  bottom: value.getItemCount(value
                                                  .getRecommended()[index]
                                                  .id ??
                                              0) ==
                                          0
                                      ? GestureDetector(
                                          onTap: () => value
                                                      .getRecommended()[index]
                                                      .modifiers
                                                      ?.isEmpty ??
                                                  true
                                              ? value.addToBasket(
                                                  context,
                                                  value.getRecommended()[index],
                                                  1,
                                                )
                                              : showCustomSheet(
                                                  context,
                                                  child: ProductPage(
                                                      item: value
                                                              .getRecommended()[
                                                          index]),
                                                ),
                                          child: Container(
                                              height: 40,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: AppComponents
                                                    .buttongroupButtonGrayBgColorDefault,
                                              ),
                                              child: SvgPicture.asset(
                                                AppSvgImages.plus,
                                                height: 16,
                                                color: AppComponents
                                                    .buttongroupButtonGrayTextColorDefault,
                                              )),
                                        )
                                      : Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.semanticBgSurface3,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () => value
                                                      .removeFromBasket(value
                                                              .getRecommended()[
                                                          index]),
                                                  child: Container(
                                                    height: 40,
                                                    color: AppColors.none,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                    child: SvgPicture.asset(
                                                      AppSvgImages.minus,
                                                      color: AppComponents
                                                          .buttongroupButtonGrayIconColorDefault,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                value
                                                    .getItemCount(value
                                                            .getRecommended()[
                                                                index]
                                                            .id ??
                                                        0)
                                                    .toString(),
                                                style: AppTextStyles.bodyLStrong
                                                    .copyWith(
                                                  color: AppComponents
                                                      .buttongroupButtonGrayIconColorDefault,
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () => value
                                                              .getRecommended()[
                                                                  index]
                                                              .modifiers
                                                              ?.isEmpty ??
                                                          true
                                                      ? value.addToBasket(
                                                          context,
                                                          value.getRecommended()[
                                                              index],
                                                          1,
                                                        )
                                                      : showCustomSheet(
                                                          context,
                                                          child: ProductPage(
                                                              item: value
                                                                      .getRecommended()[
                                                                  index]),
                                                        ),
                                                  child: Container(
                                                    // width: 40,
                                                    height: 40,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 12),
                                                    color: AppColors.none,
                                                    child: SvgPicture.asset(
                                                      AppSvgImages.plus,
                                                      color: AppComponents
                                                          .buttongroupButtonGrayIconColorDefault,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
