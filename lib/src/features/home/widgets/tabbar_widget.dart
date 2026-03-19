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
import 'package:sizer/sizer.dart';

class TabbarWidget extends StatefulWidget {
  const TabbarWidget({
    super.key,
    required this.tabController,
    this.isTablet = false,
  });

  final TabController tabController;
  final bool isTablet;

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
    final radius = widget.isTablet ? 16.0 : 12.0;
    final iconHeight = widget.isTablet ? 2.2.sh : null;
    final fontSize = widget.isTablet ? 14.5.sp : 14.sp;
    final tabHeight = widget.isTablet ? 4.5.sh : null;
    final tabPadding = widget.isTablet
        ? const EdgeInsets.symmetric(horizontal: 12, vertical: 6)
        : AppPaddings.all4;
    final iconSpacer = widget.isTablet ? 1.0 : 0.8;

    return Padding(
      padding: AppPaddings.horizontal12,
      child: Container(
        decoration: BoxDecoration(
          color: AppComponents.buttongroupButtonGrayBgColorDefault,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          boxShadow: widget.isTablet
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: TabBar(
          tabAlignment: TabAlignment.fill,
          padding: tabPadding,
          controller: widget.tabController,
          unselectedLabelColor:
              AppComponents.buttongroupButtonGrayTextColorDefault,
          unselectedLabelStyle: AppTextStyles.bodyLStrong.copyWith(
            fontSize: fontSize,
          ),
          labelColor: AppComponents.buttongroupButtonPrimaryTextColorDefault,
          labelStyle: AppTextStyles.bodyLStrong.copyWith(
            fontSize: fontSize,
          ),
          indicatorWeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: AppColors.none,
          indicator: BoxDecoration(
            color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
            borderRadius: BorderRadius.all(Radius.circular(radius - 2)),
            boxShadow: widget.isTablet
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          tabs: [
            Tab(
              height: tabHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<Color?>(
                    tween: ColorTween(
                      begin: index == 0
                          ? AppColors.primitiveNeutralcold1000
                          : AppColors.primitiveNeutralcold0,
                      end: index == 0
                          ? AppColors.primitiveNeutralcold0
                          : AppColors.primitiveNeutralcold1000,
                    ),
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    builder: (context, color, _) => SvgPicture.asset(
                      AppSvgImages.restaurantWhite,
                      height: iconHeight,
                      color: color ?? AppColors.primitiveNeutralcold1000,
                    ),
                  ),
                  RowSpacer(iconSpacer),
                  Text(LocaleKeys.inTheHall.tr()),
                ],
              ),
            ),
            Tab(
              height: tabHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<Color?>(
                    tween: ColorTween(
                      begin: index == 1
                          ? AppColors.primitiveNeutralcold1000
                          : AppColors.primitiveNeutralcold0,
                      end: index == 1
                          ? AppColors.primitiveNeutralcold0
                          : AppColors.primitiveNeutralcold1000,
                    ),
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    builder: (context, color, _) => SvgPicture.asset(
                      AppSvgImages.walk,
                      height: iconHeight,
                      color: color ?? AppColors.primitiveNeutralcold1000,
                    ),
                  ),
                  RowSpacer(iconSpacer),
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
