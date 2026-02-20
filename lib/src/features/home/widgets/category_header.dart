import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/item_catalog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final String? title;
  final List<Items>? recommend;
  final List<Items>? items;
  final QrMenuVm viewModel;

  const CategoryHeaderWidget({
    super.key,
    required this.title,
    required this.recommend,
    required this.viewModel,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal16,
      child: recommend == null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GestureDetector(
                onTap: () {
                  // context.router.replace(KioskSuccessPageRoute(id: 1234));
                  // context.router.replace(
                  //     KioskKaspiProviderRoute(request: MenuCheckoutRequest()));
                },
                child: Text(
                  title ?? '',
                  style: AppTextStyles.headingH3.copyWith(
                    // fontSize: viewModel.isTablet ? 16.sp : null,
                    fontSize: 16.sp,
                    color: AppColors.semanticFgDefault,
                  ),
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    title ?? '',
                    style: AppTextStyles.headingH3.copyWith(
                      color: AppColors.semanticFgDefault,
                      //  fontSize: viewModel.isTablet ? 16.sp : null,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                ItemCatalog(
                  item: recommend,
                  items: items,
                  viewModel: viewModel,
                ),
              ],
            ),
    );
  }
}

// class CategoryHeaderWidget extends StatelessWidget {
//   final String? title;
//   final List<Items>? recommend;
//   final List<Items>? items;
//   final QrMenuVm viewModel;

//   const CategoryHeaderWidget({
//     super.key,
//     required this.title,
//     required this.recommend,
//     required this.viewModel,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: AppPaddings.horizontal16,
//       child: recommend == null
//           ? Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               child: Text(
//                 title ?? '',
//                 style: AppTextStyles.headingH3.copyWith(
//                   fontSize: viewModel.isTablet ? 32.sp : null,
//                   color: AppColors.semanticFgDefault,
//                 ),
//               ),
//             )
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Text(
//                     title ?? '',
//                     style: AppTextStyles.headingH3.copyWith(
//                       color: AppColors.semanticFgDefault,
//                       fontSize: viewModel.isTablet ? 32.sp : null,
//                     ),
//                   ),
//                 ),
//                 ItemCatalog(
//                   item: recommend,
//                   items: items,
//                   viewModel: viewModel,
//                 ),
//               ],
//             ),
//     );
//   }
// }
