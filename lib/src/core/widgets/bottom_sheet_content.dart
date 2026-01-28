import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetContent extends StatelessWidget {
  final String title;
  final String? text;
  final String buttonText;
  final String icon;
  final Widget? content;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool notClose;
  final bool subtitleCenter;
  const BottomSheetContent({
    super.key,
    required this.title,
    this.text,
    required this.buttonText,
    required this.icon,
    this.content,
    this.notClose = false,
    this.onTap,
    this.subtitleCenter = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    String? mainText = text;
    String? subTitle;

    if (text?.contains(':') ?? false) {
      List<String> parts = text!.split(':');
      mainText = parts[0];
      subTitle = parts.length > 1 ? parts[1] : null;
    }
    return Padding(
      padding: AppPaddings.horizontal16,
      child: SafeArea(
        child: Container(
          color: backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(0.8),
              const CustomBar(),
              notClose
                  ? const SizedBox()
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // onTap?.call();
                            context.router.pop();
                          },
                          child: SvgPicture.asset(AppSvgImages.chevronBack),
                        ),
                      ],
                    ),
              const ColumnSpacer(1.6),
              Image.asset(
                icon,
                height: 128,
              ),
              const ColumnSpacer(0.8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH2
                    .copyWith(color: AppColors.semanticFgDefault),
              ),
              subTitle != null
                  ? Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyL
                          .copyWith(color: AppColors.primitiveNeutral300),
                    )
                  : const SizedBox.shrink(),
              text?.isNotEmpty ?? false
                  ? const ColumnSpacer(0.8)
                  : const SizedBox(),
              mainText?.isNotEmpty ?? false
                  ? Text(
                      mainText!,
                      textAlign:
                          subtitleCenter ? TextAlign.center : TextAlign.start,
                      style: AppTextStyles.bodyL.copyWith(
                          color: AppComponents
                              .modalModalcontentTextcontentSubtitleColorDefault),
                    )
                  : const SizedBox(),
              content != null ? const ColumnSpacer(0.8) : const SizedBox(),
              content != null ? content! : const SizedBox(),
              const ColumnSpacer(1.6),
              CustomButton(
                  text: buttonText,
                  onPressed: () {
                    onTap?.call();
                    context.router.pop();
                  }),
              const ColumnSpacer(1.6),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetContent2 extends StatelessWidget {
  final String title;
  final String text;
  final String buttonText;

  final void Function()? onTap;
  final bool subtitle;
  const BottomSheetContent2(
      {super.key,
      required this.title,
      required this.text,
      required this.buttonText,
      this.subtitle = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal16,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ColumnSpacer(0.8),
            const CustomBar(),
            const ColumnSpacer(2),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.headingH3
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
            const ColumnSpacer(1.6),
            CustomButton(
                text: buttonText,
                onPressed: () {
                  onTap;
                  context.router.pop();
                  context.router.pop();
                }),
          ],
        ),
      ),
    );
  }
}

class BottomSheetContentExit extends StatefulWidget {
  final String title;
  final String text;
  final String buttonText1;
  final String buttonText2;
  final void Function()? onTap;
  final bool subtitle;
  const BottomSheetContentExit(
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
  State<BottomSheetContentExit> createState() => _BottomSheetContentExitState();
}

class _BottomSheetContentExitState extends State<BottomSheetContentExit> {
  // late NotificationBloc bloc;

  @override
  void initState() {
    super.initState();
    // bloc = NotificationBloc(authRepository: sl<AuthRepository>());
  }

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
              widget.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.headingH2
                  .copyWith(color: AppColors.semanticFgDefault),
            ),
            widget.subtitle ? const ColumnSpacer(0.8) : const SizedBox(),
            widget.subtitle
                ? Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL
                        .copyWith(color: AppColors.primitiveNeutral300),
                  )
                : const SizedBox(),
            const ColumnSpacer(2),
            // BlocConsumer<NotificationBloc, NotificationState>(
            //   bloc: bloc,
            //   listener: (context, state) => state.maybeWhen(
            //       orElse: () => null,
            //       success: () {
            //         widget.viewModel.logout(context);
            //         context.router.pop();
            //         return null;
            //       },
            //       failed: (error) {
            //         widget.viewModel.logout(context);
            //         context.router.pop();
            //         return null;
            //       }
            //       // showTopSnackBar(
            //       //   Overlay.of(context),
            //       //   CustomSnackBar.error(
            //       //     textAlign: TextAlign.start,
            //       //     message: error,
            //       //   ),
            //       //   dismissType: DismissType.onSwipe,
            //       // ),
            //       ),
            //   builder: (context, state) {
            //     return CustomButton(
            //       text: widget.buttonText1,
            //       onPressed: () {
            //         bloc.add(const NotificationEvent.deleteFcmToken());
            //         // viewModel.logout(context);
            //         // context.router.pop();
            //       },
            //     );
            //   },
            // ),
            CustomButton(
              text: widget.buttonText1,
              onPressed: () {
                widget.viewModel.logout(context);
                context.router.pop();
              },
            ),
            const ColumnSpacer(1.6),
            CustomButton2(
                backgroundColor:
                    AppComponents.buttongroupButtonGrayBgColorDefault,
                hasBorder: false,
                text: widget.buttonText2,
                borderRadius: 12,
                onPressed: () {
                  context.router.pop();
                }),
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomButton(
            //         text: buttonText1,
            //         onPressed: () {
            //           viewModel.logout(context);
            //           context.router.pop();
            //         },
            //       ),
            //     ),
            //     const RowSpacer(1),
            //     Expanded(
            //       child: CustomButton(
            //           text: buttonText2,
            //           onPressed: () {
            //             context.router.pop();
            //           }),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
