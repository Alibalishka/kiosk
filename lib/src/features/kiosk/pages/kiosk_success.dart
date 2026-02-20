import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_order_bloc/history_order_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class KioskSuccessPage extends StatefulWidget {
  const KioskSuccessPage({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<KioskSuccessPage> createState() => _KioskSuccessPageState();
}

class _KioskSuccessPageState extends State<KioskSuccessPage>
    with SingleTickerProviderStateMixin {
  late HistoryOrderBloc bloc;
  late final AnimationController _closeController;

  @override
  void initState() {
    super.initState();

    bloc = HistoryOrderBloc(authRepository: sl<AuthRepository>())
      ..add(HistoryOrderEvent.fetchHistoryDetailOrder(id: widget.id));

    _closeController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 30,
      ),
    )
      ..addListener(() {
        // перерисовываемся, чтобы анимация заполняла кнопку
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
  // late HistoryOrderBloc bloc;
  // Timer? _closeTimer;

  // @override
  // void initState() {
  //   super.initState();
  //   bloc = HistoryOrderBloc(authRepository: sl<AuthRepository>())
  //     ..add(HistoryOrderEvent.fetchHistoryDetailOrder(id: widget.id));

  //   _closeTimer = Timer(const Duration(seconds: 30), () {
  //     if (mounted) {
  //       context.read<QrMenuVm>().clearBasket();
  //       context.read<QrMenuVm>().fetchMenu();
  //       context.router.popUntil(
  //           (route) => route.settings.name == QrMenuProviderRoute.name);
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _closeTimer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        builder: (context, state) => state.maybeWhen(
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
          successDetail: (response) => Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () => context.router.pop(),
                    child: Text(
                      LocaleKeys.yourOrderNumber.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headingH3.copyWith(
                        fontSize: 42,
                      ),
                    ),
                  ),
                  const ColumnSpacer(4),
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: const BoxDecoration(
                      color: AppColors.semanticBgSurface4,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          LocaleKeys.scanAndPayDescription.tr(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyM.copyWith(
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          response.data?.numberGenerated.toString() ?? '',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headingH3.copyWith(
                            fontSize: 100,
                          ),
                        ),
                        Text(
                          response.data?.fullName ?? '',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headingH3.copyWith(
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ColumnSpacer(4),
                  GestureDetector(
                    onTap: () {
                      _closeController
                          .stop(); // чтобы не дёрнуть _onClose второй раз
                      _onClose();
                    },
                    child: SizedBox(
                      height: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Stack(
                          children: [
                            // базовый фон кнопки
                            Positioned.fill(
                              child: Container(
                                color: AppColors.primitiveNeutralcold1000,
                              ),
                            ),
                            // заполняющийся слой (прогресс)
                            Positioned.fill(
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor:
                                    _closeController.value, // 0 → 1 за 30 сек
                                child: Container(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                            ),
                            // текст поверх
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                child: Text(
                                  LocaleKeys.close.tr(),
                                  style: AppTextStyles.bodyM.copyWith(
                                    fontSize: context.read<QrMenuVm>().isTablet
                                        ? 18.sp
                                        : 18,
                                    color: AppComponents
                                        .buttongroupButtonPrimaryTextColorDefault,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const ColumnSpacer(3),
                  Text(
                    LocaleKeys.checkWithOrder.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyM.copyWith(
                      fontSize: 26,
                      color: AppColors.primitiveNeutralcold500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WaterFillPainter extends CustomPainter {
  final double progress; // 0..1
  final Color waterColor;
  final Color underWaterColor;

  _WaterFillPainter({
    required this.progress,
    required this.waterColor,
    required this.underWaterColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final double filledWidth = size.width * progress;

    // фон под водой (чуть затемнённый)
    final underPaint = Paint()..color = underWaterColor;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, filledWidth, size.height),
      underPaint,
    );

    // сама "вода" с волной сверху
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x80FFFFFF),
          Color(0x40FFFFFF),
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, filledWidth, size.height),
      );

    final Path path = Path();

    final double baseY = size.height * 0.30; // базовая высота волны от верха
    final double amplitude = 6; // амплитуда
    final double waveLength = filledWidth / 1.5;

    // начинаем с левого низа
    path.moveTo(0, size.height);
    path.lineTo(filledWidth, size.height);

    // волна сверху (рисуем справа налево)
    final double phase = progress * 4 * math.pi; // движение волны

    for (double x = filledWidth; x >= 0; x -= filledWidth / 24) {
      final double y =
          baseY + math.sin((x / waveLength * 2 * math.pi) + phase) * amplitude;
      path.lineTo(x, y);
    }

    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WaterFillPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
