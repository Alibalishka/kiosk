import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/vm/service/table_orders_service.dart';
import 'package:qr_pay_app/src/features/home/widgets/table_orders_overlay.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/table_orders_response.dart';

/// «Заказы стола» в тулбаре меню.
///
/// Тёмная плашка, как у номера стола рядом: читается и на белом тулбаре, и
/// поверх картинки раскрытого хедера. Справа — этап стола, а если заказ не
/// дошёл до кассы — красное «позовите официанта». Пока стол неизвестен,
/// кнопки нет.
class TableOrdersButton extends StatelessWidget {
  const TableOrdersButton({
    super.key,
    required this.service,
    required this.onTap,
  });

  final TableOrdersService service;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: service,
      builder: (context, _) {
        if (!service.hasTable) return const SizedBox.shrink();

        final stage = service.tableStage;
        final ({Color color, String label})? status = service.needsWaiter
            ? (
                color: AppColors.semanticErrorDefault,
                label: LocaleKeys.tableOrdersCallWaiter.tr(),
              )
            : stage == null || stage == OrderStage.unknown
                ? null
                : (
                    color: orderStageColor(stage),
                    label: orderStageLabel(stage)
                  );

        return Padding(
          padding: const EdgeInsets.only(right: 12),
          // AppBar растягивает actions по высоте тулбара — Center возвращает
          // плашке её собственную высоту.
          child: Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color:
                      AppColors.primitiveNeutralcold1000.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color:
                        AppColors.primitiveNeutralcold0.withValues(alpha: 0.14),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.receipt_long_rounded,
                        size: 22,
                        color: AppColors.primitiveNeutralcold0
                            .withValues(alpha: 0.8),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        LocaleKeys.tableOrders.tr(),
                        style: AppTextStyles.bodyMStrong.copyWith(
                          color: AppColors.primitiveNeutralcold0,
                          height: 1.1,
                        ),
                      ),
                      if (status != null) ...[
                        const SizedBox(width: 10),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: status.color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: Text(
                                status.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodySstrong.copyWith(
                                  color: AppColors.primitiveNeutralcold0,
                                  height: 1.1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
