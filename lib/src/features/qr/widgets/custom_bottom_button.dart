import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color buttonColor;
  const CustomBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColors.primitiveBrand500,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: text,
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
          const ColumnSpacer(1.6)
        ],
      ),
    );
  }
}
