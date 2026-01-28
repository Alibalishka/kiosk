import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/pages/rating_page.dart';
import 'package:qr_pay_app/src/features/home/vm/review_vm.dart';

class ReviewProvider extends StatelessWidget {
  const ReviewProvider({
    super.key,
    required this.id,
    this.showModal = true,
  });
  final int id;
  final bool showModal;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ReviewVm>(
        create: (_) => ReviewVm(
          context: context,
          showModal: showModal,
          id: id,
        ),
        child: Consumer<ReviewVm>(
          builder: (context, value, child) => RatingPage(viewModel: value),
        ),
      );
}
