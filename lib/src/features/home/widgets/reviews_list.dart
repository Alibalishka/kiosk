// import 'package:auto_route/auto_route.dart';
// import 'package:qr_pay_app/src/core/resources/app_components.dart';
// import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
// import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
// import 'package:qr_pay_app/src/core/resources/resources.dart';
// import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
// import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
// import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
// import 'package:qr_pay_app/src/features/app/router/app_router.dart';
// import 'package:qr_pay_app/src/features/home/logic/models/responses/reviews_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/svg.dart';

// class ReviewsWidget extends StatelessWidget {
//   final ReviewsModel? reviewsModel;
//   const ReviewsWidget({super.key, this.reviewsModel});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       padding: AppPaddings.empty,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => Padding(
//         padding: AppPaddings.sym16x12,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         reviewsModel?.data?[index].user?.name ?? '',
//                         style: AppTextStyles.bodyMStrong.copyWith(
//                             color: AppComponents.listitemTitleColorDefault),
//                       ),
//                       const RowSpacer(0.8),
//                       RatingBar.builder(
//                         initialRating: reviewsModel?.data?[index].rating?.rating
//                                 ?.toDouble() ??
//                             1,
//                         minRating: 1,
//                         direction: Axis.horizontal,
//                         allowHalfRating: true,
//                         itemCount: 5,
//                         itemSize: 16,
//                         ignoreGestures: true,
//                         itemPadding: const EdgeInsets.only(right: 3.5),
//                         itemBuilder: (context, _) => SvgPicture.asset(
//                           AppSvgImages.star,
//                           color: AppComponents
//                               .ratingRatingstarFullIconColorDefault,
//                         ),
//                         onRatingUpdate: (rating) {},
//                       ),
//                       const Spacer(),
//                       Text(
//                         '${reviewsModel?.data?[index].createdAt}',
//                         style: AppTextStyles.bodyM.copyWith(
//                             color: AppComponents.listitemSubtitleColorDefault),
//                       ),
//                     ],
//                   ),
//                   const ColumnSpacer(0.4),
//                   // Text(
//                   //   'Бедро говяжье от Shas охлажденный кг',
//                   //   style: AppTextStyles.bodyM.copyWith(
//                   //       color: AppComponents.listitemSubtitleColorDefault),
//                   // ),
//                   // const ColumnSpacer(0.4),
//                   Text(
//                     '${reviewsModel?.data?[index].comment}',
//                     style: AppTextStyles.bodyM.copyWith(
//                         color: AppComponents.listitemBodytextColorDefault),
//                   ),
//                   const ColumnSpacer(0.8),
//                   reviewsModel?.data?[index].images?.isEmpty ?? false
//                       ? const SizedBox.shrink()
//                       : SizedBox(
//                           height: 64,
//                           child: ListView.separated(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (BuildContext context, int indexs) {
//                                 return GestureDetector(
//                                   onTap: () => context.router
//                                       .push(ProductImagesWidgetRoute()),
//                                   child: Container(
//                                     height: 64,
//                                     width: 80,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: NetworkImage(
//                                               reviewsModel?.data?[index]
//                                                       .images?[indexs].path ??
//                                                   'https://content3.flowwow-images.com/data/blog/23/1684380842_94662323.png',
//                                             ),
//                                             fit: BoxFit.cover),
//                                         borderRadius: BorderRadius.circular(12),
//                                         color:
//                                             AppComponents.blockBgColorDefault),
//                                   ),
//                                 );
//                               },
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                                       const RowSpacer(0.8),
//                               itemCount:
//                                   reviewsModel?.data?[index].images?.length ??
//                                       0),
//                         ),
//                   const ColumnSpacer(1.6),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       separatorBuilder: (context, index) => const CustomDivider(),
//       itemCount: reviewsModel?.data?.length ?? 0,
//     );
//   }
// }
