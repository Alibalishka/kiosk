import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/logic/kiosk_token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';

class KioskSuccessPage extends StatefulWidget {
  const KioskSuccessPage({
    super.key,
    required this.id,
    required this.orderWaitTime,
  });
  final int id;
  final int orderWaitTime;

  @override
  State<KioskSuccessPage> createState() => _KioskSuccessPageState();
}

class _KioskSuccessPageState extends State<KioskSuccessPage>
    with SingleTickerProviderStateMixin {
  late HistoryOrderBloc bloc;
  late final AnimationController _closeController;

  bool _isWaiting = false;

  @override
  void initState() {
    super.initState();

    bloc = HistoryOrderBloc(authRepository: sl<AuthRepository>());

    if (widget.orderWaitTime > 0) {
      _isWaiting = true;
      Future.delayed(Duration(seconds: widget.orderWaitTime), () {
        if (mounted) {
          setState(() {
            _isWaiting = false;
          });
          bloc.add(HistoryOrderEvent.fetchHistoryDetailOrder(id: widget.id));
        }
      });
    } else {
      bloc.add(HistoryOrderEvent.fetchHistoryDetailOrder(id: widget.id));
    }

    _closeController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 30,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _onClose();
        }
      })
      ..forward();
  }

  void _onClose() {
    if (!mounted) return;
    context.read<QrMenuVm>().clearBasket();
    context.read<QrMenuVm>().fetchMenu();
    context.router
        .popUntil((route) => route.settings.name == QrMenuProviderRoute.name);
  }

  @override
  void dispose() {
    _closeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: BlocConsumer<HistoryOrderBloc, HistoryOrderState>(
        bloc: bloc,
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          failed: (error) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                textAlign: TextAlign.start,
                message: error,
              ),
            );
            return null;
          },
        ),
        builder: (context, state) {
          if (_isWaiting) {
            return const Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator(
                  color: Color(0xffF14635),
                  strokeWidth: 4,
                ),
              ),
            );
          }
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 64,
                width: 64,
                child: CircularProgressIndicator(
                  color: Color(0xffF14635),
                  strokeWidth: 4,
                ),
              ),
            ),
            successDetail: (response) {
              final qrSize = context.mediaQuery.size.width * 0.35;

              return Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 64, vertical: 48),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 56),
                          Text(
                            LocaleKeys.yourOrderNumber.tr(),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.headingH3.copyWith(
                              fontSize: 52,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            constraints: const BoxConstraints(minWidth: 240),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 48, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF49C310),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              (response.data?.number ??
                                      response.data?.numberGenerated ??
                                      '')
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: AppTextStyles.headingH3.copyWith(
                                fontSize: 64,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Следите за статусом заказа через QR',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyM.copyWith(
                              fontSize: 28,
                              color: const Color(0xFF595959),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset(
                                'assets/images/svg/border_qr.svg',
                                width: qrSize + 40,
                                height: qrSize + 40,
                              ),
                              QrImageView(
                                data:
                                    'https://1qr.kz/status/${widget.id}/${sl<HostStorage>().getHost() ?? ''}',
                                version: QrVersions.auto,
                                errorCorrectionLevel: QrErrorCorrectLevel.L,
                                size: qrSize,
                                dataModuleStyle: const QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.circle,
                                  color: Colors.black,
                                ),
                                eyeStyle: const QrEyeStyle(
                                  eyeShape: QrEyeShape.square,
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                top: -40,
                                right: -215,
                                child: SvgPicture.asset(
                                  AppSvgImages.arrow,
                                  height: 300,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "или сфотографируйте экран\nс QR и покажите на кассе",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyM.copyWith(
                              fontSize: 28,
                              color: const Color(0xFF9E9B98),
                            ),
                          ),
                          const SizedBox(height: 28),
                          const _TicketSeparator(),
                          const SizedBox(height: 28),
                          Text(
                            '*чек вы получите вместе с заказом',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyM.copyWith(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: GestureDetector(
                              onTap: () {
                                _closeController.stop();
                                _onClose();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Container(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: _closeController.value,
                                        child: Container(
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 24, horizontal: 24),
                                        child: Text(
                                          LocaleKeys.close.tr(),
                                          style: AppTextStyles.bodyM.copyWith(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 56),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _TicketSeparator extends StatelessWidget {
  const _TicketSeparator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: const Size(double.infinity, 2),
              painter: _DashedLinePainter(),
            ),
          ),
          Positioned(
            left: -50,
            top: 0,
            bottom: 0,
            child: Container(
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -50,
            top: 0,
            bottom: 0,
            child: Container(
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const dashWidth = 12.0;
    const dashSpace = 10.0;
    double startX = 50.0;

    while (startX < size.width - 50) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
