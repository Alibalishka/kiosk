import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/address_bloc/address_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:intl/date_time_patterns.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final value = context.read<ProfileVm>().configuration;
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.about.tr(),
        actions: [
          GestureDetector(
            onTap: () => context.router.pop(),
            child: Padding(
              padding: AppPaddings.horizontal16,
              child: SvgPicture.asset(
                AppSvgImages.closeLarge,
              ),
            ),
          )
        ],
      ),
      body: IntrinsicHeight(
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // BottomSheetAppBar(
              //   title: LocaleKeys.about.tr(),
              //   svg: AppSvgImages.iconLeft,
              // ),
              const ColumnSpacer(0.8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ColumnSpacer(0.8),
                      if (value?.data?.coverUrl != null)
                        Padding(
                          padding: AppPaddings.horizontal16,
                          child: CachedNetworkImage(
                            height: context.mediaQuery.size.width / 1.2,
                            imageUrl: value?.data?.coverUrl ?? '',
                            imageBuilder: (context, placeholder) => Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(24)),
                                image: DecorationImage(
                                  image: placeholder,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      const ColumnSpacer(1.2),
                      Padding(
                        padding: AppPaddings.horizontal16,
                        child: Text(
                          value?.data?.description?.ru ?? '',
                          style: AppTextStyles.bodyL.copyWith(
                              color: AppComponents
                                  .modalModalcontentTextcontentTitleColorDefault),
                        ),
                      ),
                      const SeparatorContainer(),
                      if (value?.data?.instagram != null)
                        ListItem1(
                            title: 'Instagram',
                            leftIcon: AppSvgImages.logoInstagram,
                            rightIcon: AppSvgImages.externalLink,
                            onTap: () => LaunchInBrowserUtil.launchUrl(
                                'https://www.instagram.com/${value?.data!.instagram}')),
                      if (value?.data?.facebook != null)
                        Padding(
                          padding: AppPaddings.horizontal16,
                          child: const CustomDivider(),
                        ),
                      if (value?.data?.facebook != null)
                        ListItem1(
                          title: 'Facebook',
                          leftIcon: AppSvgImages.logoFacebook,
                          rightIcon: AppSvgImages.externalLink,
                          onTap: () => LaunchInBrowserUtil.launchUrl(
                              value?.data?.facebook),
                        ),
                      if (value?.data?.website != null)
                        Padding(
                          padding: AppPaddings.horizontal16,
                          child: const CustomDivider(),
                        ),
                      if (value?.data?.website != null)
                        ListItem1(
                          title: LocaleKeys.site.tr(),
                          leftIcon: AppSvgImages.internet,
                          rightIcon: AppSvgImages.externalLink,
                          onTap: () => LaunchInBrowserUtil.launchUrl(
                              value?.data?.website ?? ''),
                        ),
                      // const ColumnSpacer(3.2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
