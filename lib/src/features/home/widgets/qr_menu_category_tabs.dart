import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/service/scroll_service.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class QrMenuCategoryTabs extends StatelessWidget
    implements PreferredSizeWidget {
  final QrMenuVm viewModel;

  const QrMenuCategoryTabs({super.key, required this.viewModel});

  /// Высота полосы. Источник правды — [ScrollService.tabsHeight]: по ней
  /// считаются офсеты перехода к категории.
  static const double height = ScrollService.tabsHeight;

  /// Пока категории не пришли (или ключи ещё не посчитаны), полоса не
  /// рисуется — и не должна резервировать под себя пустое место.
  bool get _hasTabs {
    final categories = viewModel.menuData?.data ?? [];
    return categories.isNotEmpty &&
        viewModel.scrollService.categoryKeys.length == categories.length;
  }

  @override
  Size get preferredSize => Size.fromHeight(_hasTabs ? height : 0);

  @override
  Widget build(BuildContext context) {
    if (!_hasTabs) return const SizedBox.shrink();
    final categories = viewModel.menuData!.data!;

    return Container(
      height: height,
      // Скругление держит карточка меню (см. _MenuContent) — второй раз
      // его здесь задавать не нужно.
      color: AppColors.semanticBgSurface1,
      // Единственный виджет, который обязан реагировать на вертикальную
      // прокрутку: подсветка активной категории.
      child: ValueListenableBuilder<int>(
        valueListenable: viewModel.scrollService.selectedCategory,
        builder: (context, selectedIndex, _) => ListView.builder(
          controller: viewModel.scrollService.horizontalController,
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          // 12 + margin чипа 4 = те же 16 от краёв, что и у остального
          // контента, причём с обеих сторон.
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () =>
                  viewModel.scrollByCategory(category.name ?? '', index),
              child: Container(
                key: viewModel.scrollService.categoryKeys[index],
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isSelected
                      ? AppComponents.chipgroupChipsSelectedBgColorDefault
                      : AppColors.none,
                ),
                child: Center(
                  child: Text(
                    category.name ?? '',
                    style: AppTextStyles.bodyM.copyWith(
                      fontSize: 14.sp,
                      // Выбранная категория отличается не только фоном,
                      // но и цветом подписи.
                      color: isSelected
                          ? AppComponents
                              .chipgroupChipsSelectedLabelColorDefault
                          : AppComponents
                              .chipgroupChipsNotSelectedLabelColorDefault,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class QrMenuCategoryTabs extends StatelessWidget
//     implements PreferredSizeWidget {
//   final QrMenuVm viewModel;

//   const QrMenuCategoryTabs({super.key, required this.viewModel});

//   @override
//   Widget build(BuildContext context) {
//     final categories = viewModel.menuData?.data ?? [];

//     // Если категорий нет или ключи ещё не рассчитаны — показываем пусто
//     if (categories.isEmpty ||
//         viewModel.scrollService.categoryKeys.length != categories.length) {
//       return const SizedBox.shrink();
//     }

//     return Container(
//       height:
//           viewModel.isTablet ? preferredSize.height + 15 : preferredSize.height,
//       decoration: BoxDecoration(
//         color: AppColors.semanticBgSurface1,
//         border: Border.all(color: AppColors.none),
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: ListView.builder(
//         controller: viewModel.scrollService.horizontalController,
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         padding: const EdgeInsets.only(top: 8, bottom: 4),
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           final isSelected =
//               viewModel.scrollService.selectedCategoryIndex == index;

//           return Padding(
//             padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
//             child: GestureDetector(
//               onTap: () =>
//                   viewModel.scrollByCategory(category.name ?? '', index),
//               child: Container(
//                 key: viewModel.scrollService.categoryKeys[index],
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 margin: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: isSelected
//                       ? AppComponents.chipgroupChipsSelectedBgColorDefault
//                       : AppColors.none,
//                 ),
//                 child: Center(
//                   child: Text(
//                     category.name ?? '',
//                     style: AppTextStyles.bodyM.copyWith(
//                       fontSize: viewModel.isTablet ? 14.sp : null,
//                       color:
//                           AppComponents.chipgroupChipsSelectedLabelColorDefault,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(54);
// }
