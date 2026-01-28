import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/features/home/pages/qr_menu.dart';
import 'package:qr_pay_app/src/features/home/vm/detail_vm.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';

class QrMenuProvider extends StatelessWidget {
  const QrMenuProvider({
    super.key,
    this.detailVm,
    this.menuId,
    this.isKiosk = false,
  });
  final DetailVm? detailVm;
  final int? menuId;
  final bool? isKiosk;

  @override
  Widget build(BuildContext context) => Consumer<QrMenuVm>(
        builder: (_, value, child) {
          value.detailVm = detailVm;
          value.menuId = menuId;
          value.isKioskMode = isKiosk!;
          return QrMenuPage(viewModel: value);
        },
      );
}
