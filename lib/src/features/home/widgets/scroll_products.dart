import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ScrollProducts extends StatelessWidget {
  const ScrollProducts({
    super.key,
    this.items,
  });
  final List<Item>? items;

  @override
  Widget build(BuildContext context) => context.mediaQuery.size.width > 600
      ? AlignedGridView.count(
          padding: AppPaddings.horizontal16,
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items?.length ?? 0,
          itemBuilder: (context, index) => ProductCardWidget(
                item: items?[index],
              ))
      : ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: AppPaddings.horizontal16,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => ProductCardWidget(
            item: items?[index],
          ),
          separatorBuilder: (BuildContext context, int index) =>
              const ColumnSpacer(1.6),
          itemCount: items?.length ?? 0,
        );
}
