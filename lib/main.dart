import 'package:qr_pay_app/src/features/app/model/async_app_dependencies.dart';
import 'package:qr_pay_app/src/features/app/app.dart';
import 'package:qr_pay_app/src/features/app/logic/main_runner.dart';

void main() async => MainRunner.run<AsyncAppDependencies>(
      asyncDependencies: AsyncAppDependencies.obtain,
      appBuilder: (dependencies) => DalaDevCoreApp(
        sharedPreferences: dependencies.sharedPreferences,
        packageInfo: dependencies.packageInfo,
      ),
    );
