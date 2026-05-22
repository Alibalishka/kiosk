import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_lottie.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_card_vm.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class KioskCardPayPage extends StatefulWidget {
  const KioskCardPayPage({
    super.key,
    required this.viewModel,
  });

  final KioskCardVm viewModel;

  @override
  State<KioskCardPayPage> createState() => _KioskCardPayPageState();
}

class _KioskCardPayPageState extends State<KioskCardPayPage>
    with ViewModelMixin<KioskCardPayPage, KioskCardVm> {
  @override
  KioskCardVm get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.paymentTitle.tr(),
        isTablet: true,
        hasLeading: true,
      ),
      bottomNavigationBar: viewModel.payStatus.data?.status == 'Error'
          ? Container(
              decoration: BoxDecoration(
                color: AppComponents.buttondockBgColorDefault,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.read<QrMenuVm>().clearBasket();
                          context.router.popUntil((route) =>
                              route.settings.name == QrMenuProviderRoute.name);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(
                              color: Color(0xFFE2E2E2),
                              width: 1.5,
                            ),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.cancelPurchaseButton.tr(),
                          style: AppTextStyles.bodyM.copyWith(
                            fontSize: 18,
                            color: AppColors.primitiveNeutralcold1000,
                          ),
                        ),
                      ),
                    ),
                    const RowSpacer(2),
                    Expanded(
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(16),
                        onPressed: () => context.router.pop(),
                        color: AppColors.primitiveNeutralcold1000,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          child: Text(
                            LocaleKeys.tryAgainButton.tr(),
                            style: AppTextStyles.bodyM.copyWith(
                              fontSize: 18,
                              color: AppComponents
                                  .buttongroupButtonPrimaryTextColorDefault,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: BlocListener<HistoryOrderBloc, HistoryOrderState>(
        bloc: viewModel.historyOrderBloc,
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          failed: (error) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                textAlign: TextAlign.start,
                message: error,
              ),
              dismissType: DismissType.onSwipe,
            );
            return null;
          },
          successDetail: (data) => viewModel.saveOrderDetail(context, data),
        ),
        child: BlocConsumer<KioskBloc, KioskState>(
          bloc: viewModel.kioskBloc,
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            failed: (error, _) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  textAlign: TextAlign.start,
                  message: error,
                ),
                dismissType: DismissType.onSwipe,
              );
              context.router.pop();
              return null;
            },
            successPayData: (response) => viewModel.saveData(response),
          ),
          builder: (context, state) => state.maybeWhen(
            loading: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.preparingToAcceptPayment.tr(),
                    style: AppTextStyles.headingH3.copyWith(
                      fontSize: 36,
                    ),
                  ),
                ),
                const ColumnSpacer(3),
                const SizedBox(
                  height: 64,
                  width: 64,
                  child: CircularProgressIndicator(
                    color: Color(0xffF14635),
                    strokeWidth: 4,
                  ),
                ),
              ],
            ),
            orElse: () => Align(
              alignment: Alignment.center,
              child: _buildContent(viewModel.payStatus.data?.status ?? ''),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String status) {
    switch (status) {
      case 'QrTokenCreated':
        final redirectUrl = viewModel.payData.redirectUrl ?? '';
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   AppSvgImages.qr,
            //   height: 120,
            // ),
            const ColumnSpacer(1.2),
            Text(
              LocaleKeys.scanAndPay.tr(),
              style: AppTextStyles.bodyM.copyWith(
                fontSize: 40,
              ),
            ),
            const ColumnSpacer(1.2),
            Text(
              '${priceFormat(viewModel.payData.totalPrice!.toInt().toString())} ₸',
              style: AppTextStyles.headingH3.copyWith(
                fontSize: 100,
              ),
            ),
            if (redirectUrl.isNotEmpty)
              QrImageView(
                data: redirectUrl,
                version: QrVersions.auto,
                size: 400,
              )
            else
              const SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator(
                  color: Color(0xffF14635),
                  strokeWidth: 4,
                ),
              ),
            const ColumnSpacer(1.2),
            Text(
              LocaleKeys.paymentMethods.tr(),
              style: AppTextStyles.bodyM.copyWith(
                fontSize: 24,
              ),
            ),
            const ColumnSpacer(1.2),
            SvgPicture.asset(
              AppSvgImages.card,
              height: 64,
              color: AppColors.primitiveNeutralcold1000,
            ),
            const ColumnSpacer(0.6),
            Text(
              'Оплатить картой',
              style: AppTextStyles.bodyMStrong.copyWith(
                fontSize: 28,
                color: AppColors.primitiveNeutralcold1000,
              ),
            ),
          ],
        );
      case 'Wait':
        return const SizedBox(
          height: 64,
          width: 64,
          child: CircularProgressIndicator(
            color: Color(0xffF14635),
            strokeWidth: 4,
          ),
        );
      case 'Error':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppSvgImages.okError,
              height: 250,
            ),
            const ColumnSpacer(4),
            Text(
              LocaleKeys.purchaseCancellationTitle.tr(),
              style: AppTextStyles.headingH3.copyWith(
                fontSize: 32,
              ),
            ),
            Text(
              LocaleKeys.youDidNotConfirm.tr(),
              style: AppTextStyles.bodyM.copyWith(
                fontSize: 24,
              ),
            ),
          ],
        );
      case 'Processed':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppLottie.success,
              height: 30.h,
              repeat: false,
            ),
            Text(
              LocaleKeys.paymentAccepted.tr(),
              style: AppTextStyles.headingH3.copyWith(
                fontSize: 32,
              ),
            ),
            Text(
              '${priceFormat(viewModel.payData.totalPrice!.toInt().toString())} ₸',
              style: AppTextStyles.headingH3.copyWith(
                fontSize: 52,
              ),
            ),
          ],
        );
      default:
        return const SizedBox(
          height: 64,
          width: 64,
          child: CircularProgressIndicator(
            color: Color(0xffF14635),
            strokeWidth: 4,
          ),
        );
    }
  }
}
