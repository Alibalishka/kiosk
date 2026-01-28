import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/promotions_model.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandsWidget extends StatefulWidget {
  final Promotions? promotions;
  final ProfileVm? profileVm;

  const BrandsWidget({super.key, this.promotions, this.profileVm});

  @override
  State<BrandsWidget> createState() => _BrandsWidgetState();
}

class _BrandsWidgetState extends State<BrandsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        padding: AppPaddings.horizontal16,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedCard(
            child: Material(
              color: AppColors.semanticBgSurface1,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: GestureDetector(
                onTap: () {
                  showCustomSheet(
                    context,
                    child: PromotionsSheet(
                      name: widget.promotions?.data?[index].name,
                      description: widget.promotions?.data?[index].description,
                      minDescription:
                          widget.promotions?.data?[index].minDescription,
                      minImages: widget.promotions?.data?[index].image,
                      viewModel: widget.profileVm,
                      goto: widget.promotions?.data?[index].goto,
                    ),
                  );
                },
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width / 1.12,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Shimmer.fromColors(
                        baseColor: AppComponents.shimmerBase,
                        highlightColor: AppComponents.shimmerHighlight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primitiveNeutral0,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      imageUrl: widget.promotions?.data?[index].image ?? '',
                      imageBuilder: (context, placeholder) => Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                image: placeholder,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.primitiveNeutralwarm1000
                                      .withOpacity(0.85),
                                  AppColors.none,
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 20,
                      bottom: 20,
                      right: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.promotions?.data?[index].name ?? '',
                            style: AppTextStyles.headingH3.copyWith(
                                color: AppComponents
                                    .adbannergroupAdbannerDarkSubtitleColorDefault,
                                height: 1.2),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          const ColumnSpacer(0.6),
                          Text(
                            widget.promotions?.data?[index].minDescription ??
                                '',
                            style: AppTextStyles.bodyS.copyWith(
                                color: AppComponents
                                    .adbannergroupAdbannerDarkSubtitleColorDefault,
                                height: 1.3),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const RowSpacer(0.8),
        itemCount: widget.promotions?.data?.length ?? 0,
      ),
    );
  }
}

class PromotionsSheet extends StatelessWidget {
  final Goto? goto;
  final String? name;
  final String? description;
  final String? minDescription;
  final String? minImages;
  // final SubscriptionVm? viewModel;
  final viewModel;
  final bool close;

  const PromotionsSheet({
    super.key,
    this.goto,
    this.name,
    this.description,
    this.minDescription,
    this.minImages,
    this.viewModel,
    this.close = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileVm>(
      builder: (context, value, state) {
        ScrollController scrollController = ScrollController();
        return Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.semanticBgSurface1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ColumnSpacer(2.4),
                      // Image.asset(
                      //   minImages ?? AppWebpImages.error,
                      //   height: 140,
                      //   width: 160,
                      // ),
                      Padding(
                        padding: AppPaddings.horizontal16,
                        child: CachedNetworkImage(
                          height: 150,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Shimmer.fromColors(
                            baseColor: AppComponents.shimmerBase,
                            highlightColor: AppComponents.shimmerHighlight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primitiveNeutral0,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          imageUrl: minImages ?? '',
                          imageBuilder: (context, placeholder) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                image: placeholder,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const ColumnSpacer(2),
                      Padding(
                        padding: AppPaddings.horizontal16,
                        child: Text(
                          name ?? '',
                          style: AppTextStyles.headingH2.copyWith(
                              color: AppComponents
                                  .modalModalcontentTextcontentTitleColorDefault),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const ColumnSpacer(0.8),
                      Center(
                        child: Text(
                          minDescription ?? '',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyL.copyWith(
                              color: AppComponents
                                  .modalModalcontentTextcontentSubtitleColorDefault),
                        ),
                      ),
                      description != null
                          ? const ColumnSpacer(1.2)
                          : const SizedBox.shrink(),
                      Padding(
                        padding: AppPaddings.horizontal16,
                        child: Text(
                          description ?? '',
                          style: AppTextStyles.bodyL.copyWith(
                              color: AppComponents
                                  .modalModalcontentTextcontentTitleColorDefault
                              //  AppComponents
                              //     .modalModalcontentTextcontentSubtitleColorDefault
                              ),
                        ),
                      ),
                      if (goto?.type == GotoType.url ||
                          goto?.type == GotoType.itemId)
                        Padding(
                          padding: AppPaddings.all,
                          child: CustomButton(
                            text: getBtnText(context),
                            onPressed: () {
                              // log(context.locale.languageCode);
                              if (goto?.type == GotoType.url) {
                                LaunchInBrowserUtil.launchUrl(goto?.url ?? '');
                              } else if (goto?.type == GotoType.itemId) {
                                context.router.push(
                                  DetailProviderRoute(
                                      id: int.parse(goto?.itemId ?? '0')),
                                );
                              }
                            },
                          ),
                        ),
                      // close == true
                      //     ? Padding(
                      //         padding: AppPaddings.sym16x20,
                      //         child: CustomButton(
                      //             text: LocaleKeys.close.tr(),
                      //             onPressed: () => context.router.pop()),
                      //       )
                      //     : value.user?.data?.subscription == null
                      //         ? Padding(
                      //             padding: AppPaddings.all,
                      //             child: CustomButton(
                      //               text: LocaleKeys.learnMore.tr(),
                      //               onPressed: () {
                      //                 if (minDescription
                      //                         ?.contains('Реферальная') ??
                      //                     false) {
                      //                   if (sl<ITokenStorage>()
                      //                           .getToken()
                      //                           ?.isNotEmpty ??
                      //                       false) {
                      //                     context.router.push(
                      //                       ReferralProgramRoute(
                      //                         userId: context
                      //                                 .read<ProfileVm>()
                      //                                 .user
                      //                                 ?.data
                      //                                 ?.id ??
                      //                             0,
                      //                         promocode: context
                      //                                 .read<ProfileVm>()
                      //                                 .user
                      //                                 ?.data
                      //                                 ?.refCode ??
                      //                             '',
                      //                       ),
                      //                     );
                      //                   } else {
                      //                     showModalBottomSheet(
                      //                       context: context,
                      //                       isScrollControlled: true,
                      //                       isDismissible: true,
                      //                       useRootNavigator: true,
                      //                       backgroundColor: AppComponents
                      //                           .modalBgColorDefault,
                      //                       shape: const RoundedRectangleBorder(
                      //                           borderRadius:
                      //                               BorderRadius.vertical(
                      //                                   top: Radius.circular(
                      //                                       12))),
                      //                       builder: (context) =>
                      //                           const EnterPhoneBottomSheet(),
                      //                     );
                      //                   }
                      //                 } else {
                      //                   log('Subscription: ${value.subscription}');
                      //                   if (value.subscription != null) {
                      //                     log('111');
                      //                     context.router
                      //                         .push(
                      //                             const SubscriptionProviderRoute())
                      //                         .then((_) => context
                      //                             .read<ProfileVm>()
                      //                             .fetchUser());
                      //                     log('222');
                      //                   } else {
                      //                     log('Subscription is null');
                      //                   }
                      //                 }
                      //               },
                      //             ))
                      //         : Padding(
                      //             padding: AppPaddings.all,
                      //             child: CustomButton(
                      //               text: LocaleKeys.learnMore.tr(),
                      //               onPressed: (minDescription
                      //                           ?.contains('Реферальная') ??
                      //                       false)
                      //                   ? () => context.router
                      //                           .push(ReferralProgramRoute(
                      //                         userId: context
                      //                                 .read<ProfileVm>()
                      //                                 .user
                      //                                 ?.data
                      //                                 ?.id ??
                      //                             0,
                      //                         promocode: context
                      //                                 .read<ProfileVm>()
                      //                                 .user
                      //                                 ?.data
                      //                                 ?.refCode ??
                      //                             '',
                      //                       ))
                      //                   : () => context.router.push(
                      //                       const SubscriptionProviderRoute()),
                      //             )),

                      const ColumnSpacer(2),
                    ],
                  ),
                ),
                Container(
                  height: context.mediaQuery.size.width,
                  color: AppColors.none,
                  child: const Column(
                    children: [
                      ColumnSpacer(0.8),
                      CustomBar(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  String getBtnText(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'kk':
        return goto?.text?.kk ?? LocaleKeys.learnMore.tr();
      case 'ru':
        return goto?.text?.ru ?? LocaleKeys.learnMore.tr();
      case 'en':
        return goto?.text?.en ?? LocaleKeys.learnMore.tr();
      default:
        return LocaleKeys.learnMore.tr();
    }
  }
}
