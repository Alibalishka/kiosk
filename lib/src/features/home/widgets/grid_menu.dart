import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/basket_btn.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridMenuWidget extends StatelessWidget {
  final List<Items> items;
  final QrMenuVm viewModel;

  const GridMenuWidget({
    super.key,
    required this.items,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    // Размеры карточки берём из QrMenuLayout, а не считаем на месте: по этим
    // же числам ScrollService считает офсеты перехода по категориям.
    final layout = QrMenuLayout.of(
      context,
      hasRecommend: viewModel.menuData?.effectiveRecommend.isNotEmpty ?? false,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        QrMenuLayout.contentPadding,
        0,
        QrMenuLayout.contentPadding,
        0,
      ),
      child: StaggeredGrid.count(
        crossAxisCount: layout.gridColumns,
        mainAxisSpacing: 0,
        crossAxisSpacing: QrMenuLayout.gridSpacing,
        children: items
            .map(
              (item) => StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: SizedBox(
                  height: layout.gridTileHeight,
                  child: ItemRecomended(
                    item: item,
                    imageHeight: layout.gridImageHeight,
                    bottom: viewModel.hasAvailablePayments
                        ? BasketBtn(
                            viewModel: viewModel,
                            item: item,
                          )
                        : null,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// class GridMenuWidget extends StatelessWidget {
//   final List<Items> items;
//   final QrMenuVm viewModel;

//   const GridMenuWidget({
//     super.key,
//     required this.items,
//     required this.viewModel,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: AppPaddings.horizontal16,
//       child: MediaQuery.removePadding(
//         context: context,
//         removeTop: true,
//         child: AlignedGridView.count(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           crossAxisCount: viewModel.isTablet ? 3 : 2,
//           mainAxisSpacing: 0,
//           crossAxisSpacing: 12,
//           itemCount: items.length,
//           itemBuilder: (context, index) => SizedBox(
//             height: viewModel.isTablet
//                 ? viewModel.scrollService.getHeightWidget(context)
//                 : 385,
//             child: ItemRecomended(
//               item: items[index],
//               bottom: BasketBtn(
//                 viewModel: viewModel,
//                 item: items[index],
//               ),
//             ),
//           ),
//         ),
//       ),
//       //  StaggeredGrid.count(
//       //   crossAxisCount: viewModel.isTablet ? 3 : 2,
//       //   mainAxisSpacing: 0,
//       //   crossAxisSpacing: 12,
//       //   children: items
//       //       .map(
//       //         (item) => StaggeredGridTile.fit(
//       //           crossAxisCellCount: 1,
//       //           child: SizedBox(
//       //             height: viewModel.isTablet
//       //                 ? viewModel.scrollService.getHeightWidget(context)
//       //                 : 385,
//       //             child: ItemRecomended(
//       //               item: item,
//       //               bottom: BasketBtn(
//       //                 viewModel: viewModel,
//       //                 item: item,
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //       )
//       //       .toList(),
//       // ),
//     );
//   }
// }
