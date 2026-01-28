// import 'package:auto_route/auto_route.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/modal_grabber_bar.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/title_text_field.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class Filter {
//   static Future<dynamic> chooseFilter(BuildContext context) {
//     return showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//         builder: (BuildContext context) {
//           return DraggableScrollableSheet(
//               initialChildSize: 0.9,
//               expand: true,
//               builder: (context, scrollController) {
//                 return const FilterSheetWidget();
//               });
//         });
//   }
// }

// class FilterSheetWidget extends StatefulWidget {
//   const FilterSheetWidget({
//     super.key,
//   });

//   @override
//   State<FilterSheetWidget> createState() => _FilterSheetWidgetState();
// }

// class _FilterSheetWidgetState extends State<FilterSheetWidget> {
//   late TextEditingController firstController;
//   late TextEditingController secondController;
//   int firstValue = 1;
//   int secondValue = 25000;
//   List<String> filters = [
//     'Mfood',
//     'Алель',
//     'EatFood',
//     'Бахча',
//     'Alfoor',
//     'Dos',
//     'Mfood',
//     'EatFood',
//     'EatFood',
//     'EatFood',
//   ];
//   List<String> chosenFilters = [];
//   List<String> isSelected = [];
//   List<String> brands = [
//     'Mfood',
//     'Алель',
//     'EatFood',
//     'Бахча',
//     'Alfoor',
//     'Dos',
//     'Mfood',
//     'EatFood',
//     'EatFood',
//     'EatFood',
//   ];
//   List<String> countries = [
//     'Казахстан',
//     'Беларусь',
//     'Россия',
//   ];
//   List<String> halal = [
//     'Да',
//     'Нет',
//   ];

//   List<String> type = [
//     'Курица',
//     'Говядина',
//     'Индейка',
//     'Баранина',
//     'Утка',
//     'Свинина',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     firstController = TextEditingController(text: firstValue.toString());
//     secondController = TextEditingController(text: secondValue.toString());
//   }

//   @override
//   void dispose() {
//     firstController.dispose();
//     secondController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           color: AppColors.semanticBgSurface1,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: AppPaddings.horizontal16,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const ColumnSpacer(0.8),
//               const ModalGrabberBar(),
//               const ColumnSpacer(2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => context.router.pop(),
//                     child: SvgPicture.asset(
//                       AppSvgImages.closeLarge,
//                     ),
//                   ),
//                   Text(
//                     'Фильтры',
//                     style: AppTextStyles.headingH3
//                         .copyWith(color: AppColors.semanticFgDefault),
//                   ),
//                   Text(
//                     'Сбросить',
//                     style: AppTextStyles.bodyM.copyWith(
//                         color:
//                             AppComponents.functionbuttonAccentTextColorDefault),
//                   ),
//                 ],
//               ),
//               const ColumnSpacer(1.2),
//               //
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Категория',
//                         style: AppTextStyles.headingH4.copyWith(
//                           color: AppComponents.tileTitleColorDefault,
//                         ),
//                       ),
//                       Text(
//                         'Мясо и птица',
//                         style: AppTextStyles.bodyM.copyWith(
//                             color: const Color.fromARGB(255, 113, 114, 128)),
//                       )
//                     ],
//                   ),
//                   const RowSpacer(0.8),
//                   SvgPicture.asset(
//                     AppSvgImages.chevronForward,
//                     color: AppComponents
//                         .navmenuNavmenuelementIconrightColorDefault,
//                   )
//                 ],
//               ),
//               const ColumnSpacer(2.4),
//               const BodyText(placeholder: 'Цена'),
//               const ColumnSpacer(0.8),
//               Row(
//                 children: [
//                   Expanded(
//                       child: TitleTextField(
//                           controller: firstController,
//                           placeholder: 'от 30 ₸',
//                           hasBorderColor: false,
//                           title: '')),
//                   const RowSpacer(1.2),
//                   Expanded(
//                       child: TitleTextField(
//                           controller: secondController,
//                           placeholder: 'до 2000 ₸',
//                           hasBorderColor: false,
//                           title: ''))
//                 ],
//               ),
//               SliderTheme(
//                 data: SliderTheme.of(context).copyWith(
//                   trackHeight: 3.0,
//                 ),
//                 child: RangeSlider(
//                   activeColor: AppComponents.sliderPrimaryHandleBgColorDefault,
//                   inactiveColor:
//                       AppComponents.sliderPrimaryTrackBgColorDisabled,
//                   values: RangeValues(
//                     firstValue.toDouble(),
//                     secondValue.toDouble(),
//                   ),
//                   min: 0,
//                   max: 30000,
//                   onChanged: (RangeValues values) {
//                     setState(() {
//                       firstValue = values.start.toInt();
//                       secondValue = values.end.toInt();
//                       firstController.text = firstValue.toString();
//                       secondController.text = secondValue.toString();
//                     });
//                   },
//                 ),
//               ),
//               const ColumnSpacer(1.6),
//               const BodyText(placeholder: 'Поставщики'),
//               const ColumnSpacer(1.2),
//               TagGroup(items: filters, chosenFilters: chosenFilters),
//               const ColumnSpacer(1.6),
//               WatchAll(
//                 onTap: () {
//                   context.router.push(FilterWatchAllRoute(
//                       list: filters, isSelected: isSelected));
//                 },
//               ),
//               const ColumnSpacer(3.2),
//               const BodyText(placeholder: 'Бренды'),
//               const ColumnSpacer(1.2),
//               TagGroup(items: brands, chosenFilters: chosenFilters),
//               const ColumnSpacer(1.6),
//               GestureDetector(
//                 onTap: () {},
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Посмотреть все',
//                       style: AppTextStyles.bodyL
//                           .copyWith(color: AppColors.primitiveBrand500),
//                     ),
//                     SvgPicture.asset(
//                       AppSvgImages.chevronForward,
//                       color: AppColors.primitiveBrand500,
//                     ),
//                   ],
//                 ),
//               ),
//               const ColumnSpacer(3.2),
//               const BodyText(placeholder: 'Страны'),
//               const ColumnSpacer(1.2),
//               TagGroup(items: countries, chosenFilters: chosenFilters),
//               const ColumnSpacer(3.2),
//               const BodyText(placeholder: 'Халал'),
//               const ColumnSpacer(1.2),
//               TagGroup(items: halal, chosenFilters: chosenFilters),
//               const ColumnSpacer(3.2),
//               const BodyText(placeholder: 'Вид'),
//               const ColumnSpacer(1.2),
//               TagGroup(items: type, chosenFilters: chosenFilters),
//               const ColumnSpacer(1.6),
//               const WatchAll(),
//               const ColumnSpacer(2.4),
//               CustomButton(
//                   text: 'Применить',
//                   onPressed: () {
//                     context.router.pop();
//                   }),
//               const ColumnSpacer(3.6),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WatchAll extends StatelessWidget {
//   final Function()? onTap;
//   const WatchAll({
//     super.key,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Посмотреть все',
//             style: AppTextStyles.bodyL
//                 .copyWith(color: AppColors.primitiveBrand500),
//           ),
//           SvgPicture.asset(
//             AppSvgImages.chevronForward,
//             color: AppColors.primitiveBrand500,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TagGroup extends StatefulWidget {
//   const TagGroup({
//     super.key,
//     required this.items,
//     required this.chosenFilters,
//   });

//   final List<String> items;
//   final List<String> chosenFilters;

//   @override
//   State<TagGroup> createState() => _TagGroupState();
// }

// class _TagGroupState extends State<TagGroup> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: [
//         for (int i = 0; i < widget.items.length; i++)
//           FittedBox(
//             child: GestureDetector(
//               onTap: () {
//                 if (widget.chosenFilters.contains(widget.items[i])) {
//                   widget.chosenFilters.remove(widget.items[i]);
//                 } else {
//                   widget.chosenFilters.add(widget.items[i]);
//                 }
//                 setState(() {});
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 8,
//                   horizontal: 14,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   border: Border.all(
//                       width: 2,
//                       color: widget.chosenFilters.contains(widget.items[i])
//                           ? AppComponents
//                               .taggroupTagFilledActiveBorderColorDefault
//                           : AppComponents
//                               .taggroupTagInactiveBorderColorDefault),
//                 ),
//                 child: Center(
//                   child: Text(widget.items[i],
//                       style: AppTextStyles.bodyM.copyWith(
//                           color: AppComponents
//                               .taggroupTagFilledActiveTextColorDefault)),
//                 ),
//               ),
//             ),
//           )
//       ],
//     );
//   }
// }

// class BodyText extends StatelessWidget {
//   final String placeholder;
//   const BodyText({
//     super.key,
//     required this.placeholder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       placeholder,
//       style: AppTextStyles.bodyL
//           .copyWith(color: AppComponents.listitemBodytextColorDefault),
//     );
//   }
// }
