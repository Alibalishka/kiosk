import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/bloc/kiosk_bloc/kiosk_bloc.dart';
import 'package:qr_pay_app/src/features/kiosk/vm/kiosk_kaspi_vm.dart';
import 'package:qr_pay_app/src/features/kiosk/widgets/payment_status_views.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';

class KioskKaspiPayPage extends StatefulWidget {
  const KioskKaspiPayPage({
    super.key,
    required this.viewModel,
  });
  final KioskKaspiVm viewModel;

  @override
  State<KioskKaspiPayPage> createState() => _KioskKaspiPayPageState();
}

class _KioskKaspiPayPageState extends State<KioskKaspiPayPage>
    with ViewModelMixin<KioskKaspiPayPage, KioskKaspiVm> {
  @override
  KioskKaspiVm get viewModel => widget.viewModel;

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
      body: BlocConsumer<KioskBloc, KioskState>(
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
          successPay: (response) => viewModel.savePayStatus(context, response),
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

  /// Экран оплаты через Kaspi.
  ///
  /// В портрете всё идёт одной колонкой: она занимает ~845 px. В альбоме под
  /// контент остаётся ~750, поэтому текст с суммой уходит влево, а код —
  /// вправо.
  Widget _qrContent(BuildContext context, QrMenuLayout layout) {
    if (!layout.isLandscape) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(CrossAxisAlignment.center),
          _qrCode(400),
          const ColumnSpacer(1.2),
          _paymentMethods(CrossAxisAlignment.center),
        ],
      );
    }

    // Код тянется по короткой стороне экрана, но не крупнее портретного.
    final qrSize =
        (MediaQuery.sizeOf(context).shortestSide * 0.55).clamp(240.0, 400.0);

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(CrossAxisAlignment.start),
                const ColumnSpacer(2.4),
                _paymentMethods(CrossAxisAlignment.start),
              ],
            ),
          ),
          const RowSpacer(4.8),
          _qrCode(qrSize),
        ],
      ),
    );
  }

  Widget _header(CrossAxisAlignment align) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: align,
        children: [
          SvgPicture.asset(
            AppSvgImages.qr,
            height: 120,
          ),
          const ColumnSpacer(1.2),
          Text(
            LocaleKeys.scanAndPay.tr(),
            style: AppTextStyles.bodyM.copyWith(fontSize: 40),
          ),
          const ColumnSpacer(1.2),
          // Сумма набрана в 100 px: на узкой колонке длинный чек её не
          // уместит, поэтому уменьшаем кегль, а не обрезаем цифры.
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${priceFormat(viewModel.payData.totalPrice!.toInt().toString())} ₸',
              style: AppTextStyles.headingH3.copyWith(fontSize: 100),
            ),
          ),
        ],
      );

  Widget _qrCode(double size) {
    final redirectUrl = viewModel.payData.redirectUrl ?? '';
    if (redirectUrl.isEmpty) return const PaymentSpinner();

    return QrImageView(
      data: redirectUrl,
      version: QrVersions.auto,
      size: size,
      embeddedImage: const AssetImage(AppWebpImages.kaspiOutline),
      // Логотип в центре масштабируется вместе с кодом: 82 из 400.
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size(size * 0.205, size * 0.205),
      ),
    );
  }

  Widget _paymentMethods(CrossAxisAlignment align) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: align,
        children: [
          Text(
            LocaleKeys.paymentMethods.tr(),
            style: AppTextStyles.bodyM.copyWith(fontSize: 24),
          ),
          const ColumnSpacer(1.2),
          SvgPicture.asset(
            AppSvgImages.kaspiGold,
            height: 64,
          ),
        ],
      );
}
