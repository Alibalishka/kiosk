// import 'package:auto_route/auto_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_search_bar.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
// import 'package:qr_pay_app/src/features/profile/pages/address/address_vm.dart';
// import 'package:qr_pay_app/src/features/profile/widgets/map_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class AddressMap extends StatefulWidget {
//   final AddressVm viewModel;
//   const AddressMap({super.key, required this.viewModel});

//   @override
//   State<AddressMap> createState() => _AddressMapState();
// }

// class _AddressMapState extends State<AddressMap>
//     with ViewModelMixin<AddressMap, AddressVm> {
//   @override
//   AddressVm get viewModel => widget.viewModel;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const CustomAppBar(
//         text: 'Добавить адрес',
//         hasLeading: true,
//       ),
//       body: Stack(
//         children: [
//           MapScreen(viewModel: viewModel),
//           viewModel.isShowSearchResult
//               ? Padding(
//                   padding: const EdgeInsets.only(top: 66),
//                   child: Container(
//                     color: AppComponents.dropdownmenuPrimaryBgColorDefault,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: ListView.separated(
//                         itemBuilder: (context, index) => GestureDetector(
//                           onTap: () async {
//                             viewModel.getLatLong(viewModel.resultSearch[index]);
//                             context.router.push(AddAddressPageRoute(
//                               viewModel: viewModel,
//                               address: viewModel.resultSearch[index],
//                             ));
//                           },
//                           child: Container(
//                             color: Colors.transparent,
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     viewModel.resultSearch[index],
//                                     style: AppTextStyles.bodyL,
//                                   ),
//                                 ),
//                                 SvgPicture.asset(AppSvgImages.chevronForward)
//                               ],
//                             ),
//                           ),
//                         ),
//                         separatorBuilder: (context, index) =>
//                             const ColumnSpacer(2),
//                         itemCount: viewModel.resultSearch.length,
//                       ),
//                     ),
//                   ),
//                 )
//               : Container(),
//           Positioned(
//             child: CustomSearchBar2(
//               controller: viewModel.searchController,
//               onChanged: (_) => viewModel.search(),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromRGBO(0, 0, 0, 0.15),
//               spreadRadius: 0,
//               blurRadius: 10,
//               offset: Offset(0, 1),
//             ),
//           ],
//           color: AppColors.semanticBgSurface1,
//         ),
//         child: Padding(
//           padding: AppPaddings.all,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               CustomButton(
//                 text: LocaleKeys.save.tr(),
//                 onPressed: () => context.router
//                     .push(AddAddressPageRoute(viewModel: viewModel)),
//               ),
//               const ColumnSpacer(1.2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
