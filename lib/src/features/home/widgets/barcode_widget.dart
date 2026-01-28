import 'dart:developer';
import 'dart:io';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class BarcodeWidget extends StatefulWidget {
  const BarcodeWidget({super.key});

  @override
  State<BarcodeWidget> createState() => _BarcodeWidgetState();
}

class _BarcodeWidgetState extends State<BarcodeWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  double maxHeight = 230.0;
  double minHeight = 55.0;
  bool _isExpanded = false;
  QRViewController? controller;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: minHeight,
      end: maxHeight,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    controller?.dispose();
    super.dispose();
  }

  void _togglePanel() {
    if (_isExpanded) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Поиск по штрихкоду',
        hasLeading: true,
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: AppComponents.buttongroupButtonWhiteBgColorDefault,
              borderRadius: 24,
              borderWidth: 4,
              cutOutWidth: MediaQuery.of(context).size.width / 1.4,
              cutOutHeight: MediaQuery.of(context).size.height / 8,
              borderLength: 30,
            ),
          ),
          Positioned.fill(
            top: 100,
            child: Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: _togglePanel,
                child: Container(
                  padding: AppPaddings.all,
                  decoration: const BoxDecoration(
                    color: AppComponents.buttongroupButtonWhiteBgColorDefault,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: result == null
                      ? Text(
                          'Отсканируйте штрихкод товара',
                          style: AppTextStyles.bodyLStrong,
                        )
                      : Text(
                          result?.code ?? 'Нет результата',
                          style: AppTextStyles.bodyLStrong,
                        ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: AppPaddings.all,
              height: _animation.value,
              decoration: const BoxDecoration(
                  color: AppComponents.navbarBgColorDefault,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      result != null
                          ? const CustomBar()
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const ColumnSpacer(1.6),
                  result != null
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AppSvgImages.closeLarge),
                                Text(
                                  'Вы выбрали',
                                  style: AppTextStyles.headingH3.copyWith(
                                      color: AppComponents
                                          .navbarTitleColorDefault),
                                ),
                                const SizedBox(
                                  height: 16,
                                  width: 16,
                                ),
                              ],
                            ),
                            const ColumnSpacer(1.6),
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://content3.flowwow-images.com/data/blog/23/1684380842_94662323.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.semanticBgSurface1),
                                ),
                                const RowSpacer(0.8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1600 ₸/кг',
                                        style: AppTextStyles.bodyLStrong
                                            .copyWith(
                                                color: AppColors
                                                    .primitiveBrand500),
                                      ),
                                      const ColumnSpacer(0.4),
                                      Text(
                                        'Бедро говяжье от Shas охлажденный кг',
                                        style: AppTextStyles.bodyM.copyWith(
                                            color: AppComponents
                                                .productcardorderContentTextcontentProducttitleColorDefault),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const ColumnSpacer(1.6),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                      text: 'Посмотреть товар',
                                      onPressed: () {}),
                                ),
                              ],
                            )
                          ],
                        )
                      : const ColumnSpacer(0)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        log('${result!.format},${result!.code}, ${controller.getCameraInfo()}');
        result == null ? null : _togglePanel;
      });
    });
  }
}
