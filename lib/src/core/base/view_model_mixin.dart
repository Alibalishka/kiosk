import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:flutter/cupertino.dart';

mixin ViewModelMixin<W extends StatefulWidget, VM extends ViewModel>
    on State<W> {
  /// Геттер для вьюмодели
  ViewModel get viewModel;

  @override
  void initState() {
    viewModel.init();
    super.initState();
  }
}
