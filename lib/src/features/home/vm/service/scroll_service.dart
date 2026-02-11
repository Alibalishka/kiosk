import 'dart:developer';
import 'dart:io';

import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ScrollService {
  late VoidCallback onUpdate;
  final scrollController = ScrollController();
  final horizontalController = ScrollController();

  QrMenuModel? menuData;
  List<GlobalKey> categoryKeys = [];
  Map<String, double> categoryOffsets = {};
  List<double> categoryWidths = [];
  int selectedCategoryIndex = 0;
  bool isAtStart = true;
  bool isScrollAnimation = false;
  bool isTablet = false;

  BuildContext? _context;

  bool isProgrammaticScroll = false;

  void init(BuildContext context) {
    _context = context;
    scrollController.addListener(_onVerticalScroll);
  }

  void dispose() {
    scrollController.removeListener(_onVerticalScroll);
    scrollController.dispose();
    horizontalController.dispose();
  }

  void reset() {
    categoryKeys.clear();
    categoryOffsets.clear();
    categoryWidths.clear();
    selectedCategoryIndex = 0;
    isAtStart = true;
    isScrollAnimation = false;
  }

  void setListener(VoidCallback fn) {
    onUpdate = fn;
  }

  void syncWithMenu(
    BuildContext context,
    QrMenuModel menuData,
    bool isGridView,
    bool isTablet,
  ) {
    this.isTablet = isTablet;
    this.menuData = menuData;
    isAtStart =
        !isAtStart ? isAtStart : menuData.recommend?.isNotEmpty ?? false;
    categoryKeys =
        List.generate(menuData.data?.length ?? 0, (_) => GlobalKey());
    calculateCategoryWidths(menuData);
    calculateOffsets(context, menuData, isGridView);
  }

  void calculateCategoryWidths(QrMenuModel menuData) {
    categoryWidths.clear();
    for (var category in menuData.data!) {
      final width = _calculateTextWidth(
          category.name ?? '',
          AppTextStyles.bodyMStrong
              .copyWith(fontSize: isTablet ? 13.sp : null));
      categoryWidths.add(width);
    }
  }

  void calculateOffsets(
    BuildContext context,
    QrMenuModel menuData,
    bool isGridView,
  ) {
    categoryOffsets.clear();

    // double offset = menuData.recommend?.isNotEmpty ?? false
    //     ? isTablet
    //         ? ((_context!.mediaQuery.size.width / 1.3) - kToolbarHeight) - 54
    //         : (450 - kToolbarHeight) - 54
    //     : 5;
    final tabsHeight = isTablet ? 69.0 : 54.0;

    double offset = menuData.recommend?.isNotEmpty ?? false
        ? isTablet
            ? ((_context!.mediaQuery.size.width / 1.3) - kToolbarHeight) -
                tabsHeight
            : (450 - kToolbarHeight) - tabsHeight
        : 5;
    // isAtStart = menuData.recommend?.isNotEmpty ?? false;

    final textPainter = TextPainter(
      text: TextSpan(
          text: 'Ex',
          style: AppTextStyles.headingH3.copyWith(
            fontSize: isTablet ? 16.sp : null,
          )),
      textDirection: TextDirection.ltr,
    )..layout();

    for (var category in menuData.data!) {
      final itemCount = category.items?.length ?? 0;
      // bool isEven = isTablet
      //     ? (category.items?.length ?? 0) % 3 == 0
      //     : (category.items?.length ?? 0) % 2 == 0;

      categoryOffsets[category.name ?? ''] = offset;

      offset += category.recommend?.isEmpty ?? true
          ? textPainter.height + 32
          : isTablet
              ? textPainter.height + 32 + 475
              : textPainter.height + 32 + 430;

      if (isGridView) {
        final columns = isTablet ? 3 : 2;
        // final itemHeight = isTablet ? 475.0 : 355.0;
        final itemHeight = isTablet
            ? (Platform.isIOS ? 50.1.sh : 44.5.sh)
            : context.mediaQuery.size.width / 1.16;

        final numRows = (itemCount / columns).ceil();
        offset += numRows * itemHeight;
      } else {
        final itemHeight = isTablet ? (15.sh + 32) : 168.0;
        offset += itemCount * itemHeight;
      }
    }

    if (_context != null && categoryOffsets.isNotEmpty) {
      final lastOffset = categoryOffsets.values.last;
      isScrollAnimation = lastOffset > MediaQuery.of(_context!).size.height;

      log("Screen Height: \${MediaQuery.of(_context!).size.height}");
      log("Last Offset: \$lastOffset");
      log("isScrollAnimation: \$isScrollAnimation");
    }
  }

  // void _onVerticalScroll() {
  //   final currentOffset = scrollController.offset;
  //   int? newIndex;

  //   for (int i = 0; i < categoryOffsets.length; i++) {
  //     if (currentOffset >= categoryOffsets.values.elementAt(i) &&
  //         (i == categoryOffsets.length - 1 ||
  //             currentOffset < categoryOffsets.values.elementAt(i + 1))) {
  //       newIndex = i;
  //       break;
  //     }
  //   }

  //   if (newIndex != null && newIndex != selectedCategoryIndex) {
  //     selectedCategoryIndex = newIndex;
  //     if (categoryWidths.length > 2) scrollToHorizontalCategory(newIndex);
  //   }

  //   if (_context != null &&
  //       (menuData?.recommend != null &&
  //           (menuData?.recommend?.isNotEmpty ?? false))) {
  //     final threshold = MediaQuery.of(_context!).size.width / 1.4;
  //     if (currentOffset < threshold && !isAtStart) {
  //       isAtStart = true;
  //     } else if (currentOffset >= threshold && isAtStart) {
  //       isAtStart = false;
  //     }
  //   }
  //   onUpdate();
  // }

  void _onVerticalScroll() {
    if (isProgrammaticScroll) return;

    final currentOffset = scrollController.offset;
    int? newIndex;

    for (int i = 0; i < categoryOffsets.length; i++) {
      if (currentOffset >= categoryOffsets.values.elementAt(i) &&
          (i == categoryOffsets.length - 1 ||
              currentOffset < categoryOffsets.values.elementAt(i + 1))) {
        newIndex = i;
        break;
      }
    }

    if (newIndex != null && newIndex != selectedCategoryIndex) {
      selectedCategoryIndex = newIndex;
      if (categoryWidths.length > 2) {
        scrollToHorizontalCategory(newIndex);
      }
    }

    if (_context != null &&
        (menuData?.recommend != null &&
            (menuData?.recommend?.isNotEmpty ?? false))) {
      final threshold = MediaQuery.of(_context!).size.width / 1.4;
      if (currentOffset < threshold && !isAtStart) {
        isAtStart = true;
      } else if (currentOffset >= threshold && isAtStart) {
        isAtStart = false;
      }
    }

    onUpdate();
  }

  // void scrollToHorizontalCategory(int index) {
  //   double horizontalOffset = 0;
  //   for (int i = 0; i < index; i++) {
  //     horizontalOffset += categoryWidths[i];
  //   }
  //   horizontalController.animateTo(
  //     horizontalOffset,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void scrollToHorizontalCategory(int index) {
    if (!horizontalController.hasClients || categoryWidths.isEmpty) return;

    final position = horizontalController.position;
    final viewportWidth = position.viewportDimension;

    // Отступ слева для первого таба (у тебя там Padding(left: 16))
    const double startPadding = 16.0;

    double tabStart = startPadding;
    for (int i = 0; i < index; i++) {
      tabStart += categoryWidths[i];
    }

    final tabWidth = categoryWidths[index];
    final tabCenter = tabStart + tabWidth / 2;

    // Хотим, чтобы таб был ближе к центру экрана
    double targetOffset = tabCenter - viewportWidth / 2;

    // Не даём проскроллить больше, чем позволяет список
    targetOffset = targetOffset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    horizontalController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  // void scrollToCategory(String category, int index) {
  //   if (categoryOffsets.containsKey(category) && isScrollAnimation) {
  //     scrollController.animateTo(
  //       categoryOffsets[category]!,
  //       duration: const Duration(milliseconds: 100),
  //       curve: Curves.easeInOut,
  //     );

  //     double horizontalOffset = 0;
  //     for (int i = 0; i < index; i++) {
  //       horizontalOffset += categoryWidths[i];
  //     }

  //     if (categoryWidths.length > 2) {
  //       horizontalController.animateTo(
  //         horizontalOffset,
  //         duration: const Duration(milliseconds: 100),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   }
  //   selectedCategoryIndex = index;
  // }

  // void scrollToCategory(String category, int index) {
  //   selectedCategoryIndex = index;

  //   // Сначала двигаем горизонтальные табы
  //   if (categoryWidths.length > 2) {
  //     scrollToHorizontalCategory(index);
  //   }

  //   // Если анимация вертикального скролла вообще нужна
  //   if (!isScrollAnimation) {
  //     onUpdate();
  //     return;
  //   }

  //   if (!scrollController.hasClients) {
  //     onUpdate();
  //     return;
  //   }

  //   final target = categoryOffsets[category];
  //   if (target == null) {
  //     onUpdate();
  //     return;
  //   }

  //   final position = scrollController.position;
  //   final clampedTarget = target.clamp(
  //     position.minScrollExtent,
  //     position.maxScrollExtent,
  //   );

  //   scrollController.animateTo(
  //     clampedTarget.toDouble(),
  //     duration: const Duration(milliseconds: 250),
  //     curve: Curves.easeInOut,
  //   );

  //   onUpdate();
  // }

  Future<void> scrollToCategory(String category, int index) async {
    selectedCategoryIndex = index;

    // Горизонтальный скролл табов — сразу к нужной
    if (categoryWidths.length > 2) {
      scrollToHorizontalCategory(index);
    }

    // Если нет нужды анимировать вертикальный скролл — просто обновим
    if (!isScrollAnimation || !scrollController.hasClients) {
      onUpdate();
      return;
    }

    final target = categoryOffsets[category];
    if (target == null) {
      onUpdate();
      return;
    }

    final position = scrollController.position;
    final clampedTarget = target.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    // ⬇️ Ставим флаг "мы сами крутим"
    isProgrammaticScroll = true;
    try {
      await scrollController.animateTo(
        clampedTarget.toDouble(),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    } finally {
      // ⬇️ Сбрасываем флаг в любом случае
      isProgrammaticScroll = false;
    }

    onUpdate();
  }

  double _calculateTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width + 35;
  }
}

// class ScrollService {
//   late VoidCallback onUpdate;
//   final scrollController = ScrollController();
//   final horizontalController = ScrollController();

//   List<GlobalKey> categoryKeys = [];
//   Map<String, double> categoryOffsets = {};
//   List<double> categoryWidths = [];
//   int selectedCategoryIndex = 0;
//   bool isAtStart = true;
//   bool isScrollAnimation = false;
//   bool isTablet = false;

//   BuildContext? _context;

//   void init(BuildContext context) {
//     _context = context;
//     scrollController.addListener(_onVerticalScroll);
//   }

//   void dispose() {
//     scrollController.removeListener(_onVerticalScroll);
//     scrollController.dispose();
//     horizontalController.dispose();
//   }

//   void reset() {
//     categoryKeys.clear();
//     categoryOffsets.clear();
//     categoryWidths.clear();
//     selectedCategoryIndex = 0;
//     isAtStart = true;
//     isScrollAnimation = false;
//   }

//   void setListener(VoidCallback fn) {
//     onUpdate = fn;
//   }

//   void syncWithMenu(BuildContext context, QrMenuModel menuData, bool isGridView,
//       bool isTablet) {
//     this.isTablet = isTablet;
//     categoryKeys =
//         List.generate(menuData.data?.length ?? 0, (_) => GlobalKey());
//     calculateCategoryWidths(menuData);
//     calculateOffsets(context, menuData, isGridView);
//   }

//   void calculateCategoryWidths(QrMenuModel menuData) {
//     categoryWidths.clear();
//     for (var category in menuData.data!) {
//       final width =
//           _calculateTextWidth(category.name ?? '', AppTextStyles.bodyMStrong);
//       categoryWidths.add(width);
//     }
//   }

//   void calculateOffsets(
//     BuildContext context,
//     QrMenuModel menuData,
//     bool isGridView,
//   ) {
//     categoryOffsets.clear();

//     double offset = menuData.recommend?.isNotEmpty ?? false
//         ? isTablet
//             ? ((_context!.mediaQuery.size.width / 1.2) - kToolbarHeight) - 54
//             : (450 - kToolbarHeight) - 54
//         : 5;

//     isAtStart = menuData.recommend?.isNotEmpty ?? false;

//     final textPainter = TextPainter(
//       text: TextSpan(
//           text: 'Ex',
//           style: AppTextStyles.headingH3.copyWith(
//             fontSize: isTablet ? 32 : null,
//           )),
//       textDirection: TextDirection.ltr,
//     )..layout();

//     for (var category in menuData.data!) {
//       int itemCount = 0;
//       if (isTablet) {
//         itemCount = (category.items?.length ?? 0) - 1;
//       } else {
//         itemCount = (category.items?.length ?? 0);
//       }
//       // final itemCount = (category.items?.length ?? 0) - 1;
//       // final itemCount = (category.items?.length ?? 0) - 1;
//       log('Count: ${category.name}');
//       log('Count: $itemCount');
//       // bool isEven = isTablet
//       //     ? (category.items?.length ?? 0) % 3 == 0
//       //     : (category.items?.length ?? 0) % 2 == 0;

//       categoryOffsets[category.name ?? ''] = offset;

//       offset += category.recommend?.isEmpty ?? true
//           ? textPainter.height + 32
//           : isTablet
//               ? textPainter.height + 32 + getHeightWidget(_context!)
//               : textPainter.height + 32 + 430;

//       if (isGridView) {
//         final columns = isTablet ? 3 : 2;
//         final itemHeight = isTablet ? getHeightWidget(_context!) : 385.0;

//         final numRows = (itemCount / columns).ceil();
//         offset += numRows * itemHeight;
//       } else {
//         final itemHeight =
//             isTablet ? (context.mediaQuery.size.width / 3.3 + 32) : 170.0;
//         offset += itemCount * itemHeight;
//       }
//     }

//     if (_context != null && categoryOffsets.isNotEmpty) {
//       final lastOffset = categoryOffsets.values.last;
//       isScrollAnimation = lastOffset > MediaQuery.of(_context!).size.height;

//       log("Screen Height: ${MediaQuery.of(_context!).size.height}");
//       log("Screen Width: ${MediaQuery.of(_context!).size.width}");
//       log("Last Offset: $lastOffset");
//       log("isScrollAnimation: $isScrollAnimation");
//     }
//   }

//   void _onVerticalScroll() {
//     final currentOffset = scrollController.offset;
//     int? newIndex;

//     for (int i = 0; i < categoryOffsets.length; i++) {
//       if (currentOffset >= categoryOffsets.values.elementAt(i) &&
//           (i == categoryOffsets.length - 1 ||
//               currentOffset < categoryOffsets.values.elementAt(i + 1))) {
//         newIndex = i;
//         break;
//       }
//     }

//     if (newIndex != null && newIndex != selectedCategoryIndex) {
//       selectedCategoryIndex = newIndex;
//       if (categoryWidths.length > 2) scrollToHorizontalCategory(newIndex);
//     }

//     if (_context != null) {
//       final threshold = MediaQuery.of(_context!).size.width / 1.4;
//       if (currentOffset < threshold && !isAtStart) {
//         isAtStart = true;
//       } else if (currentOffset >= threshold && isAtStart) {
//         isAtStart = false;
//       }
//     }
//     onUpdate();
//   }

//   void scrollToHorizontalCategory(int index) {
//     double horizontalOffset = 0;
//     for (int i = 0; i < index; i++) {
//       horizontalOffset += categoryWidths[i];
//     }
//     horizontalController.animateTo(
//       horizontalOffset,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   double getHeightWidget(BuildContext context, {int rowsToShow = 2}) {
//     final size = MediaQuery.of(context).size;
//     final padding = MediaQuery.of(context).padding;

//     final isTablet = size.shortestSide >= 600;
//     final crossAxisCount = isTablet ? 3 : 2;
//     final mainAxisSpacing = 12.0;
//     final verticalPadding = 16.0;
//     final appBarHeight = kToolbarHeight; // стандартный appBar
//     final safeAreaPadding = padding.top + padding.bottom;

//     final availableHeight =
//         size.height - appBarHeight - safeAreaPadding - verticalPadding;

//     final totalSpacing = mainAxisSpacing * (rowsToShow - 1);
//     final calculatedHeight = (availableHeight - totalSpacing) / rowsToShow;

//     return calculatedHeight.clamp(250.0, 700.0);
//   }

//   void scrollToCategory(String category, int index) {
//     if (categoryOffsets.containsKey(category) && isScrollAnimation) {
//       scrollController.animateTo(
//         categoryOffsets[category]!,
//         duration: const Duration(milliseconds: 100),
//         curve: Curves.easeInOut,
//       );

//       double horizontalOffset = 0;
//       for (int i = 0; i < index; i++) {
//         horizontalOffset += categoryWidths[i];
//       }

//       if (categoryWidths.length > 2) {
//         horizontalController.animateTo(
//           horizontalOffset,
//           duration: const Duration(milliseconds: 100),
//           curve: Curves.easeInOut,
//         );
//       }
//     }
//     selectedCategoryIndex = index;
//   }

//   double _calculateTextWidth(String text, TextStyle style) {
//     final textPainter = TextPainter(
//       text: TextSpan(text: text, style: style),
//       textDirection: TextDirection.ltr,
//     )..layout();
//     return textPainter.width + 35;
//   }
// }
