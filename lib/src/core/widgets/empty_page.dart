import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class EmptyPage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? emptyImage;
  final bool actionButton;
  final bool padding;
  final Function()? button;
  const EmptyPage(
      {super.key,
      this.title,
      this.description,
      this.emptyImage,
      this.actionButton = false,
      this.padding = true,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == true ? AppPaddings.horizontal16 : AppPaddings.empty,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          emptyImage != null
              ? SvgPicture.asset(emptyImage!)
              : const ColumnSpacer(0),
          const ColumnSpacer(0.8),
          title != null
              ? Text(
                  title!,
                )
              : const ColumnSpacer(0),
          const ColumnSpacer(0.8),
          description != null
              ? Text(
                  description!,
                )
              : const ColumnSpacer(0),
          const ColumnSpacer(1.6),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: '+ Добавить адрес',
                  onPressed: button,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
