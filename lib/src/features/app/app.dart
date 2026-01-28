import 'package:qr_pay_app/src/core/model/dependencies_storage.dart';
import 'package:qr_pay_app/src/core/widgets/dependencies_scope%20copy.dart';
import 'package:qr_pay_app/src/features/app/widgets/app_configuration.dart';
import 'package:qr_pay_app/src/features/app/widgets/app_scope.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class DalaDevCoreApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;

  const DalaDevCoreApp({
    required this.sharedPreferences,
    required this.packageInfo,
    Key? key,
  }) : super(key: key);

  @override
  State<DalaDevCoreApp> createState() => _DalaDevCoreAppState();
}

class _DalaDevCoreAppState extends State<DalaDevCoreApp> {
  @override
  Widget build(BuildContext context) => DependenciesScope(
        create: (context) => DependenciesStorage(
          sharedPreferences: widget.sharedPreferences,
          packageInfo: widget.packageInfo,
        ),
        child: const AppScope(child: AppConfiguration()),
      );
}
