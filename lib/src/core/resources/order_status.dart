import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';

class OrderStatus {
  String getStatus(String status) {
    switch (status) {
      case 'error':
        return LocaleKeys.orderError.tr();
      case 'new':
        return LocaleKeys.newOrder.tr();
      case 'bill':
        return LocaleKeys.checkRequested.tr();
      case 'closed':
        return LocaleKeys.closedStatus.tr();
      case 'inprogress':
        return LocaleKeys.inProcessing.tr();
      case 'deleted':
        return LocaleKeys.remoteOrder.tr();
      case 'confirmed':
        return LocaleKeys.accepted.tr();
      case 'cancelled':
        return LocaleKeys.canceledStatus.tr();
      default:
        return '';
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'error':
        return AppColors.semanticErrorDefault;
      case 'new':
        return AppComponents.listitemSubtitleColorDefault;
      case 'bill':
        return AppComponents.listitemSubtitleColorDefault;
      case 'closed':
        return AppComponents.listitemSubtitleColorDefault;
      case 'inprogress':
        return AppColors.semanticStatus06Default;
      case 'deleted':
        return AppComponents.listitemSubtitleColorDefault;
      case 'confirmed':
        return AppColors.primitiveGreen500;
      case 'cancelled':
        return AppColors.primitiveRed500;
      default:
        return AppComponents.listitemSubtitleColorDefault;
    }
  }

  Color getStatusColorByIndec(int status) {
    switch (status) {
      case 3:
        return AppColors.semanticErrorDefault;
      case 4:
        return AppComponents.listitemSubtitleColorDefault;
      case 5:
        return AppComponents.listitemSubtitleColorDefault;
      case 1:
        return AppColors.semanticStatus06Default;
      case 2:
        return AppColors.semanticSuccessDefault;
      default:
        return AppComponents.listitemSubtitleColorDefault;
    }
  }
}
