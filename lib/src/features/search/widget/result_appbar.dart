// import 'package:auto_route/auto_route.dart';
// import 'package:qr_pay_app/src/core/resources/app_bottom_sheet.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:qr_pay_app/src/features/search/pages/filter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class ResultAppBar extends StatefulWidget {
//   final String searchText;
//   const ResultAppBar({super.key, required this.searchText});

//   @override
//   State<ResultAppBar> createState() => _ResultAppBarState();
// }

// class _ResultAppBarState extends State<ResultAppBar> {
//   List<String> filter = [
//     'Бренды',
//     'Поставщики',
//     'Цена',
//     'Тип',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: AppPaddings.vertical12,
//       decoration: const BoxDecoration(
//         color: AppColors.semanticBgSurface1,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromRGBO(0, 0, 0, 0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           SafeArea(
//             bottom: false,
//             child: Padding(
//               padding: AppPaddings.horizontal16,
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () => context.router.pop(),
//                     child: SvgPicture.asset(
//                       AppSvgImages.iconLeft,
//                     ),
//                   ),
//                   const RowSpacer(1.6),
//                   // onTap: () => context.router.push(const SearchPageRoute()),
//                   GestureDetector(
//                     onTap: () => context.router.push(const SearchPageRoute()),
//                     child: Container(
//                       color: Colors.transparent,
//                       child: CupertinoSearchTextField(
//                         enabled: false,
//                         placeholder: 'Поиск',
//                         style: AppTextStyles.bodyL.copyWith(
//                             color: AppComponents
//                                 .inputSecondaryPlaceholdertextColorDefault),
//                         decoration: BoxDecoration(
//                           color: AppColors.semanticBgSurface1,
//                           border: Border.all(
//                               color: AppComponents
//                                   .inputSecondaryBorderColorDefault),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // GestureDetector(
//                   //   onTap: () => context.router.push(const SearchPageRoute()),
//                   //   child: CupertinoSearchTextField(
//                   //     enabled: false,
//                   //     // borderRadius: BorderRadius.circular(12),
//                   //     placeholder: 'Поиск',
//                   //     //controller: searchController,
//                   //     style: AppTextStyles.bodyL.copyWith(
//                   //         color: AppComponents
//                   //             .inputSecondaryPlaceholdertextColorDefault),
//                   //     decoration: BoxDecoration(
//                   //       color: AppColors.semanticBgSurface1,
//                   //       border: Border.all(
//                   //           color:
//                   //               AppComponents.inputSecondaryBorderColorDefault),
//                   //       borderRadius: BorderRadius.circular(12),
//                   //     ),
//                   //   ),
//                   // ),
//                   const RowSpacer(1.6),
//                   Text(
//                     'Отменить',
//                     style: AppTextStyles.bodyM.copyWith(
//                         color:
//                             AppComponents.functionbuttonAccentIconColorDefault),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const ColumnSpacer(1.2),
//           Padding(
//             padding: AppPaddings.sym16x12,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     widget.searchText,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: AppTextStyles.headingH3.copyWith(
//                         color:
//                             AppComponents.blockBlocktitleHeadingColorDefault),
//                   ),
//                 ),
//                 const RowSpacer(0.8),
//                 GestureDetector(
//                   onTap: () => AppBottomSheet.categorySort(context),
//                   child: SvgPicture.asset(
//                     AppSvgImages.sorting,
//                   ),
//                 ),
//                 const RowSpacer(1.6),
//                 InkWell(
//                     onTap: () => Filter.chooseFilter(context),
//                     child: SvgPicture.asset(AppSvgImages.filter)),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 38,
//             child: ListView.separated(
//               padding: AppPaddings.horizontal16,
//               scrollDirection: Axis.horizontal,
//               shrinkWrap: true,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () => {},
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         border: Border.all(
//                             width: 2,
//                             color: AppComponents
//                                 .taggroupTagInactiveBorderColorDefault),
//                         color: AppComponents.taggroupTagInactiveBgColorDefault),
//                     child: Padding(
//                       padding: AppPaddings.symmetric12x6,
//                       child: Row(
//                         children: [
//                           Text(
//                             filter[index],
//                             style: AppTextStyles.bodyM.copyWith(
//                                 color: AppComponents
//                                     .taggroupTagInactiveTextColorDefault),
//                           ),
//                           const RowSpacer(0.4),
//                           SvgPicture.asset(
//                             AppSvgImages.chevronDown,
//                             width: 16,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const RowSpacer(0.8),
//               itemCount: filter.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
