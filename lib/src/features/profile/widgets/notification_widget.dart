import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/notification_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.data,
  });

  final NotificationDatum? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all,
      decoration: BoxDecoration(
          color: AppColors.semanticBgSurface1,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
                borderRadius: BorderRadius.circular(100)),
            height: 32,
            width: 32,
            child: Center(
              child: SvgPicture.asset(
                AppSvgImages.notifications,
                width: 16,
                height: 16,
                color: AppColors.semanticFgDefault,
              ),
            ),
          ),
          const RowSpacer(1.6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // SvgPicture.asset(
                    //   AppSvgImages.ellipseFill,
                    // ),
                    // const RowSpacer(0.8),
                    Text(
                      data?.subject ?? '',
                      style: AppTextStyles.bodyLStrong
                          .copyWith(color: AppColors.semanticFgDefault),
                    ),
                    // const Spacer(),
                    // SvgPicture.asset(
                    //   AppSvgImages.closeLarge,
                    //   height: 20,
                    // ),
                  ],
                ),
                const ColumnSpacer(0.4),
                Text(
                  data?.text ?? '',
                  style: AppTextStyles.bodyM.copyWith(
                      color: AppComponents.notificationBodytextColorDefault),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                const ColumnSpacer(0.4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat(
                              "d MMMM",
                              sl<SharedPreferences>().getString('locale') ??
                                  'ru')
                          .format(data?.createdAt ?? DateTime.now()),
                      style: AppTextStyles.bodyS
                          .copyWith(color: AppColors.primitiveNeutral300),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
