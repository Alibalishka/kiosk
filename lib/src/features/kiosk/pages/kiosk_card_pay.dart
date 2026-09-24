import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_card_vm.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/payment_status_views.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';

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
    final layout = QrMenuLayout.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.paymentTitle.tr(),
        isTablet: true,
        hasLeading: true,
      ),
      bottomNavigationBar: viewModel.payStatus.data?.status == 'Error'
          ? const PaymentErrorDock()
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
          builder: (context, state) => PaymentCenteredScroll(
            child: state.maybeWhen(
              loading: () => const PaymentLoadingView(),
              orElse: () => _buildContent(
                context,
                viewModel.payStatus.data?.status ?? '',
                layout,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    String status,
    QrMenuLayout layout,
  ) {
    switch (status) {
      case 'QrTokenCreated':
        return _qrContent(context, layout);
      case 'Error':
        return const PaymentErrorView();
      case 'Processed':
        return PaymentSuccessView(
          totalPrice: viewModel.payData.totalPrice!.toInt(),
        );
      case 'Wait':
      default:
        return const PaymentSpinner();
    }
  }

  /// Экран оплаты по QR.
  ///
  /// В портрете всё идёт одной колонкой. В альбоме высоты вдвое меньше, а
  /// блок с кодом — почти 500 px: колонка перестаёт помещаться. Поэтому
  /// текст с суммой уходит влево, а код — вправо.
  Widget _qrContent(BuildContext context, QrMenuLayout layout) {
    final redirectUrl = viewModel.payData.redirectUrl ?? '';

    if (!layout.isLandscape) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _qrTitle(),
          const ColumnSpacer(0.8),
          _qrDescription(TextAlign.center),
          const ColumnSpacer(2.4),
          _qrPrice(),
          const ColumnSpacer(4),
          _qrCode(redirectUrl, 500),
          const ColumnSpacer(5),
          _paymentMethods(CrossAxisAlignment.center),
        ],
      );
    }

    // Код тянется по короткой стороне экрана, но не крупнее портретного.
    final qrSize =
        (MediaQuery.sizeOf(context).shortestSide * 0.62).clamp(260.0, 500.0);

    // Flexible, а не Expanded: колонка занимает свою ширину, а не весь
    // остаток, — иначе текст прижимается к краю экрана и между ним и кодом
    // остаётся дыра. Пара блоков центрируется целиком.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            // Без верхней границы колонка раздувается на весь остаток:
            // описание — обычный Text, при переносе он занимает всю выданную
            // ширину. Свободного места не остаётся, и центрировать нечего —
            // текст прижимается к краю экрана. 600 px это ~2 строки описания
            // и полная ширина заголовка без масштабирования.
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _qrTitle(),
                  const ColumnSpacer(0.8),
                  _qrDescription(TextAlign.start),
                  const ColumnSpacer(2.4),
                  _qrPrice(),
                  const ColumnSpacer(3.2),
                  _paymentMethods(CrossAxisAlignment.start),
                ],
              ),
            ),
          ),
          const RowSpacer(4.8),
          _qrCode(redirectUrl, qrSize),
        ],
      ),
    );
  }

  Widget _qrTitle() => FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppSvgImages.qrIconKiosk,
              height: 80,
            ),
            const RowSpacer(1.6),
            Text(
              LocaleKeys.qrPaymentTitle.tr(),
              style: const TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      );

  Widget _qrDescription(TextAlign align) => Text(
        LocaleKeys.qrPaymentDescription.tr(),
        textAlign: align,
        style: const TextStyle(
          fontSize: 28,
          color: AppColors.semanticStatus04Default,
        ),
      );

  /// Сумма набрана в 100 px: на узкой колонке длинный чек её не уместит,
  /// поэтому уменьшаем кегль, а не обрезаем цифры.
  Widget _qrPrice() => FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '${priceFormat(viewModel.payData.totalPrice!.toInt().toString())} ₸',
          style: AppTextStyles.headingH3.copyWith(
            fontSize: 100,
          ),
        ),
      );

  Widget _qrCode(String redirectUrl, double borderSize) {
    if (redirectUrl.isEmpty) return const PaymentSpinner();

    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppSvgImages.borderQr,
          height: borderSize,
        ),
        QrImageView(
          data: redirectUrl,
          version: QrVersions.auto,
          // Те же пропорции, что были у пары 500 / 450.
          size: borderSize * 0.9,
          dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.circle,
            color: Colors.black,
          ),
          eyeStyle: const QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _paymentMethods(CrossAxisAlignment align) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: align,
        children: [
          Text(
            LocaleKeys.paymentMethods.tr(),
            style: AppTextStyles.bodyM.copyWith(
              fontSize: 24,
              color: AppColors.semanticStatus04Default,
            ),
          ),
          const ColumnSpacer(1.6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppSvgImages.mastercard, height: 32),
              const RowSpacer(0.8),
              SvgPicture.asset(AppSvgImages.visa, height: 32),
              const RowSpacer(0.8),
              SvgPicture.asset(AppSvgImages.gPay, height: 32),
              const RowSpacer(0.8),
              SvgPicture.asset(AppSvgImages.applePay, height: 32),
            ],
          ),
        ],
      );
}
