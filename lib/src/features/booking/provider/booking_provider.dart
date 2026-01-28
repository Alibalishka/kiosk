import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/booking/pages/booking_guest.dart';
import 'package:qr_pay_app/src/features/booking/vm/booking_vm.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';

class BookingProvider extends StatelessWidget {
  const BookingProvider({
    super.key,
    required this.item,
    required this.canReserve,
  });
  final DetailItemModel item;
  final bool canReserve;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<BookingVm>(
        create: (_) => BookingVm(
          context: _,
          item: item,
          canReserve: canReserve,
        ),
        child: Consumer<BookingVm>(
          builder: (_, value, child) => BookingGuestPage(viewModel: value),
        ),
      );
}
