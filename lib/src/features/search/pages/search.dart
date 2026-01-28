// import 'package:auto_route/auto_route.dart';
// import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/keyboard_overlay_focus_widget.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/not_authorized_view.dart';
// import 'package:qr_pay_app/src/features/search/logic/bloc/search/search_bloc.dart';
// import 'package:qr_pay_app/src/features/search/pages/search_vm.dart';
// import 'package:qr_pay_app/src/features/search/widget/shimmer_search.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   late SearchBloc _searchBloc;
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     context.read<SearchVM>().returnWord();
//     super.initState();
//   }

//   bool last = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Consumer<SearchVM>(
//         builder: (_, valueVM, child) => Scaffold(
//           backgroundColor: AppComponents.blockBgColorDefault,
//           body: Stack(
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     height: 130,
//                     decoration: const BoxDecoration(
//                       color: AppColors.semanticBgSurface1,
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(16),
//                           bottomRight: Radius.circular(16)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromRGBO(0, 0, 0, 0.2),
//                           spreadRadius: 1,
//                           blurRadius: 5,
//                           offset: Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         const ColumnSpacer(8),
//                         Padding(
//                           padding: AppPaddings.horizontal16,
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   FocusManager.instance.primaryFocus?.unfocus();
//                                   context.router.pop();
//                                 },
//                                 child: SvgPicture.asset(
//                                   AppSvgImages.iconLeft,
//                                 ),
//                               ),
//                               const RowSpacer(1.6),
//                               Flexible(
//                                 child: CupertinoSearchTextField(
//                                   placeholder: 'Поиск',
//                                   controller: searchController,
//                                   autofocus: true,
//                                   style: AppTextStyles.bodyL.copyWith(
//                                     color: AppComponents
//                                         .inputSecondaryPlaceholdertextColorDefault,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.semanticBgSurface1,
//                                     border: Border.all(
//                                         color: AppComponents
//                                             .inputSecondaryBorderColorDefault),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   onChanged: (value) {
//                                     _searchBloc = SearchBloc(
//                                         searchRepository: sl())
//                                       ..add(
//                                           SearchEvent.started(keyword: value));
//                                     setState(() {});
//                                   },
//                                   onSubmitted: (value) {
//                                     _searchBloc = SearchBloc(
//                                         searchRepository: sl())
//                                       ..add(
//                                           SearchEvent.started(keyword: value));
//                                     valueVM.addWord(value);
//                                     setState(() {});
//                                   },
//                                 ),
//                               ),
//                               const RowSpacer(1.6),
//                               InkWell(
//                                 onTap: () => context.router
//                                     .push(const BarcodeWidgetRoute()),
//                                 child: SvgPicture.asset(
//                                   AppSvgImages.barcode,
//                                   color: AppColors.semanticFgDefault,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   searchController.text.isEmpty
//                       ? valueVM.savedWord.isNotEmpty
//                           ? Expanded(
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   children: [
//                                     const ColumnSpacer(2.4),
//                                     Padding(
//                                       padding: AppPaddings.horizontal12,
//                                       child: Row(
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               'Вы недавно искали',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: AppTextStyles.headingH3
//                                                   .copyWith(
//                                                       color: AppComponents
//                                                           .blockBlocktitleHeadingColorDefault),
//                                             ),
//                                           ),
//                                           InkWell(
//                                             onTap: () => valueVM.clearAll(),
//                                             child: Text(
//                                               'Очистить',
//                                               style: AppTextStyles.bodyM.copyWith(
//                                                   color: AppComponents
//                                                       .functionbuttonPrimaryTextColorDefault),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const ColumnSpacer(0.8),
//                                     MediaQuery.removePadding(
//                                       context: context,
//                                       removeTop: true,
//                                       child: ListView(
//                                         physics:
//                                             const NeverScrollableScrollPhysics(),
//                                         shrinkWrap: true,
//                                         children: List.generate(
//                                           valueVM.savedWord.length,
//                                           (index) => Padding(
//                                             padding: AppPaddings.sym16x12,
//                                             child: InkWell(
//                                               onTap: () => context.router.push(
//                                                   ResultPageRoute(
//                                                       searchText: valueVM
//                                                           .savedWord[index])),
//                                               child: Container(
//                                                 color: AppColors.none,
//                                                 child: Row(
//                                                   children: [
//                                                     SvgPicture.asset(
//                                                         AppSvgImages
//                                                             .timeCircle),
//                                                     const RowSpacer(0.8),
//                                                     Expanded(
//                                                       child: Text(
//                                                         valueVM
//                                                             .savedWord[index],
//                                                         style: AppTextStyles
//                                                             .bodyM
//                                                             .copyWith(
//                                                                 color: AppComponents
//                                                                     .dropdownmenuPrimaryItemTextColorNotSelectedDefault),
//                                                       ),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () => valueVM
//                                                           .deleteByIndex(index),
//                                                       child: SvgPicture.asset(
//                                                           AppSvgImages
//                                                               .closeLarge),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           : const Expanded(
//                               child: NotAutorizedView(
//                                 title: 'История поиска пуста',
//                                 subtitle:
//                                     'Здесь будет отображаться ваша недавняя история поиска',
//                                 image: AppImages.emptySearch,
//                                 button: false,
//                                 buttonText: '',
//                               ),
//                             )
//                       : BlocProvider<SearchBloc>.value(
//                           value: _searchBloc,
//                           child: BlocBuilder<SearchBloc, SearchState>(
//                             builder: (context, state) => state.when(
//                               initial: () =>
//                                   const Expanded(child: ShimmerSearch()),
//                               success: (searchItem) => searchItem
//                                           .data?.items?.length ==
//                                       0
//                                   ? const Expanded(
//                                       child: NotAutorizedView(
//                                         title: 'Ничего не найдено',
//                                         subtitle: 'Попробуйте изменить запрос',
//                                         image: AppImages.emptySearch,
//                                         button: false,
//                                         buttonText: '',
//                                       ),
//                                     )
//                                   : Expanded(
//                                       child: SingleChildScrollView(
//                                         child: Column(
//                                           children: [
//                                             const ColumnSpacer(2.4),
//                                             MediaQuery.removePadding(
//                                               context: context,
//                                               removeTop: true,
//                                               child: ListView(
//                                                 physics:
//                                                     const NeverScrollableScrollPhysics(),
//                                                 shrinkWrap: true,
//                                                 children: List.generate(
//                                                   searchItem.data?.items
//                                                           ?.length ??
//                                                       0,
//                                                   (index) => Padding(
//                                                     padding:
//                                                         AppPaddings.sym16x12,
//                                                     child: InkWell(
//                                                       onTap: () => context
//                                                           .router
//                                                           .push(ResultPageRoute(
//                                                               searchText: searchItem
//                                                                       .data
//                                                                       ?.items?[
//                                                                           index]
//                                                                       .name ??
//                                                                   searchController
//                                                                       .text)),
//                                                       child: Container(
//                                                         color: AppColors.none,
//                                                         child: Row(
//                                                           children: [
//                                                             SvgPicture.asset(
//                                                               AppSvgImages
//                                                                   .search,
//                                                               width: 24,
//                                                             ),
//                                                             const RowSpacer(
//                                                                 0.8),
//                                                             Expanded(
//                                                               child: Text(
//                                                                 searchItem
//                                                                         .data
//                                                                         ?.items?[
//                                                                             index]
//                                                                         .name ??
//                                                                     '',
//                                                                 overflow:
//                                                                     TextOverflow
//                                                                         .ellipsis,
//                                                                 style: AppTextStyles
//                                                                     .bodyM
//                                                                     .copyWith(
//                                                                         color: AppComponents
//                                                                             .dropdownmenuPrimaryItemTextColorNotSelectedDefault),
//                                                               ),
//                                                             ),
//                                                             const RowSpacer(
//                                                                 0.8),
//                                                             SvgPicture.asset(
//                                                                 AppSvgImages
//                                                                     .chevronForwardDisable),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                               error: (errorText) =>
//                                   Center(child: Text(errorText)),
//                             ),
//                           ),
//                         ),
//                 ],
//               ),
//               const KeyboardOverlayFocusWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
