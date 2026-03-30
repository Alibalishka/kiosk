import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';

class QrMenuBottomBar extends StatelessWidget {
  const QrMenuBottomBar({
    super.key,
    required this.viewModel,
  });

  final QrMenuVm viewModel;

  @override
  Widget build(BuildContext context) {
    final hasBasketItems = viewModel.basketService.basket.isNotEmpty;
    if (!hasBasketItems) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: AppComponents.buttondockBgColorDefault,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      child: SafeArea(
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(16),
          onPressed: () => viewModel.isKioskMode
              ? context.router.push(const TabletCheckoutPageRoute())
              : context.router.push(const QrMenuCheckoutPageRoute()),
          color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.order.tr(),
                style: AppTextStyles.bodyLStrong.copyWith(
                  fontSize: 15.sp,
                  color: AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
              ),
              Text(
                priceFormat(
                  ' ${priceFormat(viewModel.getTotalPrice().toInt().toString())} ₸',
                ),
                style: AppTextStyles.bodyLStrong.copyWith(
                  fontSize: 15.sp,
                  color: AppComponents.buttongroupButtonPrimaryTextColorDefault,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

