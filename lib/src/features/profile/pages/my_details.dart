import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/disabled_placeholder.dart';
import 'package:qr_pay_app/src/core/widgets/title_text_field.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/user_bloc/user_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  UserBloc bloc = UserBloc(authRepository: sl<AuthRepository>());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          text: LocaleKeys.myDetails.tr(),
          hasLeading: true,
        ),
        body: Consumer<ProfileVm>(
          builder: (context, value, state) {
            return BlocConsumer<UserBloc, UserState>(
              bloc: bloc,
              listener: (context, state) => state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                deleteSuccess: () {
                  value.logout(context);
                  context.router.pop();
                  return const SizedBox.shrink();
                },
                error: (message) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      textAlign: TextAlign.start,
                      message: message,
                    ),
                    dismissType: DismissType.onSwipe,
                  );
                  return null;
                },
                updateSuccess: () {
                  value.isDisable = true;
                  context.router.pop();
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(
                      textAlign: TextAlign.start,
                      message: LocaleKeys.success.tr(),
                    ),
                    dismissType: DismissType.onSwipe,
                  );
                  return null;
                },
              ),
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: AppPaddings.horizontal16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ColumnSpacer(1.6),
                      Column(
                        children: [
                          TitleTextField(
                            title: LocaleKeys.name.tr(),
                            controller: value.nameController,
                            onChanged: (_) => value.onChange(),
                            placeholder: LocaleKeys.enterName.tr(),
                          ),
                          const ColumnSpacer(1.6),
                          DisabledPlaceholder(
                            title: LocaleKeys.telephone.tr(),
                            placeholder: value.phoneController.text,
                          ),
                          const ColumnSpacer(1.6),
                          TitleTextField(
                            title: 'Email',
                            controller: value.emailController,
                            onChanged: (_) => value.onChange(),
                            textInputType: TextInputType.datetime,
                            placeholder: LocaleKeys.enterEmail.tr(),
                          ),
                          const ColumnSpacer(1.6),
                          TitleTextField(
                            title: LocaleKeys.dateOfBirth.tr(),
                            controller: value.birthDateController,
                            onChanged: (_) => value.onChange(),
                            textInputType: TextInputType.number,
                            placeholder: LocaleKeys.dateFormat.tr(),
                          ),
                          const ColumnSpacer(1.6),
                          Theme(
                            data: Theme.of(context).copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                            child: PopupMenuButton<String>(
                              tooltip: '',
                              onSelected: (String gender) {
                                // log("Selected gender: $gender");
                                value.selectedGender = gender;
                                value.onChange();
                              },
                              itemBuilder: (BuildContext context) {
                                List<String> genders = [
                                  LocaleKeys.themale.tr(),
                                  LocaleKeys.thefemale.tr(),
                                ];
                                return List<PopupMenuEntry<String>>.generate(
                                  genders.length,
                                  (int index) => PopupMenuItem<String>(
                                    value: genders[index],
                                    child: SizedBox(
                                      width: context.mediaQuery.size.width,
                                      child: Text(
                                        genders[index],
                                        style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .inputPrimaryInputtextColorDefault,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              offset: const Offset(1, 48),
                              elevation: 0,
                              color: AppComponents.inputPrimaryBgColorDefault,
                              shadowColor: AppColors.primitiveNeutralcold1000,
                              surfaceTintColor:
                                  AppColors.primitiveNeutralcold1000,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.gender.tr(),
                                    style: AppTextStyles.bodyM.copyWith(
                                      color: AppComponents
                                          .inputPrimaryLabeltextColorDefault,
                                    ),
                                  ),
                                  const ColumnSpacer(0.8),
                                  Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppComponents
                                          .inputSecondaryBgColorDefault,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: AppComponents
                                            .inputSecondaryBorderColorDefault,
                                      ),
                                    ),
                                    padding: AppPaddings.sym16x12,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          value.selectedGender ??
                                              LocaleKeys.selectGender.tr(),
                                          style: AppTextStyles.bodyL.copyWith(
                                            color: AppComponents
                                                .inputPrimaryInputtextColorDefault,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                            AppSvgImages.chevronDown),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const ColumnSpacer(1.6),
                      CustomButton2(
                        text: LocaleKeys.saveChanges.tr(),
                        onPressed: value.isDisable
                            ? null
                            : () => value.updateUser(context, bloc),
                        hasBorder: false,
                        backgroundColor: AppComponents
                            .buttongroupButtonPrimaryBgColorDefault,
                        isButtonText: true,
                        textColor: AppComponents
                            .buttongroupButtonPrimaryTextColorDefault,
                        borderRadius: 16,
                        disabledTextColor: AppComponents
                            .buttongroupButtonPrimaryTextColorDisabled,
                      ),
                      const ColumnSpacer(1.2),
                      CustomButton2(
                        text: LocaleKeys.deleteAccount.tr(),
                        hasBorder: false,
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          showCustomSheet(
                            context,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.semanticBgSurface1,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12))),
                              child: BottomSheetContentDelete(
                                viewModel: value,
                                text: '',
                                title: LocaleKeys.deleteAccountQuestion.tr(),
                                buttonText1: LocaleKeys.delete.tr(),
                                buttonText2: LocaleKeys.cancel.tr(),
                                subtitle: false,
                              ),
                            ),
                          );
                        },
                        //  value.deleteAccount(),
                        isButtonText: true,
                      ),
                      // ColumnSpacer((context.mediaQuery.size.height) / 50),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BottomSheetContentDelete extends StatelessWidget {
  final String title;
  final String text;
  final String buttonText1;
  final String buttonText2;
  final void Function()? onTap;
  final bool subtitle;
  const BottomSheetContentDelete(
      {super.key,
      required this.title,
      required this.text,
      required this.buttonText1,
      required this.buttonText2,
      this.subtitle = true,
      this.onTap,
      required this.viewModel});

  final ProfileVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal16,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ColumnSpacer(0.8),
            const CustomBar(),
            const ColumnSpacer(2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.headingH2
                  .copyWith(color: AppColors.semanticFgDefault),
            ),
            subtitle ? const ColumnSpacer(0.8) : const SizedBox(),
            subtitle
                ? Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL
                        .copyWith(color: AppColors.primitiveNeutral300),
                  )
                : const SizedBox(),
            const ColumnSpacer(2),
            CustomButton(
              text: buttonText1,
              onPressed: () => viewModel.deleteAccount(),
            ),
            const ColumnSpacer(1.6),
            CustomButton2(
              backgroundColor:
                  AppComponents.buttongroupButtonGrayBgColorDefault,
              hasBorder: false,
              text: buttonText2,
              borderRadius: 12,
              onPressed: () => context.router.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
