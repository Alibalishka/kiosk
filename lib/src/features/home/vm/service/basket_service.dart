import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:flutter/material.dart';

class BasketService {
  List<Items> basket = [];
  List<Modifier> selectedModifiers = [];

  void clear() {
    basket.clear();
    selectedModifiers.clear();
  }

  bool isContainSubscriptionItem() {
    return basket.any((item) => item.price == 0);
  }

  Future<void> add(BuildContext context, Items data, int count) async {
    if (data.price == 0 && containInBasket(data)) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          textAlign: TextAlign.start,
          message: LocaleKeys.minCountSubscription.tr(),
        ),
        dismissType: DismissType.onSwipe,
      );
    } else {
      int index = basket.indexWhere((item) =>
          item.id == data.id &&
          _areModifiersEqual(item.modifiers, data.modifiers));

      if (index != -1) {
        basket[index].count = (basket[index].count ?? 0) + count;
      } else {
        Items item = data.copyWith(
          count: count,
          modifiers: data.modifiers?.map((m) => m.copyWith()).toList(),
        );
        basket.add(item);
      }
    }
  }

  Future<bool> addCombo(BuildContext context, Items data, int count) async {
    for (int i = 0; i < selectedModifiers.length; i++) {
      int selectedCount = selectedModifiers[i].items?.length ?? 0;
      int minRequired = selectedModifiers[i].min ?? 0;
      int maxAllowed = selectedModifiers[i].max ?? double.infinity.toInt();

      if (selectedCount < minRequired || selectedCount > maxAllowed) {
        // throw error or show snackbar

        if (selectedCount < minRequired) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              textAlign: TextAlign.start,
              message:
                  '${selectedModifiers[i].name}, ${LocaleKeys.minimumOptions.tr()} $minRequired ${LocaleKeys.options.tr()}',
            ),
            dismissType: DismissType.onSwipe,
          );
          return false;
        }

        if (selectedCount > maxAllowed) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              textAlign: TextAlign.start,
              message:
                  '${selectedModifiers[i].name}, ${LocaleKeys.maximumOptions.tr()} $maxAllowed ${LocaleKeys.options.tr()}',
            ),
            dismissType: DismissType.onSwipe,
          );
          return false;
        }
        return false;
      }
    }

    Items item = data.copyWith(
      count: count,
      modifiers: selectedModifiers.map((m) => m.copyWith()).toList(),
    );
    basket.add(item);
    return true;
  }

  Future<void> remove(Items targetItem) async {
    int index = basket.lastIndexWhere((item) =>
        item.id == targetItem.id &&
        _areModifiersEqual(item.modifiers, targetItem.modifiers));

    if (index != -1) {
      basket[index].count = (basket[index].count ?? 0) - 1;
      if (basket[index].count! <= 0) {
        basket.removeAt(index);
      }
    } else {
      int lastIndex = basket.lastIndexWhere((item) => item.id == targetItem.id);
      if (lastIndex != -1) {
        basket.removeAt(lastIndex);
      }
    }
  }

  Future<void> saveModifier(Modifier modifier) async {
    int existingIndex =
        selectedModifiers.indexWhere((m) => m.name == modifier.name);
    if (existingIndex != -1) {
      selectedModifiers[existingIndex] = modifier;
    } else {
      selectedModifiers.add(modifier);
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in basket) {
      total += (item.price ?? 0) * (item.count ?? 1);
      item.modifiers?.forEach((mod) {
        mod.items?.forEach((m) {
          total += m.price ?? 0;
        });
      });
    }
    return total;
  }

  int getCount(int id) {
    int total = 0;
    for (var item in basket) {
      if (item.id == id) {
        total += item.count ?? 0;
      }
    }
    return total;
  }

  int getItemTotalPrice(Items item) {
    int total = (item.price ?? 0) * (item.count ?? 1);
    item.modifiers?.forEach((data) {
      data.items?.forEach((mod) {
        total += mod.price ?? 0;
      });
    });
    return total;
  }

  String getModifiers(List<Modifier> data) {
    return data.expand((m) => m.items ?? []).map((i) => i.name).join(', ');
  }

  bool containInBasket(Items item) {
    return basket.any((i) => i.id == item.id);
  }

  List<Items> returnRecommended(QrMenuModel? menuData) {
    return menuData?.recommend
            ?.where((i) => !basket.any((b) => b.id == i.id))
            .toList() ??
        [];
  }

  int getTotalSum() {
    double sum = 0;
    for (var data in selectedModifiers) {
      for (var item in data.items!) {
        sum += item.price ?? 0;
      }
    }
    return sum.toInt();
  }

  MenuCheckoutRequest buildCheckoutRequest({
    String? organizationId,
    String? tableId,
    required int indexType,
    int? addressId,
  }) {
    return MenuCheckoutRequest(
      organizationId: organizationId,
      tableId: tableId,
      deliveryType: addressId == null
          ? indexType == 0
              ? DeliveryType.order
              : DeliveryType.pickup
          : DeliveryType.delivery,
      addressId: addressId,
      items: basket.map((item) {
        List<MenuCheckoutItemModif> modifiers = [];
        item.modifiers?.forEach((mod) {
          mod.items?.forEach((modItem) {
            modifiers.add(MenuCheckoutItemModif(
              itemId: modItem.id,
              amount: 1,
              itemGroupId: mod.iikoId,
            ));
          });
        });

        return MenuCheckoutItem(
          itemId: item.id,
          amount: item.count,
          modifiers: modifiers,
        );
      }).toList(),
    );
  }

  bool _areModifiersEqual(List<Modifier>? mods1, List<Modifier>? mods2) {
    if (mods1 == null || mods2 == null) return mods1 == mods2;
    if (mods1.length != mods2.length) return false;
    for (int i = 0; i < mods1.length; i++) {
      if (!_isModifierEqual(mods1[i], mods2[i])) return false;
    }
    return true;
  }

  bool _isModifierEqual(Modifier mod1, Modifier mod2) {
    return mod1.id == mod2.id &&
        mod1.name == mod2.name &&
        _areItemsEqual(mod1.items, mod2.items);
  }

  bool _areItemsEqual(List<Items>? items1, List<Items>? items2) {
    if (items1 == null || items2 == null) return items1 == items2;
    if (items1.length != items2.length) return false;
    for (int i = 0; i < items1.length; i++) {
      if (!_isItemEqual(items1[i], items2[i])) return false;
    }
    return true;
  }

  bool _isItemEqual(Items i1, Items i2) {
    return i1.id == i2.id &&
        i1.name == i2.name &&
        i1.price == i2.price &&
        i1.code == i2.code;
  }
}

// class BasketService {
//   List<Items> basket = [];
//   List<Modifier> selectedModifiers = [];

//   void clear() {
//     basket.clear();
//     selectedModifiers.clear();
//   }

//   Future<void> add(Items data, int count) async {
//     int index = basket.indexWhere((item) =>
//         item.id == data.id &&
//         _areModifiersEqual(item.modifiers, data.modifiers));

//     if (index != -1) {
//       basket[index].count = (basket[index].count ?? 0) + count;
//     } else {
//       Items item = data.copyWith(
//         count: count,
//         modifiers: data.modifiers?.map((m) => m.copyWith()).toList(),
//       );
//       basket.add(item);
//     }
//   }

//   Future<void> addCombo(BuildContext context, Items data, int count) async {
//     for (int i = 0; i < selectedModifiers.length; i++) {
//       int selectedCount = selectedModifiers[i].items?.length ?? 0;
//       int minRequired = selectedModifiers[i].min ?? 0;
//       int maxAllowed = selectedModifiers[i].max ?? double.infinity.toInt();

//       if (selectedCount < minRequired || selectedCount > maxAllowed) {
//         // throw error or show snackbar

//         if (selectedCount < minRequired) {
//           showTopSnackBar(
//             Overlay.of(context),
//             CustomSnackBar.error(
//               textAlign: TextAlign.start,
//               message:
//                   '${selectedModifiers[i].name}, выберите минимум $minRequired опций',
//             ),
//             dismissType: DismissType.onSwipe,
//           );
//           return;
//         }

//         if (selectedCount > maxAllowed) {
//           showTopSnackBar(
//             Overlay.of(context),
//             CustomSnackBar.error(
//               textAlign: TextAlign.start,
//               message:
//                   '${selectedModifiers[i].name}, можно выбрать максимум $maxAllowed опций',
//             ),
//             dismissType: DismissType.onSwipe,
//           );
//           return;
//         }
//         return;
//       }
//     }

//     Items item = data.copyWith(
//       count: count,
//       modifiers: selectedModifiers.map((m) => m.copyWith()).toList(),
//     );
//     basket.add(item);
//   }

//   Future<void> remove(Items targetItem) async {
//     int index = basket.lastIndexWhere((item) =>
//         item.id == targetItem.id &&
//         _areModifiersEqual(item.modifiers, targetItem.modifiers));

//     if (index != -1) {
//       basket[index].count = (basket[index].count ?? 0) - 1;
//       if (basket[index].count! <= 0) {
//         basket.removeAt(index);
//       }
//     } else {
//       int lastIndex = basket.lastIndexWhere((item) => item.id == targetItem.id);
//       if (lastIndex != -1) {
//         basket.removeAt(lastIndex);
//       }
//     }
//   }

//   Future<void> saveModifier(Modifier modifier) async {
//     int existingIndex =
//         selectedModifiers.indexWhere((m) => m.name == modifier.name);
//     if (existingIndex != -1) {
//       selectedModifiers[existingIndex] = modifier;
//     } else {
//       selectedModifiers.add(modifier);
//     }
//   }

//   double getTotalPrice() {
//     double total = 0;
//     for (var item in basket) {
//       total += (item.price ?? 0) * (item.count ?? 1);
//       item.modifiers?.forEach((mod) {
//         mod.items?.forEach((m) {
//           total += m.price ?? 0;
//         });
//       });
//     }
//     return total;
//   }

//   int getCount(int id) {
//     int total = 0;
//     for (var item in basket) {
//       if (item.id == id) {
//         total += item.count ?? 0;
//       }
//     }
//     return total;
//   }

//   int getItemTotalPrice(Items item) {
//     int total = (item.price ?? 0) * (item.count ?? 1);
//     item.modifiers?.forEach((data) {
//       data.items?.forEach((mod) {
//         total += mod.price ?? 0;
//       });
//     });
//     return total;
//   }

//   String getModifiers(List<Modifier> data) {
//     return data.expand((m) => m.items ?? []).map((i) => i.name).join(', ');
//   }

//   bool containInBasket(Items item) {
//     return basket.any((i) => i.id == item.id);
//   }

//   List<Items> returnRecommended(QrMenuModel? menuData) {
//     return menuData?.recommend
//             ?.where((i) => !basket.any((b) => b.id == i.id))
//             .toList() ??
//         [];
//   }

//   int getTotalSum() {
//     double sum = 0;
//     for (var data in selectedModifiers) {
//       for (var item in data.items!) {
//         sum += item.price ?? 0;
//       }
//     }
//     return sum.toInt();
//   }

//   MenuCheckoutRequest buildCheckoutRequest(
//       String? organizationId, String? tableId) {
//     return MenuCheckoutRequest(
//       organizationId: organizationId,
//       tableId: tableId,
//       items: basket.map((item) {
//         List<MenuCheckoutItemModif> modifiers = [];
//         item.modifiers?.forEach((mod) {
//           mod.items?.forEach((modItem) {
//             modifiers.add(MenuCheckoutItemModif(
//               itemId: modItem.id,
//               amount: 1,
//               itemGroupId: mod.iikoId,
//             ));
//           });
//         });

//         return MenuCheckoutItem(
//           itemId: item.id,
//           amount: item.count,
//           modifiers: modifiers,
//         );
//       }).toList(),
//     );
//   }

//   bool _areModifiersEqual(List<Modifier>? mods1, List<Modifier>? mods2) {
//     if (mods1 == null || mods2 == null) return mods1 == mods2;
//     if (mods1.length != mods2.length) return false;
//     for (int i = 0; i < mods1.length; i++) {
//       if (!_isModifierEqual(mods1[i], mods2[i])) return false;
//     }
//     return true;
//   }

//   bool _isModifierEqual(Modifier mod1, Modifier mod2) {
//     return mod1.id == mod2.id &&
//         mod1.name == mod2.name &&
//         _areItemsEqual(mod1.items, mod2.items);
//   }

//   bool _areItemsEqual(List<Items>? items1, List<Items>? items2) {
//     if (items1 == null || items2 == null) return items1 == items2;
//     if (items1.length != items2.length) return false;
//     for (int i = 0; i < items1.length; i++) {
//       if (!_isItemEqual(items1[i], items2[i])) return false;
//     }
//     return true;
//   }

//   bool _isItemEqual(Items i1, Items i2) {
//     return i1.id == i2.id &&
//         i1.name == i2.name &&
//         i1.price == i2.price &&
//         i1.code == i2.code;
//   }
// }
