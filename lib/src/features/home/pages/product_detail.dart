import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/detail_item_bloc/detail_item_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/promotions_bloc/promotions_state.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/brands.dart';
import 'package:qr_pay_app/src/features/home/widgets/main_content.dart';
import 'package:qr_pay_app/src/features/home/widgets/map_widget.dart';
import 'package:qr_pay_app/src/features/home/widgets/product_slider_images.dart';
import 'package:qr_pay_app/src/features/home/widgets/section_title.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_item_detail.dart';
import 'package:qr_pay_app/src/features/home/widgets/shimmer_scroll_items.dart';
import 'package:qr_pay_app/src/features/home/widgets/work_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.viewModel,
    this.item,
  });
  final DetailVm viewModel;
  final DetailItemModel? item;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with ViewModelMixin<ProductDetailPage, DetailVm> {
  @override
  DetailVm get viewModel => widget.viewModel;

  int activeIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel.detailItemBloc,
      child: Scaffold(
        backgroundColor: viewModel.data.data?.id == null
            ? null
            : AppComponents.buttongroupButtonGrayBgColorDisabled,
        body: BlocConsumer<DetailItemBloc, DetailItemState>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            successDetailItem: (item) => viewModel.saveData(item),
          ),
          builder: (context, state) => state.maybeWhen(
            errorDetailItem: (errorText) => const ShimmerItemDetail(),
            initial: () => const ShimmerItemDetail(),
            orElse: () => CustomScrollView(
              controller: viewModel.scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  stretch: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: viewModel.isAtStart ? 0 : 1,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: viewModel.data.data?.name ?? '',
                            style: AppTextStyles.headingH3
                                .copyWith(color: AppColors.semanticFgDefault),
                          ),
                        ],
                      ),
                    ),
                  ),
                  leadingWidth: 56,
                  leading: InkWell(
                    onTap: () => context.router.pop(),
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primitiveNeutralcold0,
                      ),
                      child: SvgPicture.asset(AppSvgImages.arrowLeft),
                    ),
                  ),
                  backgroundColor: AppComponents.blockBgColorDefault,
                  surfaceTintColor: AppComponents.blockBgColorDefault,
                  expandedHeight: context.mediaQuery.size.width / 1.4,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      double maxExtent = context
                          .mediaQuery.size.width; // Максимальная высота AppBar
                      double minExtent =
                          kToolbarHeight; // Минимальная высота AppBar
                      double currentExtent = context.mediaQuery.size.height;
                      // constraints.biggest.height; // Текущая высота AppBar

                      // Определяем прогресс сворачивания (от 0 до 1)
                      double scrollFactor = ((maxExtent - currentExtent) /
                              (maxExtent - minExtent))
                          .clamp(0.0, 1.0);
                      // Адаптивное смещение градиента
                      double topOffset = scrollFactor *
                          (maxExtent / 1.6); // Используем половину maxExtent
                      return FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        background: Container(
                          // decoration: const BoxDecoration(
                          //   color: AppColors.primitiveNeutralcold50,
                          // ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: RestaurantSliderImage(
                                  images: viewModel.data.data?.images ?? [],
                                  isDetailPage: true,
                                  // isGradientEffect: true,
                                  onIndexChanged: (index) =>
                                      setState(() => activeIndex = index),
                                ),
                              ),

                              // Градиент, который поднимается
                              // Positioned.fill(
                              //   child: IgnorePointer(
                              //     child: AnimatedContainer(
                              //       duration: Duration.zero,
                              //       transform: Matrix4.translationValues(
                              //           0, -topOffset, 0),
                              //       decoration: BoxDecoration(
                              //         gradient: LinearGradient(
                              //           begin: Alignment.bottomCenter,
                              //           end: Alignment.topCenter,
                              //           colors: [
                              //             AppColors.primitiveNeutralcold1000,
                              //             AppColors.primitiveNeutralcold1000
                              //                 .withOpacity(0),
                              //             AppColors.none,
                              //           ],
                              //           stops: const [0, 0.25, 1.0],
                              //           tileMode: TileMode.repeated,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              BlocBuilder<DetailItemBloc, DetailItemState>(
                                builder: (context, state) => state.when(
                                  initial: () => const SizedBox.shrink(),
                                  errorDetailItem: (_) =>
                                      const SizedBox.shrink(),
                                  // initial: () => const ShimmerItemDetail(),
                                  // errorDetailItem: (errorText) =>
                                  //     const ShimmerItemDetail(),
                                  successDetailItem: (item) => Positioned(
                                    bottom: 20,
                                    left: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const ColumnSpacer(30),
                                        Text(
                                          item.data?.name ?? '',
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppTextStyles.headingH1.copyWith(
                                            color: AppColors.semanticFgInvert,
                                          ),
                                        ),
                                        const ColumnSpacer(0.4),
                                        Text(
                                          item.data?.catalog?.description ?? '',
                                          style: AppTextStyles.bodyL.copyWith(
                                            color: AppColors.semanticFgInvert,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              if ((viewModel.data.data?.images?.length ?? 0) >
                                  1)
                                Positioned.fill(
                                  bottom: 8,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AnimatedSmoothIndicator(
                                      activeIndex: activeIndex,
                                      count:
                                          viewModel.data.data?.images?.length ??
                                              0,
                                      effect: const ScrollingDotsEffect(
                                        dotHeight: 8,
                                        dotWidth: 8,
                                        activeDotScale: 1.5,
                                        dotColor: AppComponents
                                            .pageindicatorIndicatorInactiveColorDefault,
                                        activeDotColor: AppComponents
                                            .pageindicatorIndicatorActiveColorDefault,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BlocBuilder<DetailItemBloc, DetailItemState>(
                        builder: (context, state) => state.when(
                          initial: () => const ShimmerItemDetail(),
                          errorDetailItem: (errorText) =>
                              const ShimmerItemDetail(),
                          successDetailItem: (item) => Column(
                            children: [
                              MainContent(
                                item: item,
                                viewModel: viewModel,
                              ),
                              item.data?.menuLink == null &&
                                      !(item.data?.canReserve ?? false)
                                  ? const SizedBox.shrink()
                                  : const ColumnSpacer(0.8),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.semanticBgSurface1,
                                    borderRadius: item.data?.menuLink == null &&
                                            !(item.data?.canReserve ?? false)
                                        ? const BorderRadius.vertical(
                                            bottom: Radius.circular(24))
                                        : const BorderRadius.all(
                                            Radius.circular(24))),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const ColumnSpacer(1.2),
                                    Padding(
                                      padding: AppPaddings.horizontal16,
                                      child: SectionTitle(
                                        title: LocaleKeys.addressContacts.tr(),
                                        padding: false,
                                      ),
                                    ),
                                    const ColumnSpacer(2),
                                    Padding(
                                      padding: AppPaddings.horizontal16,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AppSvgImages.locationFill),
                                          const RowSpacer(0.8),
                                          Flexible(
                                            child: Text(
                                              item.data?.address ?? '',
                                              style: AppTextStyles.bodyL.copyWith(
                                                  color: AppComponents
                                                      .navbarTitleColorDefault),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    MapWidgte(
                                      lat: item.data?.lat,
                                      lng: item.data?.lng,
                                    ),
                                    const CustomDivider(horizontalPadding: 16),

                                    ///туть
                                    ListTile(
                                      title: Row(
                                        children: [
                                          SvgPicture.asset(
                                              AppSvgImages.timeCircle),
                                          const RowSpacer(1.2),
                                          Text(
                                            item
                                                        .data
                                                        ?.graphicWorks?[
                                                            viewModel.now
                                                                    .weekday -
                                                                1]
                                                        .isAllDay ??
                                                    false
                                                ? LocaleKeys.allDay.tr()
                                                : '${LocaleKeys.workingHours.tr()} ${item.data?.graphicWorks?[viewModel.now.weekday - 1].startTime} - ${item.data?.graphicWorks?[viewModel.now.weekday - 1].endTime}',
                                            style: AppTextStyles.bodyL.copyWith(
                                                color: AppComponents
                                                    .listitemTitleColorDefault),
                                          ),
                                        ],
                                      ),
                                      trailing: Icon(isExpanded
                                          ? Icons.expand_less
                                          : Icons.expand_more),
                                      onTap: () {
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                    ),

                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      height: isExpanded ? null : 0,
                                      child: Visibility(
                                        visible: isExpanded,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 36, right: 16),
                                          child: WorkSchedule(
                                            graphicWorks:
                                                item.data?.graphicWorks ?? [],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //туть
                                    const CustomDivider(horizontalPadding: 16),
                                    ListItem1(
                                      title: item.data?.phone ?? '',
                                      leftIcon: AppSvgImages.call,
                                      onTap: () =>
                                          LaunchInBrowserUtil.launchUrl(
                                              'tel://${item.data?.phone}'),
                                    ),
                                    const ColumnSpacer(1),
                                  ],
                                ),
                              ),
                              const ColumnSpacer(0.8),
                              Container(
                                padding: AppPaddings.all,
                                decoration: const BoxDecoration(
                                    color: AppColors.semanticBgSurface1,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24))),
                                child: Column(
                                  children: [
                                    SectionTitle(
                                      title: LocaleKeys.description.tr(),
                                      padding: false,
                                    ),
                                    const ColumnSpacer(2),
                                    Text(
                                      item.data?.description ?? '',
                                      style: AppTextStyles.bodyL.copyWith(
                                          color: AppComponents
                                              .navbarTitleColorDefault),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const ColumnSpacer(0.8),
                      BlocBuilder<PromotionsBloc, PromotionState>(
                        bloc: viewModel.promotionBloc,
                        builder: (context, state) {
                          if (state is PromotionLoading) {
                            return const ShimmerScrollItems();
                          } else if (state is PromotionSuccess) {
                            final profileVm = context.read<ProfileVm>();
                            return Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.semanticBgSurface1,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                              child: Column(
                                children: [
                                  const ColumnSpacer(1.2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: SectionTitle(
                                        title: LocaleKeys.stock.tr()),
                                  ),
                                  const ColumnSpacer(1.2),
                                  BrandsWidget(
                                    promotions: state.promotionsEntity,
                                    profileVm: profileVm,
                                  ),
                                  const ColumnSpacer(5),
                                ],
                              ),
                            );
                          } else if (state is PromotionsFailed) {
                            return const ShimmerScrollItems();
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      // const ColumnSpacer(2)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
