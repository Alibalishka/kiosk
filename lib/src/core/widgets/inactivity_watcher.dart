import 'dart:async';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/custom_button2.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class InactivityWatcher extends StatefulWidget {
  final Widget child;

  /// Включает/выключает трекинг бездействия (киоск-режим)
  final bool isKioskMode;

  /// Через сколько секунд бездействия показать диалог
  final Duration inactivityDuration;

  /// Сколько секунд даётся на ответ в диалоге
  final Duration decisionDuration;

  /// Колбэк, если пользователь выбрал "Остаться"
  final VoidCallback? onStay;

  /// Колбэк, если пользователь выбрал "Выйти"
  /// (также вызывается при автозакрытии по таймеру)
  final VoidCallback? onLeave;

  // final String title;
  final String message;
  // final String stayText;
  // final String leaveText;

  const InactivityWatcher({
    super.key,
    required this.child,
    this.isKioskMode = false,
    this.inactivityDuration = const Duration(seconds: 20),
    this.decisionDuration = const Duration(seconds: 10),
    this.onStay,
    this.onLeave,
    // this.title = 'Хотите продолжить заказ?',
    this.message = '',
    // this.stayText = 'Да',
    // this.leaveText = 'Нет',
  });

  @override
  State<InactivityWatcher> createState() => _InactivityWatcherState();
}

class _InactivityWatcherState extends State<InactivityWatcher> {
  Timer? _inactivityTimer;
  bool _dialogOpen = false;

  @override
  void initState() {
    super.initState();

    if (widget.isKioskMode) {
      _startInactivityTimer();
    }
  }

  @override
  void didUpdateWidget(covariant InactivityWatcher oldWidget) {
    super.didUpdateWidget(oldWidget);

    // если режим поменяли на лету
    if (oldWidget.isKioskMode != widget.isKioskMode) {
      _inactivityTimer?.cancel();
      _inactivityTimer = null;
      _dialogOpen = false;

      if (widget.isKioskMode) {
        _startInactivityTimer();
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!widget.isKioskMode) return;

    final route = ModalRoute.of(context);
    // если этот роут снова стал текущим и таймера нет — запускаем
    if (route != null &&
        route.isCurrent &&
        _inactivityTimer == null &&
        !_dialogOpen) {
      _startInactivityTimer();
    }
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(widget.inactivityDuration, _onInactivity);
  }

  void _onUserInteraction() {
    if (!widget.isKioskMode) return;
    if (_dialogOpen) return;
    _startInactivityTimer();
  }

  Future<void> _onInactivity() async {
    if (!mounted) return;

    // таймер отработал — считаем, что его больше нет
    _inactivityTimer = null;

    if (_dialogOpen || !widget.isKioskMode) return;

    // ВАЖНО: не показываем диалог, если страница не на вершине стека
    final route = ModalRoute.of(context);
    if (route != null && !route.isCurrent) {
      // мы сейчас под другим экраном → просто игнорируем этот таймаут
      return;
    }

    _dialogOpen = true;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      // важный момент: делаем прозрачный barrier,
      // чтобы блюр рисовали мы сами
      barrierColor: Colors.transparent,
      builder: (ctx) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 8.0,
            sigmaY: 8.0,
          ),
          child: Container(
            // лёгкое затемнение поверх блюра
            color: Colors.black.withOpacity(0.35),
            child: _InactivityDialog(
              title: LocaleKeys.continueOrder.tr(),
              message: widget.message,
              stayText: LocaleKeys.yes.tr(),
              leaveText: LocaleKeys.no.tr(),
              decisionDuration: widget.decisionDuration,
            ),
          ),
        );
      },
    );

    _dialogOpen = false;

    if (result == true) {
      widget.onStay?.call();
      if (widget.isKioskMode) {
        _startInactivityTimer();
      }
    } else {
      widget.onLeave?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    // если киоск режим выключен — просто возвращаем child, без слушателей
    if (!widget.isKioskMode) {
      return widget.child;
    }
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _onUserInteraction(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _onUserInteraction();
          return false;
        },
        child: widget.child,
      ),
    );
  }
}

/// Собственно диалог с таймером
class _InactivityDialog extends StatefulWidget {
  final String title;
  final String message;
  final String stayText;
  final String leaveText;
  final Duration decisionDuration;

  const _InactivityDialog({
    required this.title,
    required this.message,
    required this.stayText,
    required this.leaveText,
    required this.decisionDuration,
  });

  @override
  State<_InactivityDialog> createState() => _InactivityDialogState();
}

class _InactivityDialogState extends State<_InactivityDialog> {
  late int _secondsLeft;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsLeft = widget.decisionDuration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (_secondsLeft <= 1) {
        t.cancel();
        Navigator.of(context, rootNavigator: true).pop(false); // автовыход
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Диалог в стиле твоего киоска
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headingH1.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton2(
                            text: '${widget.leaveText} ($_secondsLeft)',
                            fontSize: 14.sp,
                            backgroundColor: AppColors.none,
                            borderRadius: 16,
                            // borderColor: AppComponents
                            //     .buttongroupButtonSecondaryBorderColorDefault,
                            onPressed: () => context.router.pop(),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomButton(
                            text: widget.stayText,
                            fontSize: 15.sp,
                            borderRadius: 16,
                            onPressed: () => context.router.pop(true),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () => context.router.pop(true),
                    child: SvgPicture.asset(
                      AppSvgImages.closeLarge,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
