// import 'package:auto_route/auto_route.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SearchWidget extends StatelessWidget {
//   final bool chevron;
//   final bool barcode;
//   final String text;
//   final bool cancel;
//   final Function()? onTap;
//   const SearchWidget({
//     super.key,
//     this.chevron = false,
//     this.barcode = true,
//     this.cancel = false,
//     required this.text,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap ?? () => context.router.push(const SearchPageRoute()),
//       child: Row(
//         children: [
//           chevron
//               ? GestureDetector(
//                   onTap: () => context.router.pop(),
//                   child: SvgPicture.asset(
//                     AppSvgImages.iconLeft,
//                   ),
//                 )
//               : const SizedBox(),
//           chevron ? const RowSpacer(1.6) : const SizedBox(),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: AppColors.primitiveNeutral25),
//                   borderRadius: BorderRadius.circular(12)),
//               padding: AppPaddings.symmetric12x8,
//               child: Row(
//                 children: [
//                   SvgPicture.asset(AppSvgImages.search),
//                   const RowSpacer(0.8),
//                   Text(
//                     text,
//                     style: AppTextStyles.bodyL
//                         .copyWith(color: AppColors.primitiveNeutral300),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           barcode
//               ? const RowSpacer(1.6)
//               : cancel == true
//                   ? const RowSpacer(1.6)
//                   : const SizedBox(),
//           barcode
//               ? InkWell(
//                   onTap: () => context.router.push(const BarcodeWidgetRoute()),
//                   child: SvgPicture.asset(
//                     AppSvgImages.barcode,
//                     color: AppColors.semanticFgDefault,
//                   ),
//                 )
//               : cancel == true
//                   ? Text(
//                       'Отменить',
//                       style: AppTextStyles.bodyM.copyWith(
//                           color: AppComponents
//                               .functionbuttonAccentIconColorDefault),
//                     )
//                   : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }
