import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';


class MenuDataService {
  QrMenuModel? _menuData;

  void setMenuData(QrMenuModel data) {
    _menuData = data;
  }

  List<FlattenedMenuItem> flattenedItems(
      QrMenuModel? menuData, bool isGridView) {
    final result = <FlattenedMenuItem>[];

    for (final category in menuData!.data!) {
      final items = category.items ?? [];

      // Добавляем CategoryTitle со всеми items
      result.add(CategoryTitle(
        title: category.name,
        items: items,
        recommend:
            category.recommend?.isNotEmpty == true ? category.recommend! : null,
      ));

      // Удаляем первый элемент (если есть), перед тем как добавлять остальное
      // List<Items> modifiedItems = items.length > 1 ? items.sublist(1) : [];
      List<Items> modifiedItems = items;

      if (isGridView && modifiedItems.isNotEmpty) {
        result.add(GridMenuItems(items: modifiedItems));
      } else {
        for (final item in modifiedItems) {
          result.add(SingleMenuItem(item: item));
        }
      }
    }

    return result;
  }

  QrMenuModel? get currentMenu => _menuData;
}

sealed class FlattenedMenuItem {}

class CategoryTitle extends FlattenedMenuItem {
  final String? title;
  final List<Items>? recommend;
  final List<Items>? items;
  CategoryTitle({
    this.title,
    this.recommend,
    this.items,
  });
}

class SingleMenuItem extends FlattenedMenuItem {
  final Items item;
  SingleMenuItem({required this.item});
}

class GridMenuItems extends FlattenedMenuItem {
  final List<Items> items;
  GridMenuItems({required this.items});
}


// class MenuDataService {
//   QrMenuModel? _menuData;

//   void setMenuData(QrMenuModel data) {
//     _menuData = data;
//   }

//   List<FlattenedMenuItem> flattenedItems(
//       QrMenuModel? menuData, bool isGridView) {
//     final result = <FlattenedMenuItem>[];

//     for (final category in menuData!.data!) {
//       final items = category.items ?? [];

//       // Добавляем CategoryTitle со всеми items
//       result.add(CategoryTitle(
//         title: category.name,
//         items: items,
//         recommend:
//             category.recommend?.isNotEmpty == true ? category.recommend! : null,
//       ));

//       // Удаляем первый элемент (если есть), перед тем как добавлять остальное
//       List<Items> modifiedItems = items.length > 1 ? items.sublist(1) : [];

//       if (isGridView && modifiedItems.isNotEmpty) {
//         result.add(GridMenuItems(items: modifiedItems));
//       } else {
//         for (final item in modifiedItems) {
//           result.add(SingleMenuItem(item: item));
//         }
//       }
//     }

//     return result;
//   }

//   QrMenuModel? get currentMenu => _menuData;
// }

// sealed class FlattenedMenuItem {}

// class CategoryTitle extends FlattenedMenuItem {
//   final String? title;
//   final List<Items>? recommend;
//   final List<Items>? items;
//   CategoryTitle({
//     this.title,
//     this.recommend,
//     this.items,
//   });
// }

// class SingleMenuItem extends FlattenedMenuItem {
//   final Items item;
//   SingleMenuItem({required this.item});
// }

// class GridMenuItems extends FlattenedMenuItem {
//   final List<Items> items;
//   GridMenuItems({required this.items});
// }
