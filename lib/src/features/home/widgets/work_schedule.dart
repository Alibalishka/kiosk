import 'package:easy_localization/easy_localization.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';

class WorkSchedule extends StatelessWidget {
  const WorkSchedule({super.key, required this.graphicWorks});
  final List<GraphicWorkDatum>? graphicWorks;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: AppColors.semanticBgSurface1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // BottomSheetAppBar(
            //   title: LocaleKeys.workingTime.tr(),
            //   svg: AppSvgImages.iconLeft,
            // ),
            // const ColumnSpacer(2.8),
            Padding(
              padding: AppPaddings.horizontal16,
              child: ListView.builder(
                  padding: AppPaddings.empty,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            graphicWorks?[index].dayRaw ?? '',
                            style: isToday(graphicWorks?[index].day ?? 0)
                                ? AppTextStyles.bodyLStrong.copyWith(
                                    color:
                                        AppComponents.listitemTitleColorDefault)
                                : AppTextStyles.bodyL.copyWith(
                                    color: AppComponents
                                        .listitemTitleColorDefault),
                          ),
                          graphicWorks?[index].isAllDay ?? false
                              ? Text(
                                  LocaleKeys.allDay.tr(),
                                  style: isToday(graphicWorks?[index].day ?? 0)
                                      ? AppTextStyles.bodyLStrong.copyWith(
                                          color: AppComponents
                                              .listitemTitleColorDefault)
                                      : AppTextStyles.bodyL.copyWith(
                                          color: AppComponents
                                              .listitemTitleColorDefault),
                                )
                              : Text(
                                  '${graphicWorks?[index].startTime ?? ''} - ${graphicWorks?[index].endTime ?? ''}',
                                  style: isToday(graphicWorks?[index].day ?? 0)
                                      ? AppTextStyles.bodyLStrong.copyWith(
                                          color: AppComponents
                                              .listitemTitleColorDefault)
                                      : AppTextStyles.bodyL.copyWith(
                                          color: AppComponents
                                              .listitemTitleColorDefault),
                                ),

                          // SvgPicture.asset(AppSvgImages.chevronForward)
                        ],
                      ),
                    );
                  },
                  itemCount: graphicWorks?.length ?? 0),
            ),
            // const ColumnSpacer(1.6),
          ],
        ));
  }

  bool isToday(int day) {
    return DateTime.now().weekday == day + 1;
  }
}
