// import 'package:auto_route/auto_route.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
// import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/features/profile/logic/bloc/subscription_bloc/subscription_bloc.dart';
// import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
// import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
// import 'package:shimmer/shimmer.dart';

// class SubscriptionInfoPage extends StatefulWidget {
//   const SubscriptionInfoPage({super.key});

//   @override
//   State<SubscriptionInfoPage> createState() => _SubscriptionInfoPageState();
// }

// class _SubscriptionInfoPageState extends State<SubscriptionInfoPage> {
//   late SubscriptionBloc bloc;

//   @override
//   void initState() {
//     super.initState();
//     bloc = SubscriptionBloc(authRepository: sl());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         text: LocaleKeys.subscriptionInformation.tr(),
//         hasLeading: true,
//       ),
//       body: Consumer<ProfileVm>(
//         builder: (context, value, state) {
//           return BlocConsumer<SubscriptionBloc, SubscriptionState>(
//             bloc: bloc,
//             listener: (context, state) => state.maybeWhen(
//                 orElse: () => null,
//                 cancelSuccess: () {
//                   value.user?.data?.subscription?.status = 'cancelled';
//                   setState(() {});
//                   showCustomSheet(context, child: const SubscriptionCanceled());

//                   return null;
//                 }),
//             builder: (context, state) {
//               return Stack(
//                 children: [
//                   Padding(
//                     padding: AppPaddings.all,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Center(
//                           child: Image.asset(
//                             AppWebpImages.subscriptionLogo,
//                             height: 160,
//                           ),
//                         ),
//                         const ColumnSpacer(1),
//                         Text(
//                           ('${LocaleKeys.subscription.tr()} Prime ${LocaleKeys.active.tr()}')
//                               .toUpperCase(),
//                           style: GoogleFonts.forum(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xffEFE7D2),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const ColumnSpacer(0.8),
//                         Center(
//                           child: Text(
//                             LocaleKeys.benefitsAvailable.tr(),
//                             style: AppTextStyles.bodyL
//                                 .copyWith(color: AppColors.semanticFgSoft),
//                           ),
//                         ),
//                         const ColumnSpacer(1.6),
//                         ListView.separated(
//                           shrinkWrap: true,
//                           padding: AppPaddings.empty,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount:
//                               value.subscription?.data?.termInfos?.length ?? 0,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               padding: AppPaddings.all,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   color: AppComponents
//                                       .navmenuNavmenuelementBgColorDefault),
//                               child: Row(
//                                 children: [
//                                   CachedNetworkImage(
//                                     height: 32,
//                                     width: 32,
//                                     progressIndicatorBuilder:
//                                         (context, url, progress) =>
//                                             Shimmer.fromColors(
//                                       baseColor: AppComponents.shimmerBase,
//                                       highlightColor:
//                                           AppComponents.shimmerHighlight,
//                                       child: Container(
//                                         decoration: const BoxDecoration(
//                                           color: AppColors.primitiveNeutral0,
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(8)),
//                                         ),
//                                       ),
//                                     ),
//                                     imageUrl: value.subscription?.data
//                                             ?.termInfos?[index].bgImage ??
//                                         '',
//                                     imageBuilder: (context, placeholder) =>
//                                         Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(8)),
//                                         image: DecorationImage(
//                                           image: placeholder,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const RowSpacer(0.8),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           value.subscription?.data
//                                                   ?.termInfos?[index].name ??
//                                               'null',
//                                           style: AppTextStyles.bodyLStrong.copyWith(
//                                               color: AppComponents
//                                                   .navmenuNavmenuelementLabelColorDefault),
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 3,
//                                         ),
//                                         const ColumnSpacer(0.4),
//                                         Text(
//                                           value
//                                                   .subscription
//                                                   ?.data
//                                                   ?.termInfos?[index]
//                                                   .description ??
//                                               'null',
//                                           style: AppTextStyles.bodyM.copyWith(
//                                               color: AppComponents
//                                                   .navmenuNavmenuelementSubtitleColorDefault),
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 3,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             );
//                           },
//                           separatorBuilder: (BuildContext context, int index) =>
//                               const ColumnSpacer(0.8),
//                         ),
//                         const ColumnSpacer(2),
//                         value.user?.data?.subscription?.status == 'cancelled'
//                             ? Container(
//                                 padding: AppPaddings.all,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: AppComponents
//                                         .navmenuNavmenuelementBgColorDefault),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     Text(
//                                       LocaleKeys.youCancelledSubscription.tr(),
//                                       style: AppTextStyles.bodyLStrong.copyWith(
//                                           color: AppComponents
//                                               .notificationTitleColorDefault),
//                                     ),
//                                     const ColumnSpacer(0.4),
//                                     Text(
//                                       '${LocaleKeys.subscriptionPaidup.tr()} ${dayMonthYearByDot.format(value.user?.data?.subscription?.endAt ?? DateTime.now())}, ${LocaleKeys.afterThisPeriod.tr()} ',
//                                       style: AppTextStyles.bodyM.copyWith(
//                                           color: AppComponents
//                                               .notificationBodytextColorDefault),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : Container(
//                                 padding: AppPaddings.all,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: AppComponents
//                                         .navmenuNavmenuelementBgColorDefault),
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: [
//                                     Text(
//                                       LocaleKeys.subscriptionActive.tr(),
//                                       style: AppTextStyles.bodyLStrong.copyWith(
//                                           color: AppComponents
//                                               .notificationTitleColorDefault),
//                                     ),
//                                     const ColumnSpacer(0.4),
//                                     Text(
//                                       '${LocaleKeys.nextPaymentDate.tr()}: ${dayMonthYearByDot.format(value.user?.data?.subscription?.endAt ?? DateTime.now())}',
//                                       style: AppTextStyles.bodyM.copyWith(
//                                           color: AppComponents
//                                               .notificationBodytextColorDefault),
//                                     ),
//                                     // Text(
//                                     //   'Спишется автоматически с карты ',
//                                     //   style: AppTextStyles.bodyM.copyWith(
//                                     //       color: AppComponents.notificationBodytextColorDefault),
//                                     // ),
//                                     const ColumnSpacer(1.6),
//                                     GestureDetector(
//                                       onTap: () => showCustomSheet(
//                                         context,
//                                         child: CancelSubscription(bloc: bloc),
//                                       ),
//                                       child: Container(
//                                         color: AppColors.none,
//                                         child: Text(
//                                           LocaleKeys.cancelSubscription.tr(),
//                                           style: AppTextStyles.bodyL.copyWith(
//                                               color: AppComponents
//                                                   .functionbuttonAccentTextColorDefault),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                       ],
//                     ),
//                   ),
//                   state.maybeWhen(
//                     orElse: () => const SizedBox.shrink(),
//                     loading: () => Container(
//                       color:
//                           AppColors.primitiveNeutralwarm1000.withOpacity(0.3),
//                       child: const CircleLoader(),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class CancelSubscription extends StatelessWidget {
//   const CancelSubscription({
//     super.key,
//     required this.bloc,
//   });
//   final SubscriptionBloc bloc;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: const BoxDecoration(
//             color: AppColors.semanticBgSurface1,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//         child: Padding(
//           padding: AppPaddings.horizontal16,
//           child: SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const ColumnSpacer(0.8),
//                 const CustomBar(),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => context.router.pop(),
//                       child: SvgPicture.asset(AppSvgImages.chevronBack),
//                     ),
//                   ],
//                 ),
//                 const ColumnSpacer(1.6),
//                 Image.asset(
//                   AppWebpImages.cancelSubscription,
//                   height: 128,
//                 ),
//                 const ColumnSpacer(0.8),
//                 Text(
//                   '${LocaleKeys.cancelSubscription.tr()} Prime?',
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.headingH2
//                       .copyWith(color: AppColors.semanticFgDefault),
//                 ),
//                 const ColumnSpacer(0.8),
//                 Text(
//                   LocaleKeys.accessWillEnd.tr(),
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.bodyL
//                       .copyWith(color: AppColors.primitiveNeutral300),
//                 ),
//                 const ColumnSpacer(1.6),
//                 CustomButton(
//                   text: LocaleKeys.yesCancel.tr(),
//                   onPressed: () => context.router.pop().then(
//                         (_) => bloc.add(
//                           SubscriptionEvent.cancelSubscription(
//                             id: context
//                                 .read<ProfileVm>()
//                                 .user!
//                                 .data!
//                                 .subscription!
//                                 .id!,
//                           ),
//                         ),
//                       ),

//                   // onPressed: () {
//                   //   // context.router.pop();
//                   //   // context.read<ProfileVm>().user?.data?.subscription =
//                   //   //     null;
//                   //   // context.router.pop().then((value) => showCustomSheet(
//                   //   //     context,
//                   //   //     child: const SubscriptionCanceled()));
//                   //   // Navigator.pop(context);
//                   //   // showCustomSheet(context,
//                   //   //     child: const SubscriptionCanceled());
//                   // },
//                 ),
//                 const ColumnSpacer(1.6),
//                 CustomButton(
//                   text: LocaleKeys.noLeaveIt.tr(),
//                   onPressed: () {
//                     context.router.pop();
//                   },
//                   buttonColor:
//                       AppComponents.buttongroupButtonGrayBgColorDefault,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class SubscriptionCanceled extends StatelessWidget {
//   const SubscriptionCanceled({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           color: AppColors.semanticBgSurface1,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//       child: BottomSheetContent(
//         title: LocaleKeys.subscriptionCanceled.tr(),
//         text: LocaleKeys.thanksForUsingPrime.tr(),
//         buttonText: LocaleKeys.close.tr(),
//         icon: AppWebpImages.subscriptionCanceled,
//       ),
//     );
//   }
// }
