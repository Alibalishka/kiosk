import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/item_bloc/item_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/news_bloc/news_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_state.dart';
import 'package:qr_pay_app/src/features/home/provider/story_provider.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/brands.dart';
import 'package:qr_pay_app/src/features/home/widgets/choose_city_sheet.dart';
import 'package:qr_pay_app/src/features/home/widgets/scroll_products.dart';
import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_banner.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_scroll_items.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/qr/widgets/not_authorized_view.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
    required this.viewModel,
  });

  final HomeVm viewModel;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator.adaptive(
        edgeOffset: 25,
        color: AppColors.primitiveNeutralwarm0,
        onRefresh: () => widget.viewModel.refreshRequest().then(
              (value) => widget.viewModel.scrollController
                ..animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 5),
                  curve: Curves.easeInOut,
                ),
            ),
        child: widget.viewModel.isInternetConnection
            ? SingleChildScrollView(
                controller: widget.viewModel.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ColumnSpacer(1.2),
                    BlocProvider<NewsBloc>.value(
                      value: widget.viewModel.newsBloc,
                      child: BlocBuilder<NewsBloc, NewsState>(
                        builder: (context, state) => state.when(
                          loading: () => const ShimmerBanner(),
                          success: (newsModel) =>
                              StoryProvider(newsModel: newsModel),
                          failed: (message) => const ShimmerBanner(),
                        ),
                      ),
                    ),
                    const ColumnSpacer(1.2),
                    BlocConsumer<ItemBloc, ItemState>(
                      bloc: widget.viewModel.itemBloc,
                      listener: (context, state) => state.maybeWhen(
                        orElse: () => null,
                        success: (items) =>
                            widget.viewModel.saveSortItem(items.data ?? []),
                      ),
                      builder: (context, state) => state.maybeWhen(
                        orElse: () => Container(),
                        loading: () => const ShimmerScrollItems(height: 250),
                        failed: (_) => const ShimmerScrollItems(height: 250),
                        success: (items) => Column(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => context.router.push(
                                RestaurantsPageRoute(
                                  items: items,
                                  viewModel: widget.viewModel,
                                  cxt: context,
                                ),
                              ),
                              child: Padding(
                                padding: AppPaddings.horizontal16,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => showCustomSheet(
                                        context,
                                        child: ChooseCity(
                                            viewModel: widget.viewModel),
                                      ),
                                      child: Container(
                                        color: AppColors.none,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              LocaleKeys.establishments.tr(),
                                              style: AppTextStyles.headingH2
                                                  .copyWith(
                                                      color: AppComponents
                                                          .navbarTitleColorDefault),
                                            ),
                                            const ColumnSpacer(0.4),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    AppSvgImages.location),
                                                const RowSpacer(0.8),
                                                Text(
                                                  widget.viewModel.currentCity
                                                          ?.name ??
                                                      LocaleKeys.allCities.tr(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppTextStyles.bodyL.copyWith(
                                                      color: widget
                                                                  .viewModel
                                                                  .currentCity
                                                                  ?.name !=
                                                              null
                                                          ? AppComponents
                                                              .navbarTitleColorDefault
                                                          : AppColors
                                                              .semanticFgSoft),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                        AppSvgImages.chevronForward)
                                  ],
                                ),
                              ),
                            ),
                            const ColumnSpacer(1.6),
                            ScrollProducts(
                              items: items.data
                                  ?.where((e) =>
                                      widget.viewModel.currentCity != null
                                          ? e.cityId ==
                                              widget.viewModel.currentCity?.id
                                          : true)
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const ColumnSpacer(2.4),
                    BlocBuilder<PromotionsBloc, PromotionState>(
                      bloc: widget.viewModel.promotionBloc,
                      builder: (context, state) {
                        final profileVm = context.read<ProfileVm>();
                        if (state is PromotionSuccess) {
                          return Column(
                            children: [
                              SectionTitle(title: LocaleKeys.stock.tr()),
                              const ColumnSpacer(1.2),
                              BrandsWidget(
                                promotions: state.promotionsEntity,
                                profileVm: profileVm,
                              ),
                              const ColumnSpacer(3.2),
                            ],
                          );
                        } else if (state is PromotionsFailed) {
                          return const ShimmerScrollItems();
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  ],
                ),
              )
            : Padding(
                padding: AppPaddings.horizontal16,
                child: NotAutorizedView(
                  title: LocaleKeys.noInternetConnection.tr(),
                  subtitle: LocaleKeys.checkConnection.tr(),
                  buttonText: LocaleKeys.upgrade.tr(),
                  image: AppWebpImages.noConnection,
                  onPressed: () => widget.viewModel.refreshRequest(),
                ),
              ),
      ),
    );
  }
}
