import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:sizer/sizer.dart';

class BasketBtn extends StatelessWidget {
  const BasketBtn({
    super.key,
    required this.viewModel,
    required this.item,
  });
  final QrMenuVm viewModel;
  final Items item;

  @override
  Widget build(BuildContext context) {
    return viewModel.basketService.getCount(item.id ?? 0) == 0
        ? GestureDetector(
            onTap: () => item.modifiers?.isEmpty ?? true
                ? viewModel.addToBasket(
                    context,
                    item,
                    1,
                  )
                : showCustomSheet(
                    context,
                    child: ProductPage(item: item),
                  ),
            child: Container(
              width: viewModel.isTablet ? 160 : 115,
              height: viewModel.isTablet ? 4.sh : 40,
              padding: const EdgeInsets.symmetric(vertical: 14),
              // padding: AppPaddings.sym16x12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppComponents.buttongroupButtonGrayBgColorDefault,
              ),
              child: SvgPicture.asset(
                AppSvgImages.plus,
                color: AppComponents.buttongroupButtonWhiteIconColorDefault,
              ),
            ),
          )
        : Container(
            width: viewModel.isTablet ? 160 : 115,
            height: viewModel.isTablet ? 4.sh : 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppComponents.buttongroupButtonGrayBgColorDefault,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => viewModel.removeFromBasket(item),
                    child: Container(
                      color: AppColors.none,
                      child: SvgPicture.asset(
                        AppSvgImages.minus,
                        height: viewModel.isTablet ? 24 : null,
                        color: AppComponents
                            .buttongroupButtonWhiteIconColorDefault,
                      ),
                    ),
                  ),
                ),
                Text(
                  viewModel.getItemCount(item.id ?? 0).toString(),
                  style: AppTextStyles.bodyLStrong.copyWith(
                    fontSize: viewModel.isTablet ? 14.sp : null,
                    color: AppComponents.buttongroupButtonGrayIconColorDefault,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => item.modifiers?.isEmpty ?? true
                        ? viewModel.addToBasket(
                            context,
                            item,
                            1,
                          )
                        : showCustomSheet(
                            context,
                            child: ProductPage(item: item),
                          ),
                    child: Container(
                      color: AppColors.none,
                      child: SvgPicture.asset(
                        AppSvgImages.plus,
                        height: viewModel.isTablet ? 18 : null,
                        color: AppComponents
                            .buttongroupButtonWhiteIconColorDefault,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
