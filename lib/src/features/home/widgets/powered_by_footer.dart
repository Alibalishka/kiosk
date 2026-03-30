import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

class PoweredByFooter extends StatelessWidget {
  const PoweredByFooter({
    super.key,
    required this.appVersion,
  });

  final String? appVersion;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Powered by',
                    style: AppTextStyles.bodyL.copyWith(
                      color: AppColors.semanticFgSoft,
                    ),
                  ),
                  const RowSpacer(0.8),
                  SvgPicture.asset(
                    AppSvgImages.qrpayLogo,
                    height: 22,
                    color: AppColors.primitiveNeutralcold1000,
                  ),
                ],
              ),
              if (appVersion != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'v$appVersion',
                    style: AppTextStyles.bodyM.copyWith(
                      decoration: TextDecoration.none,
                      color:
                          AppColors.semanticFgDefault.withOpacity(0.6),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

