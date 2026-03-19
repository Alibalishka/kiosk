import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:sizer/sizer.dart';

class KioskTechWorkPage extends StatelessWidget {
  const KioskTechWorkPage({
    super.key,
    required this.code,
  });
  final String code;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                final vm = context.read<QrMenuVm>();
                final menuId = vm.menuId;
                if (menuId == null) {
                  context.router.replaceAll([const KioskProviderRoute()]);
                  return;
                }
                vm.menuData = null;
                context.router.replaceAll([
                  QrMenuProviderRoute(
                    menuId: menuId,
                    isKiosk: true,
                    key: ValueKey(
                        'refresh-${DateTime.now().millisecondsSinceEpoch}'),
                  ),
                ]);
              },
              child: const Text('Обновить'),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                AppSvgImages.kioskNo,
                height: 20.h,
              ),
              Text(
                'Киоск временно не работает',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH1.copyWith(fontSize: 20.sp),
              ),
              const ColumnSpacer(1),
              Text(
                'Проводим обслуживание системы. Работа будет восстановлена в ближайшее время.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyL.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.primitiveNeutralcold500,
                ),
              ),
              Text(
                '64${code}19',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH1.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.primitiveNeutralcold500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
