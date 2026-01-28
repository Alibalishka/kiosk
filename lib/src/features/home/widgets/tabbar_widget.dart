import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  int index = 0;

  @override
  void initState() {
    widget.tabController
        .addListener(() => setState(() => index = widget.tabController.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal12,
      child: Container(
        decoration: const BoxDecoration(
          color: AppComponents.buttongroupButtonGrayBgColorDefault,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: TabBar(
          tabAlignment: TabAlignment.fill,
          padding: AppPaddings.all4,
          controller: widget.tabController,
          unselectedLabelColor:
              AppComponents.buttongroupButtonGrayTextColorDefault,
          unselectedLabelStyle: AppTextStyles.bodyLStrong,
          labelColor: AppComponents.buttongroupButtonPrimaryTextColorDefault,
          labelStyle: AppTextStyles.bodyLStrong,
          indicatorWeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: AppColors.none,
          indicator: const BoxDecoration(
            color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration.zero, // Длительность анимации
                    curve: Curves.easeInOut, // Кривая анимации
                    child: SvgPicture.asset(
                      AppSvgImages.restaurantWhite,
                      color: index == 0
                          ? AppColors.primitiveNeutralcold0
                          : AppColors.primitiveNeutralcold1000,
                    ),
                  ),
                  const RowSpacer(0.8),
                  Text(LocaleKeys.dineIn.tr()),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration.zero, // Длительность анимации
                    curve: Curves.easeInOut, // Кривая анимации
                    child: SvgPicture.asset(
                      AppSvgImages.walk,
                      color: index == 1
                          ? AppColors.primitiveNeutralcold0
                          : AppColors.primitiveNeutralcold1000,
                    ),
                  ),
                  const RowSpacer(0.8),
                  Text(LocaleKeys.takeaway.tr()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
