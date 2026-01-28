// import 'dart:ui';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:qr_pay_app/src/core/extensions/context.dart';
// import 'package:qr_pay_app/src/core/resources/app_colors.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
// import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';
// import 'package:qr_pay_app/src/features/home/widgets/work_schedule.dart';

// class RestaurantInfo extends StatelessWidget {
//   const RestaurantInfo({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 100),
//       child: IntrinsicHeight(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
//           child: Container(
//             decoration: const BoxDecoration(
//                 color: AppColors.semanticBgSurface1,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
//             child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   // controller: scrollController,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       //const ColumnSpacer(2.4),
//                       // Image.asset(
//                       //   minImages ?? AppImages.error,
//                       //   height: 140,
//                       //   width: 160,
//                       // ),
//                       const ColumnSpacer(2.4),
//                       Padding(
//                         padding: AppPaddings.horizontal16,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SvgPicture.asset(AppSvgImages.chevronBack),
//                             Text(
//                               'О заведении',
//                               style: AppTextStyles.headingH2.copyWith(
//                                   color: AppComponents
//                                       .modalModalcontentTextcontentTitleColorDefault),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(
//                               width: 24,
//                             )
//                           ],
//                         ),
//                       ),
//                       const ColumnSpacer(2),
//                       Padding(
//                         padding: AppPaddings.horizontal16,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                               color: AppColors.semanticBgSurface1,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(16))),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               const ColumnSpacer(1.2),
//                               Padding(
//                                 padding: AppPaddings.horizontal16,
//                                 child: SectionTitle(
//                                   title: LocaleKeys.addressContacts.tr(),
//                                   padding: false,
//                                 ),
//                               ),
//                               const ColumnSpacer(2),
//                               Padding(
//                                 padding: AppPaddings.horizontal16,
//                                 child: Row(
//                                   children: [
//                                     SvgPicture.asset(AppSvgImages.location),
//                                     const RowSpacer(0.8),
//                                     Flexible(
//                                       child: Text(
//                                         'пр. Абылай хана, 55, г. Алматы',
//                                         style: AppTextStyles.bodyL.copyWith(
//                                             color: AppComponents
//                                                 .navbarTitleColorDefault),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // const ColumnSpacer(1.6),
//                               Padding(
//                                 padding: AppPaddings.all,
//                                 child: Image.network(
//                                     'https://s3-alpha-sig.figma.com/img/685d/5d4b/ed61df75a65eea257166a2dc6461fda6?Expires=1738540800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ViHiPUfu582AkU3SdUeVx68o~yGBdpFGfYSvlONzOWWc06L~e7Q1OH6Wd9q95Q49ubtUileI4RQEaVDx8x5qa5uid5rC2WohrXRVKDtncie8PrwkEj5NmbfxRVPVS1dnxF-~u2g4pydYzSO~sL0qvJxqtXLbqKjpslRRdQX92qNtZqNVkB-Kt-bHyv4qZZ70uiE9cuzCVkxFpO0lHjRCXZk17euGkerDaeYsmStgNQo6vUY~3r~om8OFqR-ER3aeG3KzFKfPWETChU0ryLJvebbuM1dtkjJ3JA-QGCEPtR8eKHnDcbLPq0LKm5HhhNDfOBitK9HIu8h6NB67tgriGw__'),
//                               ),
//                               // MapWidgte(viewModel: viewModel),
//                               const CustomDivider(),
//                               ListItem1(
//                                 title: 'Время работы: 10:00 - 23:00',
//                                 //'${LocaleKeys.workingHours.tr()} ${item.data?.graphicWorks?[viewModel.now.weekday - 1].startTime} - ${item.data?.graphicWorks?[viewModel.now.weekday - 1].endTime}',
//                                 leftIcon: AppSvgImages.timeCircle,
//                                 onTap: () => showCustomSheet(
//                                   context,
//                                   child: const WorkSchedule(
//                                     graphicWorks: [],
//                                   ),
//                                 ),
//                               ),
//                               const CustomDivider(),
//                               ListItem1(
//                                 title: '77777777777',
//                                 leftIcon: AppSvgImages.call,
//                                 onTap: () =>
//                                     LaunchInBrowserUtil.launchUrl('tel://'),
//                               ),
//                               const ColumnSpacer(0.8),
//                               Padding(
//                                 padding: AppPaddings.horizontal16,
//                                 child: Text(
//                                   'Описание',
//                                   //textAlign: TextAlign.center,
//                                   style: AppTextStyles.headingH3.copyWith(
//                                       color: AppComponents
//                                           .blockBlocktitleHeadingColorDefault),
//                                 ),
//                               ),
//                               const ColumnSpacer(1.2),
//                               Padding(
//                                 padding: AppPaddings.horizontal16,
//                                 child: Text(
//                                   'TARY Europe City расположен в живописном ЖК Europe City на ул. Акмешит. Это удобное и уютное место для встреч деловых людей и для жителей города. Это идеальное заведение для проведения бизнес-встреч, где можно обсудить важные вопросы в комфортной и профессиональной обстановке. Также кофейня прекрасно подходит для семейных посиделок и уютных встреч с близкими. В Тары вы сможете насладиться разнообразной кухней, а также выбрать из великолепного ассортимента горячих и холодных напитков, что сделает любое посещение приятным и запоминающимся.',
//                                   style: AppTextStyles.bodyL.copyWith(
//                                       color: AppComponents
//                                           .listitemTitleColorDefault
//                                       //  AppComponents
//                                       //     .modalModalcontentTextcontentSubtitleColorDefault
//                                       ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),

//                       const ColumnSpacer(2),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: context.mediaQuery.size.width,
//                   color: AppColors.none,
//                   child: const Column(
//                     children: [
//                       ColumnSpacer(0.8),
//                       CustomBar(),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
