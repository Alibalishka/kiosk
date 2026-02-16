import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/basket_btn.dart';
import 'package:sizer/sizer.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    super.key,
    required this.item,
    required this.viewModel,
  });

  final Items item;
  final QrMenuVm viewModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all,
      child: SizedBox(
        height: viewModel.isTablet ? 15.sh : 136,
        child: Row(
          children: [
            if (item.image?.isNotEmpty ?? false)
              GestureDetector(
                  onTap: () => showCustomSheet(
                        context,
                        child: ProductPage(
                          item: item,
                          // isSubscription: viewModel.isSubscription,
                          // isMenuPage: true,
                        ),
                      ),
                  child: item.image?.isNotEmpty ?? false
                      ? Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SafeNetworkImage(
                            width: viewModel.isTablet ? 175 : 131,
                            height: viewModel.isTablet ? 180 : 136,
                            imageUrl: item.image?.isNotEmpty ?? false
                                ? item.image?.first.path ?? ''
                                : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
                            placeholder: Container(
                              height: viewModel.isTablet ? 180 : 136,
                              width: viewModel.isTablet ? 175 : 131,
                              decoration: BoxDecoration(
                                color: AppColors.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            imageBuilder: (context, placeholder) => Container(
                              width: viewModel.isTablet ? 175 : 131,
                              height: viewModel.isTablet ? 180 : 136,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: placeholder,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                  // ClipRRect(
                  //     borderRadius: BorderRadius.circular(16),
                  //     child: Image.asset(AppWebpImages.placeholderMenu)),
                  ),
            // const RowSpacer(2),
            Flexible(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductPage(item: item)),
                ),
                //  showCustomSheet(
                //   context,
                //   child: ProductPage(
                //     item: item,
                //     // isSubscription: viewModel.isSubscription,
                //     // isMenuPage: true,
                //   ),
                // ),
                child: Container(
                  color: AppColors.none,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyLStrong.copyWith(
                                fontSize: viewModel.isTablet ? 15.sp : null,
                                color: AppColors.semanticFgDefault),
                          ),
                          Text(
                            item.description ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyS.copyWith(
                                fontSize: viewModel.isTablet ? 14.sp : null,
                                color: AppColors.semanticFgSofter),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${priceFormat(item.price.toString())} ₸',
                                style: AppTextStyles.bodyXlStrong.copyWith(
                                    fontSize: viewModel.isTablet ? 16.sp : null,
                                    color: AppColors.semanticFgDefault),
                              ),
                              BasketBtn(
                                viewModel: viewModel,
                                item: item,
                                // isSubscription: viewModel.isSubscription,
                                // isMenuPage: true,
                              ),
                              // BasketBtn(
                              //   viewModel: viewModel,
                              //   item: item,
                              //   // isSubscription: viewModel.isSubscription,
                              //   // isMenuPage: true,
                              // ),
                              // viewModel.getCount(item.id ?? 0) == 0
                              //     ? GestureDetector(
                              //         onTap: () => viewModel.adddBasket(
                              //           data: item,
                              //           count: 1,
                              //         ),
                              //         child: Container(
                              //           width: 100,
                              //           height: 42,
                              //           padding: AppPaddings.sym16x12,
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(8),
                              //             color: AppColors.semanticBgSurface3,
                              //           ),
                              //           child: SvgPicture.asset(
                              //             AppSvgImages.plus,
                              //             color: AppComponents
                              //                 .buttongroupButtonPrimaryIconColorDefault,
                              //           ),
                              //         ),
                              //       )
                              //     : Container(
                              //         width: 107,
                              //         height: 42,
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(8),
                              //           color: AppColors.semanticBgSurface3,
                              //         ),
                              //         child: Row(
                              //           children: [
                              //             GestureDetector(
                              //               onTap: () => viewModel
                              //                   .removeFromBasket(item.id ?? 0),
                              //               child: Container(
                              //                 color: AppColors.none,
                              //                 child: Padding(
                              //                   padding: AppPaddings.sym16x12,
                              //                   child: SvgPicture.asset(
                              //                     AppSvgImages.minus,
                              //                     color: AppComponents
                              //                         .buttongroupButtonGrayIconColorDefault,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //             Text(
                              //               viewModel
                              //                   .getCount(item.id ?? 0)
                              //                   .toString(),
                              //               style:
                              //                   AppTextStyles.bodyLStrong.copyWith(
                              //                 color: AppComponents
                              //                     .buttongroupButtonGrayIconColorDefault,
                              //               ),
                              //             ),
                              //             GestureDetector(
                              //               onTap: () => viewModel.adddBasket(
                              //                 data: item,
                              //                 count: 1,
                              //               ),
                              //               child: Container(
                              //                 color: AppColors.none,
                              //                 child: Padding(
                              //                   padding: AppPaddings.sym16x12,
                              //                   child: SvgPicture.asset(
                              //                     AppSvgImages.plus,
                              //                     color: AppComponents
                              //                         .buttongroupButtonGrayIconColorDefault,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                            ],
                          ),
                        ],
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         '${priceFormat(item.price.toString())} ₸',
                      //         style: AppTextStyles.bodyXlStrong.copyWith(
                      //             fontSize: viewModel.isTablet ? 24.sp : null,
                      //             color: AppColors.semanticFgDefault),
                      //       ),
                      //       BasketBtn(
                      //         viewModel: viewModel,
                      //         item: item,
                      //         // isSubscription: viewModel.isSubscription,
                      //         // isMenuPage: true,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ItemMenu extends StatelessWidget {
//   const ItemMenu({
//     super.key,
//     required this.item,
//     required this.viewModel,
//   });

//   final Items item;
//   final QrMenuVm viewModel;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: SizedBox(
//         height: viewModel.isTablet ? context.mediaQuery.size.width / 3.3 : 138,
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () => showCustomSheet(
//                 context,
//                 child: ProductPage(item: item),
//               ),
//               child: item.image?.isNotEmpty ?? false
//                   ? CachedNetworkImage(
//                       width: viewModel.isTablet
//                           ? context.mediaQuery.size.width / 3
//                           : 138,
//                       height: viewModel.isTablet
//                           ? context.mediaQuery.size.width / 3
//                           : 138,
//                       progressIndicatorBuilder: (context, url, progress) =>
//                           Shimmer.fromColors(
//                         baseColor: AppComponents.shimmerHighlight,
//                         highlightColor: AppComponents.shimmerHighlight,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: AppColors.primitiveNeutral0,
//                             borderRadius: BorderRadius.circular(24),
//                           ),
//                         ),
//                       ),
//                       imageUrl: item.image?.isNotEmpty ?? false
//                           ? item.image?.first.path ?? ''
//                           : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
//                       imageBuilder: (context, placeholder) => Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(24),
//                           image: DecorationImage(
//                             image: placeholder,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     )
//                   : ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Image.asset(AppWebpImages.placeholderMenu)),
//             ),
//             const RowSpacer(2),
//             Flexible(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () => showCustomSheet(
//                       context,
//                       child: ProductPage(item: item),
//                     ),
//                     child: Container(
//                       color: AppColors.none,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Text(
//                             item.name ?? '',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppTextStyles.headingH4.copyWith(
//                               fontSize: viewModel.isTablet ? 24.sp : null,
//                               color: AppColors.semanticFgDefault,
//                             ),
//                           ),
//                           Text(
//                             item.description ?? '',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppTextStyles.bodyM.copyWith(
//                               fontSize: viewModel.isTablet ? 16.sp : null,
//                               color: AppComponents
//                                   .productcardorderContentTextcontentProductsubtitleColorDefault,
//                             ),
//                           ),
//                           const ColumnSpacer(1.2),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '${priceFormat(item.price.toString())} ₸',
//                         style: AppTextStyles.headingH3.copyWith(
//                           fontSize: viewModel.isTablet ? 24.sp : null,
//                           color: AppComponents
//                               .productcardorderContentTextcontentPricewrapperPriceColorDefault,
//                         ),
//                       ),
//                       BasketBtn(viewModel: viewModel, item: item),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
