import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/constants/app_url.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_text_field.dart';
import 'package:qr_pay_app/src/core/widgets/keyboard_overlay_focus_widget.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/widgets/modal_top_bar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_bottom_button.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:qr_pay_app/src/features/profile/pages/auth_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_pin_code_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';

class EnterPhoneBottomSheet extends StatefulWidget {
  const EnterPhoneBottomSheet({super.key});

  @override
  State<EnterPhoneBottomSheet> createState() => _EnterPhoneBottomSheetState();
}

class _EnterPhoneBottomSheetState extends State<EnterPhoneBottomSheet>
    with ViewModelMixin<EnterPhoneBottomSheet, AuthVm> {
  @override
  AuthVm get viewModel => context.read<AuthVm>();

  bool logintStatus = false;
  String errorMessage = '';
  bool isPrivacy = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVm>(
      builder: (context, value, state) {
        return BlocProvider.value(
          value: value.authBloc,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              decoration: const BoxDecoration(
                  color: AppComponents.modalBgColorDefault,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              child: SafeArea(
                child: Stack(
                  children: [
                    KeyboardVisibilityBuilder(
                      builder: (context, isKeyboardVisible) => Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: isKeyboardVisible
                              ? MediaQuery.of(context).viewInsets.bottom + 20
                              : 0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const ColumnSpacer(0.8),
                            const CustomBar(),
                            const ColumnSpacer(2),
                            ModalTopBar(title: LocaleKeys.authorization.tr()),
                            const ColumnSpacer(3.6),
                            CustomTextField(
                              autoFocus: true,
                              placeholder: LocaleKeys.yourPhoneNumber.tr(),
                              controller: value.phoneController,
                              textInputType: TextInputType.number,
                            ),
                            const ColumnSpacer(1.6),
                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) => state.maybeWhen(
                                orElse: () => null,
                                success: () async {
                                  await context.router.pop();
                                  Future.delayed(
                                    const Duration(milliseconds: 10),
                                    () => showCustomSheet(
                                      context,
                                      child: EnterPinCodeBottomSgeet(
                                          viewModel: value),
                                    ),
                                  );
                                  return null;
                                },
                                error: (message) {
                                  errorMessage = message;
                                  setState(() => logintStatus = true);
                                  return null;
                                },
                              ),
                              builder: (context, state) {
                                return CustomBottomButton(
                                  text: LocaleKeys.getPinCode.tr(),
                                  onPressed:
                                      isPrivacy ? () => value.login() : null,
                                );
                              },
                            ),
                            logintStatus
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    child: Text(
                                      errorMessage,
                                      style: AppTextStyles.bodyS.copyWith(
                                          color:
                                              AppColors.semanticErrorDefault),
                                    ),
                                  )
                                : const SizedBox(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      setState(() => isPrivacy = !isPrivacy),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isPrivacy
                                          ? AppComponents
                                              .checkboxBgColorCheckedDefault
                                          : null,
                                      border: Border.all(
                                        width: 1.9,
                                        color: AppComponents
                                            .checkboxBorderColorCheckedDefault,
                                      ),
                                    ),
                                    child: isPrivacy
                                        ? SvgPicture.asset(
                                            AppSvgImages.checkmark)
                                        : null,
                                  ),
                                ),
                                const RowSpacer(1.4),
                                Flexible(
                                  child: RichText(
                                    maxLines: 3,
                                    softWrap: true,
                                    text: TextSpan(
                                      style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .listitemSubtitleColorDefault),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${LocaleKeys.agreeTerms.tr()} ',
                                        ),
                                        TextSpan(
                                          text: LocaleKeys.userAgreement.tr(),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.router.push(
                                                WebViewPageRoute(
                                                    url: context
                                                            .read<ProfileVm>()
                                                            .configuration
                                                            ?.data
                                                            ?.privacyPolicyUrl ??
                                                        '')),
                                          // LaunchInBrowserUtil.launchUrl(
                                          //     AppUrls.userAgreement),
                                          style: AppTextStyles.bodyM.copyWith(
                                            color: AppComponents
                                                .listitemSubtitleColorDefault,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        const TextSpan(text: ' и '),
                                        TextSpan(
                                          text: LocaleKeys.publicContract.tr(),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => context.router.push(
                                                WebViewPageRoute(
                                                    url: context
                                                            .read<ProfileVm>()
                                                            .configuration
                                                            ?.data
                                                            ?.termsOfServiceUrl ??
                                                        '')),
                                          // LaunchInBrowserUtil.launchUrl(
                                          //     AppUrls.publicContract),
                                          style: AppTextStyles.bodyM.copyWith(
                                            color: AppComponents
                                                .listitemSubtitleColorDefault,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const ColumnSpacer(1.6),
                          ],
                        ),
                      ),
                    ),
                    KeyboardOverlayFocusWidget(callback: () => value.login()),
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
