import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/booking/vm/booking_vm.dart';

class ItemMainInfo extends StatelessWidget {
  const ItemMainInfo({
    super.key,
    required this.viewModel,
  });
  final BookingVm viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppSvgImages.chailaLogo,
          height: 32,
          color: AppColors.primitiveNeutralcold1000,
        ),
        const RowSpacer(1.2),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.item.data?.name ?? '',
                style: AppTextStyles.headingH4
                    .copyWith(color: AppComponents.listitemTitleColorDefault),
              ),
              const ColumnSpacer(0.4),
              Text(
                viewModel.item.data?.address ?? '',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppComponents.listitemSubtitleColorDefault,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
