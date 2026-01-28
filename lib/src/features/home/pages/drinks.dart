import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/free_bloc/free_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/vm/bonus_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/chip_custom.dart';
import 'package:qr_pay_app/src/features/home/widgets/product_card2.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({
    super.key,
    required this.idItem,
    required this.tableId,
  });
  final String idItem;
  final String tableId;

  @override
  State<DrinksPage> createState() => _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  @override
  void initState() {
    super.initState();
    context.read<BonusVm>().fetchFreeItems(widget.idItem);
    context.read<BonusVm>().bonusRequest.itemId = widget.idItem;
    context.read<BonusVm>().bonusRequest.tableId = widget.tableId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.chooseFreeDrink.tr(),
        hasLeading: true,
      ),
      body: Consumer<BonusVm>(
        builder: (context, value, state) {
          return BlocConsumer<FreeBloc, FreeState>(
            bloc: value.freeBloc,
            listener: (context, state) => state.maybeWhen(
              orElse: () => null,
              success: (items) => value.saveFreeItems(items),
              failed: (error) => context.router.pop(error),
            ),
            builder: (context, state) => state.maybeWhen(
              loading: () => const ShimmerLoadingHorizontal(count: 10),
              orElse: () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ColumnSpacer(1.2),
                  Padding(
                    padding: AppPaddings.horizontal16,
                    child: Row(
                      children: [
                        value.itemsFree.data?[0] != null
                            ? Flexible(
                                child: ChipCustom(
                                  item: value.itemsFree.data?[0],
                                  value: 0,
                                  groupValue: value.valueCategory,
                                  onChanged: (index, title) =>
                                      value.selectCategory(index!, title!),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const RowSpacer(0.8),
                        value.itemsFree.data?[1] != null
                            ? Flexible(
                                child: ChipCustom(
                                  item: value.itemsFree.data?[1],
                                  value: 1,
                                  groupValue: value.valueCategory,
                                  onChanged: (index, title) =>
                                      value.selectCategory(index!, title!),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const ColumnSpacer(0.8),
                  Expanded(
                    child: Padding(
                      padding: AppPaddings.horizontal16,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const ColumnSpacer(0.8),
                            Text(
                              value.title,
                              style: AppTextStyles.headingH2.copyWith(
                                  height: 0.5,
                                  color: AppComponents.navbarTitleColorDefault),
                            ),
                            const ColumnSpacer(1.2),
                            FreeCoffeeItems(
                              items: value
                                  .itemsFree.data?[value.valueCategory].items,
                              viewModel: value,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FreeCoffeeItems extends StatelessWidget {
  const FreeCoffeeItems({
    super.key,
    required this.items,
    required this.viewModel,
  });
  final List<Item>? items;
  final BonusVm viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items?.length ?? 0,
        itemBuilder: (context, index) => ProductCard2(
          items: items?[index],
          viewModel: viewModel,
        ),
      ),
    );
    // return DynamicHeightGridView(
    //   itemCount: items?.length ?? 0,
    //   crossAxisCount: 2,
    //   crossAxisSpacing: 8,
    //   mainAxisSpacing: 12,
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   builder: (ctx, index) => ProductCard2(
    //     items: items?[index],
    //     viewModel: viewModel,
    //   ),
    // );
  }
}
