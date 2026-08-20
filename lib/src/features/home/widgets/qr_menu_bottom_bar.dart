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

class QrMenuBottomBar extends StatefulWidget {
  const QrMenuBottomBar({
    super.key,
    required this.viewModel,
  });

  final QrMenuVm viewModel;

  @override
  State<QrMenuBottomBar> createState() => _QrMenuBottomBarState();
}

class _QrMenuBottomBarState extends State<QrMenuBottomBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late bool _hasBasketItems;

  @override
  void initState() {
    super.initState();
    _hasBasketItems = widget.viewModel.basketService.basket.isNotEmpty;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
      value: _hasBasketItems ? 1 : 0,
    );
    widget.viewModel.addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    final hasItems = widget.viewModel.basketService.basket.isNotEmpty;
    if (hasItems == _hasBasketItems) return;
    _hasBasketItems = hasItems;
    if (hasItems) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onViewModelChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      ),
      axisAlignment: 1,
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        ),
        child: Container(
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
            child: AnimatedBuilder(
              animation: viewModel,
              builder: (context, _) {
                final hasBasketItems =
                    viewModel.basketService.basket.isNotEmpty;
                return CupertinoButton(
                  borderRadius: BorderRadius.circular(16),
                  onPressed: !hasBasketItems
                      ? null
                      : () => viewModel.isKioskMode
                          ? context.router.push(const TabletCheckoutPageRoute())
                          : context.router
                              .push(const QrMenuCheckoutPageRoute()),
                  color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.order.tr(),
                        style: AppTextStyles.bodyLStrong.copyWith(
                          fontSize: 15.sp,
                          color: AppComponents
                              .buttongroupButtonPrimaryTextColorDefault,
                        ),
                      ),
                      Text(
                        priceFormat(
                          ' ${priceFormat(viewModel.getTotalPrice().toInt().toString())} ₸',
                        ),
                        style: AppTextStyles.bodyLStrong.copyWith(
                          fontSize: 15.sp,
                          color: AppComponents
                              .buttongroupButtonPrimaryTextColorDefault,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
