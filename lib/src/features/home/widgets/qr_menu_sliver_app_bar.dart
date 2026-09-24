import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/kiosk_table_badge.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_category_tabs.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_layout.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_header.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/language.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

class QrMenuSliverAppBar extends StatelessWidget {
  const QrMenuSliverAppBar({
    super.key,
    required this.viewModel,
    required this.currentLanguageCode,
    required this.onLanguageTap,
  });

  final QrMenuVm viewModel;
  final String currentLanguageCode;
  final VoidCallback onLanguageTap;

  @override
  Widget build(BuildContext context) {
    final hasRecommend =
        viewModel.menuData?.effectiveRecommend.isNotEmpty ?? false;
    // В альбоме рекомендации живут в левой панели, а не в раскрытом хедере:
    // width / 1.3 там выше самого экрана. headerExpandedHeight == null —
    // значит хедера в скролле нет, тулбар сразу «схлопнут».
    final headerHeight = QrMenuLayout.of(context, hasRecommend: hasRecommend)
        .headerExpandedHeight;
    final showHeader = headerHeight != null;

    return SliverAppBar(
      pinned: true,
      floating: false,
      stretch: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: AppColors.none,
      shape: const Border(
        bottom: BorderSide(
          color: AppComponents.buttongroupButtonWhiteBgColorDefault,
          width: 0,
        ),
      ),
      expandedHeight: headerHeight,
      surfaceTintColor: AppColors.none,
      backgroundColor: AppColors.semanticBgSurface1,
      title: AnimatedOpacity(
        // 500 мс заметно отстаёт от пальца при прокрутке.
        duration: const Duration(milliseconds: 220),
        opacity: showHeader && viewModel.isAtStart ? 0 : 1,
        child: Text(
          viewModel.detailVm?.data.data?.name ?? LocaleKeys.menu.tr(),
          style: AppTextStyles.headingH3.copyWith(
            color: AppColors.semanticFgDefault,
          ),
        ),
      ),
      // 16 (отступ от края) + 40 (зона нажатия) — тот же ритм, что справа.
      leadingWidth: 56,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            viewModel.kioskService.onUserInteraction();
            viewModel.switchView();
          },
          child: SizedBox(
            width: 40,
            child: Center(
              child: SvgPicture.asset(
                viewModel.isGridView
                    ? AppSvgImages.list
                    : AppSvgImages.gridview,
                width: 32,
                height: 32,
                color: AppColors.primitiveNeutralcold1000,
              ),
            ),
          ),
        ),
      ),
      actions: [
        KioskTableBadge(
          groupName: viewModel.kioskSection?.groupName,
          number: viewModel.kioskSection?.number,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onLanguageTap,
            child: SizedBox(
              width: 40,
              child: Center(
                child: SvgPicture.asset(
                  Language.icons[currentLanguageCode] ?? AppSvgImages.russia,
                  width: 32,
                ),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: showHeader
          ? FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              collapseMode: CollapseMode.none,
              background: ColoredBox(
                color: Colors.black,
                child: RepaintBoundary(
                  child: QrMenuHeaderBackground(
                    viewModel: viewModel,
                    context: context,
                  ),
                ),
              ),
            )
          : null,
      bottom: QrMenuCategoryTabs(viewModel: viewModel),
    );
  }
}
