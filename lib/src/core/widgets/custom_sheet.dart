// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';

// showCustomSheet(
//   BuildContext context, {
//   required Widget child,
//   Color? color,
//   Function()? action,
// }) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     isDismissible: true,
//     useRootNavigator: true,
//     backgroundColor: color ?? AppColors.none,
//     elevation: 0,
//     constraints: const BoxConstraints(
//       maxWidth: double.infinity,
//     ),
//     builder: (BuildContext context) => child,
//   ).whenComplete(() {
//     if (action != null) {
//       action();
//     }
//   });
// }
Future<void> showCustomSheet(
  BuildContext context, {
  required Widget child,
  Color? backgroundColor,
  VoidCallback? onClose,
  bool fullscreen = true,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,

    // ❗ УБРАЛИ useRootNavigator
    // useRootNavigator: true,

    backgroundColor: Colors.transparent,
    elevation: 0,

    constraints: const BoxConstraints(
      maxWidth: double.infinity,
    ),

    builder: (sheetContext) {
      final bottomInset = MediaQuery.of(sheetContext).viewInsets.bottom;
      final height = MediaQuery.of(sheetContext).size.height;

      return AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SizedBox(
          height: fullscreen ? height : null,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: fullscreen
                  ? BorderRadius.zero
                  : const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SafeArea(
              top: fullscreen,
              child: child,
            ),
          ),
        ),
      );
    },
  ).whenComplete(() {
    onClose?.call();
  });
}

// void showCupertinoSheet(
//   BuildContext context, {
//   required Widget child,
//   VoidCallback? onClose,
//   double borderRadius = 16,
// }) {
//   showCupertinoModalPopup(
//     context: context,
//     barrierDismissible: true,
//     builder: (context) {
//       final bottomInset = MediaQuery.of(context).viewInsets.bottom;

//       return GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         onTap: () => Navigator.of(context).pop(),
//         child: SafeArea(
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: GestureDetector(
//               onTap: () {}, // чтобы клики не закрывали
//               child: Container(
//                 margin: EdgeInsets.only(bottom: bottomInset),
//                 decoration: BoxDecoration(
//                   color: CupertinoColors.systemBackground.resolveFrom(context),
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(borderRadius),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // 🔽 iOS drag indicator
//                     Container(
//                       width: 36,
//                       height: 5,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         color: CupertinoColors.systemGrey4,
//                         borderRadius: BorderRadius.circular(3),
//                       ),
//                     ),

//                     Flexible(child: child),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     },
//   ).whenComplete(() {
//     onClose?.call();
//   });
// }

// class CupertinoDepthModalRoute<T> extends PageRoute<T> {
//   CupertinoDepthModalRoute({
//     required this.builder,
//     this.barrierOpacity = 0.35,
//   });

//   final WidgetBuilder builder;
//   final double barrierOpacity;

//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 420);

//   @override
//   Duration get reverseTransitionDuration => const Duration(milliseconds: 320);

//   @override
//   bool get opaque => false;

//   @override
//   bool get barrierDismissible => true;

//   @override
//   Color get barrierColor => Colors.black.withOpacity(barrierOpacity);

//   @override
//   String get barrierLabel => 'Dismiss';

//   @override
//   bool get maintainState => true;

//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     return builder(context);
//   }

//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     final curved =
//         CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);

//     // 🔹 задний экран уходит назад
//     final scale = Tween<double>(begin: 1.0, end: 0.92).animate(curved);

//     // 🔹 модалка едет снизу
//     final slide = Tween<Offset>(
//       begin: const Offset(0, 1),
//       end: Offset.zero,
//     ).animate(curved);

//     return Stack(
//       children: [
//         // BACKGROUND SCALE
//         AnimatedBuilder(
//           animation: scale,
//           builder: (_, __) {
//             return Transform.scale(
//               scale: scale.value,
//               alignment: Alignment.topCenter,
//               child: const SizedBox.expand(),
//             );
//           },
//         ),

//         // MODAL
//         SlideTransition(
//           position: slide,
//           child: SafeArea(
//             top: false,
//             bottom: false,
//             child: child,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CupertinoSheet extends StatelessWidget {
//   const CupertinoSheet({super.key, required this.child});

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         decoration: BoxDecoration(
//           color: CupertinoColors.systemBackground.resolveFrom(context),
//           borderRadius: const BorderRadius.vertical(
//             top: Radius.circular(16),
//           ),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // iOS drag indicator
//             // Container(
//             //   width: 36,
//             //   height: 5,
//             //   margin: const EdgeInsets.symmetric(vertical: 10),
//             //   decoration: BoxDecoration(
//             //     color: CupertinoColors.systemGrey4,
//             //     borderRadius: BorderRadius.circular(3),
//             //   ),
//             // ),
//             Flexible(child: child),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<void> showCupertinoDepthSheet(
//   BuildContext context, {
//   required Widget child,
//   VoidCallback? onClose,
// }) async {
//   await Navigator.of(context).push(
//     CupertinoDepthModalRoute(
//       builder: (_) => CupertinoSheet(child: child),
//     ),
//   );

//   onClose?.call();
// }
