import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/qr_menu_category_tabs.dart';
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
    final hasRecommend = viewModel.menuData?.recommend?.isNotEmpty ?? false;

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
      expandedHeight:
          hasRecommend ? MediaQuery.of(context).size.width / 1.3 : null,
      surfaceTintColor: AppColors.none,
      backgroundColor: AppColors.semanticBgSurface1,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: viewModel.isAtStart ? 0 : 1,
        child: Text(
          viewModel.detailVm?.data.data?.name ?? 'Меню',
          style: AppTextStyles.headingH3.copyWith(
            color: AppColors.semanticFgDefault,
          ),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          viewModel.kioskService.onUserInteraction();
          viewModel.switchView();
        },
        child: SizedBox(
          height: 100,
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SvgPicture.asset(
              viewModel.isGridView ? AppSvgImages.list : AppSvgImages.gridview,
              color: AppColors.primitiveNeutralcold1000,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: onLanguageTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              Language.icons[currentLanguageCode] ?? AppSvgImages.russia,
              width: 32,
            ),
          ),
        ),
      ],
      flexibleSpace: hasRecommend
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
