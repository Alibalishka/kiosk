import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/extensions/map_indexed.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/vibration.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = <_NavbarItemFactory>[
      _NavbarItemFactory(
        AppSvgImages.home,
        LocaleKeys.main.tr(),
        AppSvgImages.homeFill,
      ),
      // _NavbarItemFactory(
      //   null,
      //   '',
      //   null,
      // ),
      _NavbarItemFactory(
        AppSvgImages.user,
        LocaleKeys.profile.tr(),
        AppSvgImages.userFill,
      ),
    ].mapIndexedToList((value, int index) => value.build(index, context));

    return BottomAppBar(
      color: AppComponents.tabbarBgColorDefault,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttons,
      ),
    );
  }
}

bool isScrolTop = true;

class _NavbarItemFactory {
  final String? icon;
  final String name;
  final String? iconFill;

  _NavbarItemFactory(
    this.icon,
    this.name,
    this.iconFill,
  );

  GestureDetector build(int index, BuildContext context) {
    final tabs = AutoTabsRouter.of(context);
    final current = AutoTabsRouter.of(context, watch: true).activeIndex;

    return GestureDetector(
      onTap: () async {
        Vibration.vibrate();
        tabs.setActiveIndex(index);
        if (index == 0) {
          isScrolTop
              ? context.read<HomeVm>().scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  )
              : isScrolTop = true;
        } else {
          isScrolTop = false;
        }
      },
      child: Container(
        color: AppColors.none,
        width: context.mediaQuery.size.width / 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ColumnSpacer(1),
            index == current
                ? SvgPicture.asset(
                    iconFill ?? '',
                    color: AppComponents.tabbarTabbaritemActiveIconColorDefault,
                  )
                : SvgPicture.asset(
                    icon ?? '',
                    color: AppComponents.tabbarTabbaritemActiveIconColorDefault,
                  ),
            const ColumnSpacer(0.8),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyM
                  .copyWith(color: AppColors.semanticFgDefault),
            ),
            const ColumnSpacer(1),
          ],
        ),
      ),
    );
  }

  Future<void> popUntilRoot(TabsRouter tabsRouter) async {
    if (
        // tabsRouter.current.router.canPopSelfOrChildren
        tabsRouter.current.router.canPop()) {
      await tabsRouter.current.router
          .popTop()
          .then((value) async => popUntilRoot(tabsRouter));
    }
    return;
  }
}
