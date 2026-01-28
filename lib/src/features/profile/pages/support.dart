import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_bottom_sheet.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/support_bloc/support_bloc.dart';
import 'package:qr_pay_app/src/features/profile/vm/support_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key, required this.viewModel});
  final SupportVm viewModel;

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>
    with ViewModelMixin<SupportPage, SupportVm> {
  @override
  SupportVm get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: LocaleKeys.support.tr(),
          hasLeading: true,
        ),
        body: Padding(
          padding: AppPaddings.horizontal16,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const ColumnSpacer(1.6),
              Row(
                children: [
                  SvgPicture.asset(AppSvgImages.earphones),
                  const RowSpacer(0.8),
                  Text(
                    LocaleKeys.howCanWeHelpYou.tr(),
                    style: AppTextStyles.headingH4
                        .copyWith(color: AppColors.semanticFgDefault),
                  ),
                ],
              ),
              const ColumnSpacer(1.6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ColumnSpacer(0.8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: LocaleKeys.describeTheProblemQuestion.tr(),
                      hintStyle: AppTextStyles.bodyL.copyWith(
                        color: AppComponents
                            .textareaSecondaryPlaceholdertextColorDefault,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: AppComponents
                                .textareaSecondaryBorderColorDefault
                            //  AppComponents
                            //     .textareaSecondaryPlaceholdertextColorDefault
                            ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color:
                              AppComponents.textareaSecondaryBorderColorDefault,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: AppComponents
                                .textareaSecondaryBorderColorDefault),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: AppComponents
                                .textareaSecondaryBorderColorDefault),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    minLines: 4,
                    maxLines: 6,
                    controller: viewModel.controller,
                    onChanged: (value) => viewModel.onChangeTextEdit(),
                    cursorColor: AppComponents
                        .textareaPrimaryPlaceholdertextColorDefault,
                    style: AppTextStyles.bodyL.copyWith(
                      color:
                          AppComponents.textareaSecondaryInputtextColorDefault,
                    ),
                  ),
                  const ColumnSpacer(1.2),
                  Text(
                    LocaleKeys.additionally.tr(),
                    style: AppTextStyles.bodyM.copyWith(
                        color:
                            AppComponents.textareaPrimaryLabeltextColorDefault),
                  ),
                  const ColumnSpacer(0.8),
                  CustomButton(
                    text: LocaleKeys.uploadFile.tr(),
                    onPressed: () => Platform.isIOS
                        ? openCupertinoUploadAction2(context, viewModel)
                        : viewModel.choiceFiles(context),
                    buttonColor:
                        AppComponents.buttongroupButtonGrayBgColorDefault,
                    icon: AppSvgImages.download,
                    hasIcon: true,
                    blackText: true,
                  ),
                  viewModel.supportFiles.isEmpty
                      ? const SizedBox.shrink()
                      : ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 16),
                          itemCount: viewModel.supportFiles.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              border: Border.all(
                                  color: AppColors.primitiveNeutral75,
                                  width: 2),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgImages.attachment,
                                  color:
                                      AppComponents.tileIconrightColorDefault,
                                ),
                                const RowSpacer(0.8),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    viewModel.supportFiles[index].path
                                        .split('/')
                                        .last,
                                    style: AppTextStyles.bodyL.copyWith(
                                        color: AppColors.semanticFgDefault),
                                  ),
                                ),
                                const RowSpacer(0.8),
                                GestureDetector(
                                  onTap: () => viewModel.removeSupport(index),
                                  child: SvgPicture.asset(
                                    AppSvgImages.closeLarge,
                                    color:
                                        AppComponents.tileIconrightColorDefault,
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              const ColumnSpacer(1),
                        )
                ],
              ),
              const ColumnSpacer(1.6),
              BlocConsumer<SupportBloc, SupportState>(
                bloc: viewModel.supportBloc,
                listener: (context, state) => state.maybeWhen(
                  orElse: () => null,
                  failed: (error) => showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      textAlign: TextAlign.start,
                      message: error,
                    ),
                    dismissType: DismissType.onSwipe,
                  ),
                  success: () {
                    context.router
                        .pop()
                        .then((_) => AppBottomSheet.sendSupport(context));
                    return null;
                  },
                ),
                builder: (context, state) {
                  return CustomButton2(
                    text: LocaleKeys.send.tr(),
                    hasBorder: false,
                    borderRadius: 16,
                    backgroundColor:
                        AppComponents.buttongroupButtonPrimaryBgColorDefault,
                    disabledTextColor:
                        AppComponents.buttongroupButtonPrimaryTextColorDisabled,
                    textColor:
                        AppComponents.buttongroupButtonPrimaryTextColorDefault,
                    onPressed: state.whenOrNull(
                      loading: () => null,
                      initial: () => viewModel.supportFiles.isNotEmpty ||
                              viewModel.controller.text.isNotEmpty
                          ? () => viewModel.sendSupport()
                          : null,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> openCupertinoUploadAction2(
    BuildContext context, SupportVm viewModel) {
  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () =>
              viewModel.choiceImages(context).then((_) => context.router.pop()),
          child: const Text(
            'Загрузить из галереи',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(10, 132, 255, 1),
            ),
          ),
        ),
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () =>
              viewModel.choiceFiles(context).then((_) => context.router.pop()),
          child: const Text(
            'Загрузить из “Файлов”',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(10, 132, 255, 1),
            ),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => context.router.pop(),
        child: Text(
          LocaleKeys.cancel.tr(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(10, 132, 255, 1),
          ),
        ),
      ),
    ),
  );
}
