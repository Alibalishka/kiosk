import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/qr/vm/qr_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key, required this.viewModel});
  final QrVm viewModel;

  @override
  State<QrPage> createState() => _CartPageState();
}

class _CartPageState extends State<QrPage>
    with SingleTickerProviderStateMixin, ViewModelMixin<QrPage, QrVm> {
  @override
  QrVm get viewModel => widget.viewModel;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      viewModel.controller!.pauseCamera();
    } else if (Platform.isIOS) {
      viewModel.controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primitiveNeutralcold1000,
      appBar: CustomAppBar(
        text: LocaleKeys.scanQRcode.tr(),
        hasLeading: true,
      ),
      body: Stack(
        children: [
          QRView(
            key: viewModel.qrKey,
            onQRViewCreated: viewModel.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: AppColors.primitiveNeutralwarm0,
              borderRadius: 24,
              borderWidth: 4,
              cutOutWidth: MediaQuery.of(context).size.width / 1.4,
              cutOutHeight: MediaQuery.of(context).size.height / 3,
              borderLength: 80,
            ),
          ),
          Positioned.fill(
            top: 130,
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    LocaleKeys.scanQRcodeDescription.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL.copyWith(
                        color: AppComponents
                            .buttongroupButtonPrimaryTextColorDefault),
                  ),
                )),
          ),

          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: SafeArea(
              child: CustomButton(
                text: LocaleKeys.close.tr(),
                onPressed: () => context.router.pop(context),
              ),
            ),
          ),
          // Positioned.fill(
          //   top: 0,
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: CustomButton2(
          //         backgroundColor: AppColors.primitiveBlue200,
          //         text: 'MAIN',
          //         onPressed: () async {
          //           context.router.push(
          //             CheckoutProviderRoute(
          //               tableId: '893c5966-b554-4829-a445-07d1f73d7018',
          //               // tableId: '7bc85bb0-568a-460a-a414-e64df836817a',
          //               posOrderId: null,
          //               organizationId: '5dbfded6-4da9-4ea4-95fb-c55c7fb624e0',
          //             ),
          //           );
          //           //     .then((value) {
          //           //   if (value != null) {
          //           //     log(value.toString());
          //           //   }
          //           // });

          //           // context.router.push(
          //           //   DrinksPageRoute(
          //           //   idItem: '50c34486-4157-4658-a233-697f5af4b5ff',
          //           //     tableId: '116c54b0-74f5-40ca-abab-2415ff29aaeb',
          //           //   ),
          //           // );
          //         }),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ModalQrButton extends StatelessWidget {
  const ModalQrButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.image,
  });
  final Function()? onTap;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: AppPaddings.horizontal16,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.5,
                color: AppComponents.tileNotselectedBorderColorDefault),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: AppPaddings.all,
          child: Row(
            children: [
              Image.asset(
                image,
                width: 60,
                height: 60,
              ),
              const RowSpacer(0.8),
              Flexible(
                child: Text(
                  text,
                  style: AppTextStyles.bodyLStrong
                      .copyWith(color: AppComponents.tileTitleColorDefault),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
