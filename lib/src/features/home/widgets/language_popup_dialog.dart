import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/language_bloc/language_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/language.dart';

class LanguagePopupDialog {
  const LanguagePopupDialog._();

  static Future<void> show({
    required BuildContext context,
    required QrMenuVm viewModel,
    required VoidCallback onSecretTap,
  }) async {
    final languages = const [
      Language(languageCode: AppLanguages.kk),
      Language(languageCode: AppLanguages.ru),
      Language(languageCode: AppLanguages.en),
    ];

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        final currentCode = ctx.locale.languageCode;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: BlocListener<LanguageBloc, LanguageState>(
              bloc: BlocProvider.of<LanguageBloc>(context),
              listener: (listenerCtx, state) {
                state.maybeWhen(
                  changeSuccess: () {
                    context.router.pop(true);
                    viewModel.fetchMenu();
                  },
                  orElse: () {},
                );
              },
              child: Container(
                width: MediaQuery.of(ctx).size.width * 0.85,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: onSecretTap,
                          child: Text(
                            LocaleKeys.language.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: languages.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (_, index) {
                            final lang = languages[index];
                            final isSelected =
                                currentCode.contains(lang.languageCode);

                            return InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                BlocProvider.of<LanguageBloc>(context).add(
                                  LanguageEvent.languageChangeTappedMenu(
                                    lang.languageCode,
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 10,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Language.icons[lang.languageCode] ??
                                          '',
                                      width: 3.h,
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      Language.names[lang.languageCode] ??
                                          'Не определено',
                                      style: AppTextStyles.bodyL.copyWith(
                                        fontSize: 17.sp,
                                        color: AppComponents
                                            .listitemTitleColorDefault,
                                      ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      isSelected
                                          ? AppSvgImages.radiobuttonOn
                                          : AppSvgImages.radiobuttonOff,
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () => context.router.pop(),
                        child: SvgPicture.asset(
                          AppSvgImages.closeLarge,
                          height: 3.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

