import 'dart:io';

import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/basket_btn.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: StaggeredGrid.count(
        // crossAxisCount: viewModel.isTablet ? 3 : 2,
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 12,
        children: items
            .map(
              (item) => StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: SizedBox(
                  height: (Platform.isIOS
                      ? 50.1.sh
                      : context.screenSize.width > 600
                          ? 44.5.sh
                          : 51.sh),
                  // height: viewModel.isTablet
                  //     ? (Platform.isIOS ? 50.1.sh : 44.5.sh)
                  //     : context.isDesktop
                  //         ? 500 / 1.3
                  //         : context.mediaQuery.size.width / 1.16,
                  child: ItemRecomended(
                    item: item,
                    bottom: BasketBtn(
                      viewModel: viewModel,
                      item: item,
                    ),
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
