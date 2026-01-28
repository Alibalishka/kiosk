import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/safe_network_image.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_page.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:qr_pay_app/src/features/home/widgets/basket_btn.dart';
import 'package:sizer/sizer.dart';

class ItemCatalog extends StatelessWidget {
  const ItemCatalog({
    super.key,
    required this.viewModel,
    required this.item,
    required this.items,
  });

  final QrMenuVm viewModel;
  final List<Items>? item;
  final List<Items>? items;

  @override
  Widget build(BuildContext context) {
    if ((item?.isEmpty ?? true) || item![0] == null) {
      return const SizedBox.shrink();
    }

    final mainItem = item![0];

    return viewModel.isTablet
        ? Row(
            children: [
              Expanded(
                flex: 2,
                child: _ItemCard(
                  viewModel: viewModel,
                  item: mainItem,
                ),
              ),
              const RowSpacer(1.2),
              if (items?.isNotEmpty ?? false)
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 475,
                    child: ItemRecomended(
                      item: items![0],
                      bottom: BasketBtn(
                        viewModel: viewModel,
                        item: items![0],
                      ),
                    ),
                  ),
                ),
            ],
          )
        : _ItemCard(
            viewModel: viewModel,
            item: mainItem,
          );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    required this.viewModel,
    required this.item,
  });

  final QrMenuVm viewModel;
  final Items item;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: () => showCustomSheet(
            context,
            child: ProductPage(item: item),
          ),
          child: Container(
            height: viewModel.isTablet ? 475 : 430,
            width: viewModel.isTablet
                ? context.mediaQuery.size.width / 1.64
                : null,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.semanticBgSurface2,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                item.image?.isNotEmpty == true
                    ? SafeNetworkImage(
                        height: viewModel.isTablet ? 305 : 260,
                        width: viewModel.isTablet ? 305 : 260,
                        imageUrl: item.image!.first.path ??
                            item.image!.first.file ??
                            '',
                        placeholder: const SizedBox.shrink(),
                        imageBuilder: (context, imageProvider) => Container(
                          height: viewModel.isTablet ? 305 : 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AppWebpImages.placeholderMenu,
                          height: viewModel.isTablet ? 305 : 260,
                          width: viewModel.isTablet ? 305 : 260,
                        ),
                      ),
                Text(
                  item.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyLStrong.copyWith(
                    fontSize: viewModel.isTablet ? 24.sp : null,
                    color: AppColors.semanticFgDefault,
                  ),
                ),
                const ColumnSpacer(0.4),
                Text(
                  item.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyM.copyWith(
                    fontSize: viewModel.isTablet ? 16.sp : null,
                    color: AppColors.semanticFgSoft,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${priceFormat(item.price.toString())} ₸',
                      style: AppTextStyles.bodyXlStrong.copyWith(
                        fontSize: viewModel.isTablet ? 24.sp : null,
                        color: AppColors.semanticFgDefault,
                      ),
                    ),
                    const Spacer(),
                    BasketBtn(
                      viewModel: viewModel,
                      item: item,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ItemCatalog extends StatelessWidget {
//   const ItemCatalog({
//     super.key,
//     required this.viewModel,
//     required this.item,
//     required this.items,
//   });

//   final QrMenuVm viewModel;
//   final List<Items>? item;
//   final List<Items>? items;

//   @override
//   Widget build(BuildContext context) {
//     if ((item?.isEmpty ?? true) || item![0] == null) {
//       return const SizedBox.shrink();
//     }

//     final mainItem = item![0];

//     return viewModel.isTablet
//         ? Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: _ItemCard(
//                   viewModel: viewModel,
//                   item: mainItem,
//                 ),
//               ),
//               const RowSpacer(1.2),
//               if (items?.isNotEmpty ?? false)
//                 Expanded(
//                   flex: 1,
//                   child: SizedBox(
//                     height: viewModel.scrollService.getHeightWidget(context),
//                     child: ItemRecomended(
//                       item: items![0],
//                       bottom: BasketBtn(
//                         viewModel: viewModel,
//                         item: items![0],
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           )
//         : _ItemCard(
//             viewModel: viewModel,
//             item: mainItem,
//           );
//   }
// }

// class _ItemCard extends StatelessWidget {
//   const _ItemCard({
//     required this.viewModel,
//     required this.item,
//   });

//   final QrMenuVm viewModel;
//   final Items item;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedCard(
//       child: Material(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(16),
//         child: GestureDetector(
//           onTap: () => showCustomSheet(
//             context,
//             child: ProductPage(item: item),
//           ),
//           child: Container(
//             height: viewModel.isTablet
//                 ? viewModel.scrollService.getHeightWidget(context)
//                 : 430,
//             // width:
//             //     viewModel.isTablet ? context.mediaQuery.size.width / 1.6 : null,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: AppColors.semanticBgSurface3,
//               borderRadius: BorderRadius.circular(32),
//             ),
//             child: Column(
//               children: [
//                 item.image?.isNotEmpty == true
//                     ? CachedNetworkImage(
//                         height: viewModel.isTablet ? 305 : 260,
//                         width: viewModel.isTablet ? 305 : 260,
//                         imageUrl: item.image!.first.path ??
//                             item.image!.first.file ??
//                             '',
//                         imageBuilder: (context, imageProvider) => Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(32),
//                             image: DecorationImage(
//                               image: imageProvider,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       )
//                     : ClipRRect(
//                         borderRadius: BorderRadius.circular(16),
//                         child: Image.asset(
//                           AppWebpImages.placeholderMenu,
//                           height: viewModel.isTablet ? 305 : 260,
//                           width: viewModel.isTablet ? 305 : 260,
//                         ),
//                       ),
//                 Text(
//                   item.name ?? '',
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.bodyLStrong.copyWith(
//                     fontSize: viewModel.isTablet ? 24.sp : null,
//                     color: AppColors.semanticFgDefault,
//                   ),
//                 ),
//                 const ColumnSpacer(0.4),
//                 Text(
//                   item.description ?? '',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.bodyM.copyWith(
//                     fontSize: viewModel.isTablet ? 16.sp : null,
//                     color: AppColors.semanticFgSoft,
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     Text(
//                       '${priceFormat(item.price.toString())} ₸',
//                       style: AppTextStyles.bodyXlStrong.copyWith(
//                         fontSize: viewModel.isTablet ? 24.sp : null,
//                         color: AppColors.semanticFgDefault,
//                       ),
//                     ),
//                     const Spacer(),
//                     BasketBtn(viewModel: viewModel, item: item),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
