import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:sizer/sizer.dart';

class NutritionListTitle extends StatelessWidget {
  const NutritionListTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final value = context.read<QrMenuVm>();
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border:
            Border.all(color: AppComponents.tileNotselectedBorderColorDefault),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyL.copyWith(
                fontSize: value.isTablet ? 15.sp : null,
                color: AppComponents.blockBlocktitleTitleColorDefault),
          ),
          const ColumnSpacer(0.2),
          Text(
            subtitle,
            style: AppTextStyles.bodyS.copyWith(
                fontSize: value.isTablet ? 13.sp : null,
                color: AppComponents.blockBlocktitleSubtitleColorDefault),
          ),
        ],
      ),
    );
  }
}
