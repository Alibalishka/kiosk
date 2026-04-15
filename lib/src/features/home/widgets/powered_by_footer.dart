import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

/// Бейдж в левом верхнем углу поверх полноэкранной рекламы (тапы проходят к экрану рекламы).
class PoweredByAdCorner extends StatelessWidget {
  const PoweredByAdCorner({
    super.key,
    required this.appVersion,
  });

  final String? appVersion;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.42),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Powered by',
                  style: AppTextStyles.bodyM.copyWith(
                    color: Colors.white.withValues(alpha: 0.92),
                  ),
                ),
                const RowSpacer(0.8),
                SvgPicture.asset(
                  AppSvgImages.qrpayLogo,
                  height: 18,
                  color: Colors.white,
                ),
              ],
            ),
            if (appVersion != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'v$appVersion',
                  style: AppTextStyles.bodyS.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

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
                      color: AppColors.semanticFgDefault
                          .withValues(alpha: 0.6),
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

