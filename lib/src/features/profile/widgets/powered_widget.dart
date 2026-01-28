import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PoweredWidget extends StatefulWidget {
  const PoweredWidget({
    super.key,
  });

  @override
  State<PoweredWidget> createState() => _PoweredWidgetState();
}

class _PoweredWidgetState extends State<PoweredWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileVm>().loadVersionInfo();
  }

  @override
  Widget build(BuildContext context) {
    final version = context.watch<ProfileVm>().version;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Powered by',
              style:
                  AppTextStyles.bodyM.copyWith(color: AppColors.semanticFgSoft),
            ),
            const RowSpacer(0.8),
            GestureDetector(
              onTap: () =>
                  LaunchInBrowserUtil.launchUrl('https://chayla.go.qrpay.kz/'),
              child: Image.asset(
                AppWebpImages.logo,
                width: 76,
                height: 16,
              ),
            )
          ],
        ),
        Text(
          'Версия $version',
          style: AppTextStyles.bodyS
              .copyWith(color: AppComponents.listitemSubtitleColorDefault),
        ),
      ],
    );
  }
}
