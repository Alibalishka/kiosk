import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/pages/product_detail.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';

class DetailProvider extends StatelessWidget {
  const DetailProvider({
    super.key,
    required this.id,
    this.images,
  });
  final int id;
  final List<ImageDatum>? images;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailVm>(
      create: (_) => DetailVm(
        context: context,
        itemId: id,
        images: images ?? [],
      ),
      child: Consumer<DetailVm>(
        builder: (_, value, child) => ProductDetailPage(viewModel: value),
      ),
    );
  }
}
