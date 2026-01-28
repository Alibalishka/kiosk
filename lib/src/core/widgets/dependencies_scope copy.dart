// ignore_for_file: file_names

import 'package:qr_pay_app/src/core/model/dependencies_storage.dart';
import 'package:qr_pay_app/src/core/widgets/scope.dart';
import 'package:flutter/material.dart';

class DependenciesScope extends Scope {
  static const DelegateAccess<_DependenciesScopeDelegate> _delegateOf =
      Scope.delegateOf<DependenciesScope, _DependenciesScopeDelegate>;

  final IDependenciesStorage Function(BuildContext context) create;

  const DependenciesScope({
    required this.create,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static IDependenciesStorage of(BuildContext context) =>
      _delegateOf(context).storage;

  @override
  ScopeDelegate<DependenciesScope> createDelegate() =>
      _DependenciesScopeDelegate();
}

class _DependenciesScopeDelegate extends ScopeDelegate<DependenciesScope> {
  late final IDependenciesStorage storage = widget.create(context);

  @override
  void dispose() {
    storage.close();
    super.dispose();
  }
}
