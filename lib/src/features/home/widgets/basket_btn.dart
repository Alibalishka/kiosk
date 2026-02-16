import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketBtn extends StatelessWidget {
  const BasketBtn({
    super.key,
    required this.viewModel,
    required this.item,
  });

  final QrMenuVm viewModel;
  final Items item;

  bool get _hasNoModifiers => item.modifiers?.isEmpty ?? true;

  void _openProductSheet(BuildContext context) {
    showCustomSheet(
      context,
      child: ProductPage(item: item),
    );
  }

  void _onAddTap(BuildContext context) {
    if (_hasNoModifiers) {
      viewModel.addToBasket(context, item, 1);
    } else {
      _openProductSheet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final int id = item.id ?? 0;
    final int count = viewModel.basketService.getCount(id);

    final double width = viewModel.isTablet ? 160 : 115;
    final double height = viewModel.isTablet ? 4.sh : 40;

    return RepaintBoundary(
      child: SizedBox(
        width: width,
        height: height,
        child: count == 0
            ? _AddButton(
                onTap: () => _onAddTap(context),
              )
            : _StepperButton(
                count: viewModel.getItemCount(id),
                isTablet: viewModel.isTablet,
                onMinus: () => viewModel.removeFromBasket(item),
                onPlus: () => _onAddTap(context),
              ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppComponents.buttongroupButtonGrayBgColorDefault,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppSvgImages.plus,
            // если у тебя flutter_svg новая версия — лучше так:
            // colorFilter: const ColorFilter.mode(
            //   AppComponents.buttongroupButtonWhiteIconColorDefault,
            //   BlendMode.srcIn,
            // ),
            color: AppComponents.buttongroupButtonWhiteIconColorDefault,
            height: 14.sp,
          ),
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.count,
    required this.isTablet,
    required this.onMinus,
    required this.onPlus,
  });

  final int count;
  final bool isTablet;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppComponents.buttongroupButtonGrayBgColorDefault,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onMinus,
              child: Center(
                child: SvgPicture.asset(
                  AppSvgImages.minus,
                  height: isTablet ? 24 : null,
                  color: AppComponents.buttongroupButtonWhiteIconColorDefault,
                  // либо colorFilter как выше
                ),
              ),
            ),
          ),
          Text(
            count.toString(),
            style: AppTextStyles.bodyLStrong.copyWith(
              fontSize: isTablet ? 14.sp : null,
              color: AppComponents.buttongroupButtonGrayIconColorDefault,
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onPlus,
              child: Center(
                child: SvgPicture.asset(
                  AppSvgImages.plus,
                  height: isTablet ? 18 : null,
                  color: AppComponents.buttongroupButtonWhiteIconColorDefault,
                  // либо colorFilter как выше
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BasketBtn extends StatelessWidget {
//   const BasketBtn({
//     super.key,
//     required this.viewModel,
//     required this.item,
//   });
//   final QrMenuVm viewModel;
//   final Items item;

//   @override
//   Widget build(BuildContext context) {
//     return viewModel.basketService.getCount(item.id ?? 0) == 0
//         ? GestureDetector(
//             onTap: () => item.modifiers?.isEmpty ?? true
//                 ? viewModel.addToBasket(
//                     context,
//                     item,
//                     1,
//                   )
//                 : showCustomSheet(
//                     context,
//                     child: ProductPage(item: item),
//                   ),
//             child: Container(
//               width: viewModel.isTablet ? 160 : 115,
//               height: viewModel.isTablet ? 4.sh : 40,
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               // padding: AppPaddings.sym16x12,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: AppComponents.buttongroupButtonGrayBgColorDefault,
//               ),
//               child: SvgPicture.asset(
//                 AppSvgImages.plus,
//                 color: AppComponents.buttongroupButtonWhiteIconColorDefault,
//               ),
//             ),
//           )
//         : Container(
//             width: viewModel.isTablet ? 160 : 115,
//             height: viewModel.isTablet ? 4.sh : 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: AppComponents.buttongroupButtonGrayBgColorDefault,
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => viewModel.removeFromBasket(item),
//                     child: Container(
//                       color: AppColors.none,
//                       child: SvgPicture.asset(
//                         AppSvgImages.minus,
//                         height: viewModel.isTablet ? 24 : null,
//                         color: AppComponents
//                             .buttongroupButtonWhiteIconColorDefault,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Text(
//                   viewModel.getItemCount(item.id ?? 0).toString(),
//                   style: AppTextStyles.bodyLStrong.copyWith(
//                     fontSize: viewModel.isTablet ? 14.sp : null,
//                     color: AppComponents.buttongroupButtonGrayIconColorDefault,
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () => item.modifiers?.isEmpty ?? true
//                         ? viewModel.addToBasket(
//                             context,
//                             item,
//                             1,
//                           )
//                         : showCustomSheet(
//                             context,
//                             child: ProductPage(item: item),
//                           ),
//                     child: Container(
//                       color: AppColors.none,
//                       child: SvgPicture.asset(
//                         AppSvgImages.plus,
//                         height: viewModel.isTablet ? 18 : null,
//                         color: AppComponents
//                             .buttongroupButtonWhiteIconColorDefault,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
