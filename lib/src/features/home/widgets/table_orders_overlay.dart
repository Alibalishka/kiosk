import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/vm/service/table_orders_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/empty_table_illustration.dart';
import 'package:qr_pay_app/src/features/home/widgets/kiosk_table_badge.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';

/// Подпись этапа готовности. У неизвестного этапа подписи нет.
String orderStageLabel(OrderStage stage) => switch (stage) {
      OrderStage.accepted => LocaleKeys.tableOrderStageNew.tr(),
      OrderStage.cooking => LocaleKeys.tableOrderStageCooking.tr(),
      OrderStage.ready => LocaleKeys.tableOrderStageReady.tr(),
      OrderStage.issued => LocaleKeys.tableOrderStageIssued.tr(),
      OrderStage.unknown => '',
    };

/// Цвет этапа — тот же, что у плашки этапа в карточке заказа.
Color orderStageColor(OrderStage stage) => _StageLook.of(stage).color;

bool _isKnown(OrderStage? stage) =>
    stage != null && stage != OrderStage.unknown;

/// «Заказы стола»: что заказано, на каком этапе и как оплачено.
///
/// Живёт в стеке страницы меню под рекламой, как и помощник: иначе
/// скринсейвер оказался бы под ним. Данные приносит [TableOrdersService] —
/// он опрашивает сервер в своём темпе, экран только показывает. Закрывается
/// сам после простоя.
class TableOrdersOverlay extends StatefulWidget {
  const TableOrdersOverlay({
    super.key,
    required this.service,
    required this.idleTimeout,
    required this.onClose,
    this.groupName,
    this.tableNumber,
  });

  final TableOrdersService service;

  /// Через сколько без касаний экран закрывается сам.
  final Duration idleTimeout;
  final VoidCallback onClose;
  final String? groupName;
  final String? tableNumber;

  @override
  State<TableOrdersOverlay> createState() => _TableOrdersOverlayState();
}

class _TableOrdersOverlayState extends State<TableOrdersOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _presence = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 320),
  )..forward();

  late final CurvedAnimation _presenceCurve = CurvedAnimation(
    parent: _presence,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );

  Timer? _idle;
  bool _closing = false;

  @override
  void initState() {
    super.initState();
    _restartIdle();
  }

  @override
  void dispose() {
    _idle?.cancel();
    _presenceCurve.dispose();
    _presence.dispose();
    super.dispose();
  }

  /// Свой таймер простоя: если в меню нет скринсейвера, реклама экран не
  /// закроет, и планшет так и остался бы на заказах.
  void _restartIdle() {
    _idle?.cancel();
    _idle = Timer(widget.idleTimeout, _close);
  }

  Future<void> _close() async {
    if (_closing) return;
    _closing = true;
    _idle?.cancel();
    await _presence.reverse();
    if (mounted) widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final presence = _presenceCurve;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _close();
      },
      child: Listener(
        onPointerDown: (_) => _restartIdle(),
        child: FadeTransition(
          opacity: presence,
          child: Material(
            color: AppColors.semanticBgSurface2,
            child: SafeArea(
              child: AnimatedBuilder(
                animation: presence,
                builder: (context, child) => Transform.translate(
                  offset: Offset(0, 32 * (1 - presence.value)),
                  child: child,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 880),
                    child: Column(
                      children: [
                        _Header(
                          groupName: widget.groupName,
                          tableNumber: widget.tableNumber,
                          onClose: _close,
                        ),
                        Expanded(
                          child: ListenableBuilder(
                            listenable: widget.service,
                            builder: (context, _) => _buildBody(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final service = widget.service;

    switch (service.status) {
      case TableOrdersStatus.loading:
        return const Center(child: CupertinoActivityIndicator(radius: 16));
      case TableOrdersStatus.unavailable:
        return _Placeholder(
          visual: const _PlaceholderIcon(Icons.wifi_off_rounded),
          title: LocaleKeys.tableOrdersUnavailable.tr(),
          hint: LocaleKeys.tableOrdersRetryHint.tr(),
        );
      case TableOrdersStatus.invalidTable:
        return _Placeholder(
          visual: const _PlaceholderIcon(Icons.error_outline_rounded),
          title: LocaleKeys.tableOrdersInvalidTable.tr(),
        );
      case TableOrdersStatus.ready:
        break;
    }

    final orders = service.orders;
    if (orders.isEmpty) {
      return _Placeholder(
        visual: EmptyTableIllustration(
          // Экран пустой — иллюстрации можно дать место.
          width: (MediaQuery.sizeOf(context).shortestSide * 0.42)
              .clamp(260.0, 420.0),
        ),
        title: LocaleKeys.tableOrdersEmpty.tr(),
        hint: LocaleKeys.tableOrdersEmptyHint.tr(),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        if (service.stale) ...[
          _Notice(
            icon: Icons.wifi_off_rounded,
            color: AppColors.semanticWarningDefault,
            text: LocaleKeys.tableOrdersStale.tr(),
          ),
          const SizedBox(height: 16),
        ],
        for (final (index, order) in orders.indexed) ...[
          if (index > 0) const SizedBox(height: 16),
          TableOrderCard(order: order),
        ],
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.onClose,
    this.groupName,
    this.tableNumber,
  });

  final VoidCallback onClose;
  final String? groupName;
  final String? tableNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.tableOrders.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headingH2.copyWith(
                fontSize: 18.sp,
                color: AppColors.semanticFgDefault,
              ),
            ),
          ),
          KioskTableBadge(groupName: groupName, number: tableNumber),
          _CloseButton(onTap: onClose),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.semanticBgSurface1,
          shape: BoxShape.circle,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.semanticBorderSoft),
          ),
        ),
        child: SizedBox.square(
          dimension: 56,
          child: Icon(
            Icons.close_rounded,
            color: AppColors.semanticFgDefault,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class _PlaceholderIcon extends StatelessWidget {
  const _PlaceholderIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) =>
      Icon(icon, size: 72, color: AppColors.semanticFgSoft);
}

/// Пустой стол, нет связи, неверный стол — крупно по центру.
class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.visual, required this.title, this.hint});

  final Widget visual;
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                visual,
                const SizedBox(height: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headingH3.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.semanticFgDefault,
                  ),
                ),
                if (hint != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    hint!,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyL.copyWith(
                      fontSize: 13.sp,
                      color: AppColors.semanticFgSoft,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Карточка заказа стола: шапка с номером и оплатой, этап — один раз,
/// крупной плашкой, позиции по раундам и итог.
class TableOrderCard extends StatelessWidget {
  const TableOrderCard({super.key, required this.order});

  final TableOrder order;

  @override
  Widget build(BuildContext context) {
    final failed = order.status == TableOrderStatus.error;
    final rounds = order.sortedRounds;
    // Подписи раундов нужны, когда их несколько или позиции официанта ещё
    // не ушли на кухню: иначе время повторяет шапку карточки.
    final showRoundTitles =
        rounds.length > 1 || rounds.any((round) => round.at == null);
    final status = _status();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.semanticBgSurface1,
        borderRadius: BorderRadius.circular(24),
        border: failed
            ? Border.all(color: AppColors.semanticErrorDefault, width: 2)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _OrderTitle(order: order),
            if (status != null) ...[const SizedBox(height: 16), status],
            for (final (index, round) in rounds.indexed) ...[
              if (index == 0)
                const SizedBox(height: 24)
              else
                const _Separator(),
              if (showRoundTitles) ...[
                Text(
                  _roundTitle(rounds, index),
                  style: AppTextStyles.bodySstrong.copyWith(
                    fontSize: 12.sp,
                    letterSpacing: 0.4,
                    color: AppColors.semanticFgSoft,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              for (final (itemIndex, item)
                  in (round.items ?? const <TableOrderItem>[]).indexed) ...[
                if (itemIndex > 0) const SizedBox(height: 14),
                _ItemRow(
                  item: item,
                  // Этап заказа уже назван в плашке — у позиции подписываем
                  // только отличие. У заказа, не дошедшего до кассы, этапов
                  // нет вовсе.
                  showStage: !failed && item.stage != order.stage,
                ),
              ],
            ],
            const _Separator(),
            _Total(total: order.total),
          ],
        ),
      ),
    );
  }

  Widget? _status() {
    if (order.status == TableOrderStatus.error) {
      return _StatusBanner(
        look: _StageLook.error,
        title: LocaleKeys.tableOrderErrorTitle.tr(),
        hint: LocaleKeys.tableOrdersCallWaiter.tr(),
      );
    }

    final stage = order.stage;
    final bill = order.status == TableOrderStatus.bill;
    if (_isKnown(stage)) {
      return _StatusBanner(
        look: _StageLook.of(stage!),
        title: orderStageLabel(stage),
        hint: bill ? LocaleKeys.tableOrderBill.tr() : _stageHint(stage),
        progress: stage,
      );
    }
    if (bill) {
      return _Notice(
        icon: Icons.receipt_long_rounded,
        color: AppColors.semanticInfoDefault,
        text: LocaleKeys.tableOrderBill.tr(),
      );
    }
    return null;
  }

  /// «Заказ · 21:36», «Дозаказ · 21:50», «Добавил официант · ещё не на
  /// кухне».
  static String _roundTitle(List<TableOrderRound> rounds, int index) {
    final round = rounds[index];
    final String label;
    if (round.source == OrderRoundSource.waiter) {
      label = LocaleKeys.tableOrderRoundWaiter.tr();
    } else {
      final firstGuestRound =
          rounds.indexWhere((r) => r.source != OrderRoundSource.waiter);
      label = index == firstGuestRound
          ? LocaleKeys.tableOrderRoundFirst.tr()
          : LocaleKeys.tableOrderRoundMore.tr();
    }

    final at = round.at;
    final when = at == null
        ? LocaleKeys.tableOrderRoundPending.tr()
        : hourMinutes.format(at.toLocal());
    return '$label · $when'.toUpperCase();
  }
}

/// Что гостю ждать на этом этапе.
String _stageHint(OrderStage stage) => switch (stage) {
      OrderStage.accepted => LocaleKeys.tableOrderHintNew.tr(),
      OrderStage.cooking => LocaleKeys.tableOrderHintCooking.tr(),
      OrderStage.ready => LocaleKeys.tableOrderHintReady.tr(),
      OrderStage.issued => LocaleKeys.tableOrderHintIssued.tr(),
      OrderStage.unknown => '',
    };

/// Цвет этапа для заливки, тёмный тон того же цвета для текста на светлом
/// фоне и иконка.
class _StageLook {
  const _StageLook(this.color, this.ink, this.icon);

  final Color color;
  final Color ink;
  final IconData icon;

  /// Принят — синий, готовится — оранжевый, готово — зелёный, подано —
  /// серый: ждать больше нечего.
  static _StageLook of(OrderStage stage) => switch (stage) {
        OrderStage.accepted => const _StageLook(
            AppColors.primitiveBlue500,
            AppColors.primitiveBlue700,
            Icons.receipt_long_rounded,
          ),
        OrderStage.cooking => const _StageLook(
            AppColors.primitiveOrange500,
            AppColors.primitiveOrange700,
            Icons.local_fire_department_rounded,
          ),
        OrderStage.ready => const _StageLook(
            AppColors.primitiveGreen500,
            AppColors.primitiveGreen700,
            Icons.room_service_rounded,
          ),
        OrderStage.issued || OrderStage.unknown => const _StageLook(
            AppColors.primitiveNeutralcold600,
            AppColors.primitiveNeutralcold800,
            Icons.check_rounded,
          ),
      };

  static const error = _StageLook(
    AppColors.semanticErrorDefault,
    AppColors.semanticErrorDefault,
    Icons.priority_high_rounded,
  );
}

class _OrderTitle extends StatelessWidget {
  const _OrderTitle({required this.order});

  final TableOrder order;

  @override
  Widget build(BuildContext context) {
    final number = order.posNumber;
    final createdAt = order.createdAt;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number == null
                    ? LocaleKeys.tableOrderRoundFirst.tr()
                    : LocaleKeys.tableOrderNumber.tr(
                        namedArgs: {'number': '$number'},
                      ),
                style: AppTextStyles.headingH3.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.semanticFgDefault,
                ),
              ),
              if (createdAt != null)
                Text(
                  hourMinutes.format(createdAt.toLocal()),
                  style: AppTextStyles.bodyL.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.semanticFgSoft,
                  ),
                ),
            ],
          ),
        ),
        _PaymentBadge(order: order),
      ],
    );
  }
}

/// Этап заказа — крупно и один раз: что происходит, чего ждать и сколько
/// пути пройдено.
class _StatusBanner extends StatelessWidget {
  const _StatusBanner({
    required this.look,
    required this.title,
    required this.hint,
    this.progress,
  });

  static const List<OrderStage> _steps = [
    OrderStage.accepted,
    OrderStage.cooking,
    OrderStage.ready,
    OrderStage.issued,
  ];

  final _StageLook look;
  final String title;
  final String hint;

  /// Этап для полосы прогресса. null — полосы нет: заказ не дошёл до кассы.
  final OrderStage? progress;

  @override
  Widget build(BuildContext context) {
    final reached = progress == null ? -1 : _steps.indexOf(progress!);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: look.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: look.color,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox.square(
                    dimension: 52,
                    child: Icon(
                      look.icon,
                      color: AppColors.primitiveNeutralcold0,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.headingH3.copyWith(
                          fontSize: 16.sp,
                          color: look.ink,
                        ),
                      ),
                      if (hint.isNotEmpty)
                        Text(
                          hint,
                          style: AppTextStyles.bodyL.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.semanticFgDefault
                                .withValues(alpha: 0.7),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (reached >= 0) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  for (var index = 0; index < _steps.length; index++) ...[
                    if (index > 0) const SizedBox(width: 6),
                    Expanded(
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: index <= reached
                              ? look.color
                              : look.color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Оплачено, оплата у официанта или ещё не оплачено — в шапке карточки.
class _PaymentBadge extends StatelessWidget {
  const _PaymentBadge({required this.order});

  final TableOrder order;

  @override
  Widget build(BuildContext context) {
    final payment = _payment(order);
    if (payment == null) return const SizedBox.shrink();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: payment.color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(payment.icon, size: 22, color: payment.ink),
            const SizedBox(width: 8),
            Text(
              payment.label,
              style: AppTextStyles.bodyLStrong.copyWith(
                fontSize: 13.sp,
                color: payment.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static ({IconData icon, Color color, Color ink, String label})? _payment(
    TableOrder order,
  ) {
    if (order.paid == true) {
      return (
        icon: Icons.check_circle_rounded,
        color: AppColors.primitiveGreen500,
        ink: AppColors.primitiveGreen700,
        label: LocaleKeys.tableOrderPaid.tr(),
      );
    }
    if (order.paid == null) return null;
    if (order.paymentMethod == OrderPaymentMethod.payAtVenue) {
      return (
        icon: Icons.payments_outlined,
        color: AppColors.primitiveNeutralcold600,
        ink: AppColors.primitiveNeutralcold800,
        label: LocaleKeys.tableOrderPayAtVenue.tr(),
      );
    }
    return (
      icon: Icons.schedule_rounded,
      color: AppColors.primitiveOrange500,
      ink: AppColors.primitiveOrange700,
      label: LocaleKeys.tableOrderNotPaid.tr(),
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item, required this.showStage});

  final TableOrderItem item;
  final bool showStage;

  @override
  Widget build(BuildContext context) {
    final amount = item.amount;
    final sum = item.sum;
    final stage = item.stage;
    final labelled = showStage && _isKnown(stage);
    // Уже поданное, пока остальное ещё в работе, отходит на второй план.
    final color = labelled && stage == OrderStage.issued
        ? AppColors.semanticFgSoft
        : AppColors.semanticFgDefault;
    final secondary = AppTextStyles.bodyM.copyWith(
      fontSize: 13.sp,
      color: AppColors.semanticFgSoft,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                [
                  if (amount != null) '${_formatAmount(amount)} ×',
                  item.name ?? '',
                ].join(' '),
                style: AppTextStyles.bodyL.copyWith(
                  fontSize: 14.sp,
                  color: color,
                ),
              ),
              for (final modifier
                  in item.modifiers ?? const <TableOrderModifier>[])
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(_modifierText(modifier), style: secondary),
                ),
              // if (labelled)
              //   Padding(
              //     padding: const EdgeInsets.only(top: 6),
              //     child: _StageLabel(stage: stage!),
              //   ),
            ],
          ),
        ),
        if (sum != null) ...[
          const SizedBox(width: 16),
          Text(
            '${priceFormat(sum.toString())} ₸',
            style: AppTextStyles.bodyLStrong.copyWith(
              fontSize: 14.sp,
              color: color,
            ),
          ),
        ],
      ],
    );
  }

  static String _modifierText(TableOrderModifier modifier) {
    final amount = modifier.amount;
    final name = modifier.name ?? '';
    return amount == null || amount == 1
        ? name
        : '${_formatAmount(amount)} × $name';
  }
}

/// «✓ Подано» или «● Готово» под позицией, когда её этап не такой, как у
/// заказа.
class _StageLabel extends StatelessWidget {
  const _StageLabel({required this.stage});

  final OrderStage stage;

  @override
  Widget build(BuildContext context) {
    final look = _StageLook.of(stage);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (stage == OrderStage.issued)
          Icon(Icons.check_rounded, size: 18, color: look.ink)
        else
          Container(
            width: 10,
            height: 10,
            decoration:
                BoxDecoration(color: look.color, shape: BoxShape.circle),
          ),
        const SizedBox(width: 6),
        Text(
          orderStageLabel(stage),
          style: AppTextStyles.bodyMStrong.copyWith(
            fontSize: 12.sp,
            color: look.ink,
          ),
        ),
      ],
    );
  }
}

class _Total extends StatelessWidget {
  const _Total({required this.total});

  final int? total;

  @override
  Widget build(BuildContext context) {
    final total = this.total;
    final style = AppTextStyles.headingH3.copyWith(
      fontSize: 16.sp,
      color: AppColors.semanticFgDefault,
    );

    return Row(
      children: [
        Expanded(child: Text(LocaleKeys.total.tr(), style: style)),
        if (total != null)
          Text('${priceFormat(total.toString())} ₸', style: style),
      ],
    );
  }
}

/// Плашка внутри экрана: «заказ не дошёл до кассы», «счёт распечатан»,
/// «нет связи».
class _Notice extends StatelessWidget {
  const _Notice({
    required this.icon,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.bodyLStrong.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.semanticFgDefault,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Divider(height: 1, color: AppColors.semanticBorderSoft),
      );
}

/// У весовых позиций количество дробное: «0.5», иначе — «2».
String _formatAmount(num amount) =>
    amount == amount.roundToDouble() ? '${amount.toInt()}' : '$amount';
