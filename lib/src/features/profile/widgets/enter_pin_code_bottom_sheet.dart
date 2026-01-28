import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_text_field.dart';
import 'package:qr_pay_app/src/core/widgets/keyboard_overlay_focus_widget.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:qr_pay_app/src/features/profile/widgets/modal_top_bar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:qr_pay_app/src/features/profile/pages/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class EnterPinCodeBottomSgeet extends StatefulWidget {
  const EnterPinCodeBottomSgeet({super.key, required this.viewModel});
  final AuthVm viewModel;

  @override
  State<EnterPinCodeBottomSgeet> createState() =>
      _EnterPinCodeBottomSgeetState();
}

class _EnterPinCodeBottomSgeetState extends State<EnterPinCodeBottomSgeet>
    with ViewModelMixin<EnterPinCodeBottomSgeet, AuthVm> {
  @override
  AuthVm get viewModel => widget.viewModel;

  bool logintStatus = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel.authBloc,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: const BoxDecoration(
                color: AppComponents.modalBgColorDefault,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
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
                          ModalTopBar(
                            title: LocaleKeys.enterPinCode.tr(),
                            onTap: () => showCustomSheet(
                              context,
                              child: const EnterPhoneBottomSheet(),
                            ),
                            hasIcon: true,
                          ),
                          const ColumnSpacer(3.6),
                          Text(
                            '${LocaleKeys.sentCodeNumber.tr()} ${viewModel.phoneController.text}',
                            style: AppTextStyles.bodyM.copyWith(
                                color: AppComponents
                                    .inputPrimaryLabeltextColorDefault),
                          ),
                          const ColumnSpacer(0.8),
                          CustomTextField(
                            autoFocus: true,
                            placeholder: '${LocaleKeys.enterPinCode.tr()} ',
                            controller: viewModel.pinCodeController,
                            backgroundColor: AppColors.semanticBgSurface2,
                            textAlign: TextAlign.center,
                            textInputType: TextInputType.number,
                            onChanged: (value) =>
                                value.length == 7 ? viewModel.register() : null,
                          ),
                          const ColumnSpacer(1.6),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) => state.maybeWhen(
                              orElse: () => null,
                              success: () async {
                                context.read<ProfileVm>().checkAuthorized();
                                context.router.pop(context);
                                // NotificationService.instance
                                //     .initializeFcmToken();

                                // Первое модальное окно с поздравлением
                                Future.delayed(
                                  const Duration(milliseconds: 100),
                                  () => showCustomSheet(
                                    context,
                                    backgroundColor: AppColors.semanticBgSurface1,
                                    child: BottomSheetContent(
                                      title: LocaleKeys.congratulations.tr(),
                                      text: LocaleKeys.successfullyLogged.tr(),
                                      buttonText: LocaleKeys.cont.tr(),
                                      icon: AppWebpImages.ornament,
                                      notClose: true,
                                      // onTap: () async =>
                                      //     context.router.pop(context),
                                    ),
                                    onClose: () {
                                      if (!widget.viewModel.localStorage
                                          .hasFirst()) {
                                        widget.viewModel.localStorage
                                            .saveFirst('is_first');
                                      } else {
                                        // context.router.pop();
                                      }
                                    },
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
                            builder: (context, state) => CustomButton(
                              text: LocaleKeys.cont.tr(),
                              onPressed: () => viewModel.register(),
                            ),
                          ),
                          const ColumnSpacer(1.2),
                          logintStatus
                              ? Text(
                                  errorMessage,
                                  style: AppTextStyles.bodyM.copyWith(
                                      color: AppColors.primitiveRed500),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  KeyboardOverlayFocusWidget(
                      callback: () => viewModel.register()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
