import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/features/home/widgets/choose_city_sheet.dart';
import 'package:qr_pay_app/src/features/home/widgets/scroll_products.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({
    super.key,
    required this.items,
    required this.viewModel,
    required this.cxt,
    this.indexGroupValue = 0,
  });
  final ItemsModel? items;
  final HomeVm viewModel;
  final BuildContext cxt;
  final int indexGroupValue;

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  int groupValue = 0;
  bool _isDarkStatusBar = false;
  @override
  void initState() {
    super.initState();
    groupValue = widget.indexGroupValue;
    _setLightStatusBar();
  }

  void _setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  void _setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  void dispose() {
    _setDarkStatusBar(); // Вернуть тёмный статус-бар при выходе
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: LocaleKeys.establishments.tr(),
        hasLeading: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.pixels > 50 && !_isDarkStatusBar) {
            setState(() {
              _isDarkStatusBar = true;
              _setDarkStatusBar();
            });
          } else if (scrollNotification.metrics.pixels <= 50 &&
              _isDarkStatusBar) {
            setState(() {
              _isDarkStatusBar = false;
              _setLightStatusBar();
            });
          }
          return false;
        },
        child: Consumer<HomeVm>(
          builder: (context, value, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const ColumnSpacer(1.6),
                  SizedBox(
                    height: 38,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const RowSpacer(1.6),
                        GestureDetector(
                          onTap: () => showCustomSheet(
                            context,
                            child: ChooseCity(viewModel: value),
                          ),
                          child: Container(
                            padding: AppPaddings.locationContainer,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: AppComponents
                                    .taggroupTagFilledActiveBgColorDefault),
                            child: Center(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppSvgImages.location,
                                    height: 16,
                                  ),
                                  const RowSpacer(0.4),
                                  Text(
                                    value.currentCity?.name ??
                                        LocaleKeys.allCities.tr(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.bodyL.copyWith(
                                      color: value.currentCity?.name != null
                                          ? AppColors.semanticFgDefault
                                          : AppColors.semanticFgSoft,
                                    ),
                                  ),
                                  const RowSpacer(0.4),
                                  SvgPicture.asset(
                                    AppSvgImages.chevronDown,
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const RowSpacer(1.2),
                        // ChipSort(
                        //   text: 'Chayla Kitchen',
                        //   value: 1,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        // const RowSpacer(1.2),
                        // ChipSort(
                        //   text: 'Chayla Lounge',
                        //   value: 2,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        // const RowSpacer(1.2),
                        // ChipSort(
                        //   text: 'Joy',
                        //   value: 3,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        // const RowSpacer(1.2),
                        // ChipSort(
                        //   text: 'Lukum Vostok',
                        //   value: 4,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        // const RowSpacer(1.2),
                        // ChipSort(
                        //   text: 'Usta',
                        //   value: 5,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        // const RowSpacer(1.2),
                        // ChipSort(
                        //   text: 'Suli da Guli',
                        //   value: 6,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        // const RowSpacer(1.2),
                        // ChipSort(
                        //   text: '&Milk',
                        //   value: 7,
                        //   groupValue: groupValue,
                        //   onChanged: (index) =>
                        //       setState(() => groupValue = index!),
                        // ),
                        ...widget.viewModel.itemSort.map((item) {
                          final name = item.catalog?.name ?? '—';
                          final index = item.catalog?.id ?? 0;

                          return Row(
                            children: [
                              ChipSort(
                                  text: name,
                                  value: index,
                                  groupValue: groupValue,
                                  onChanged: (val) {
                                    setState(() => groupValue = val!);
                                    log(groupValue.toString());
                                  }),
                              const RowSpacer(1.2),
                            ],
                          );
                        }),

                        const RowSpacer(1.6),
                      ],
                    ),
                  ),
                  const ColumnSpacer(1.6),
                  ScrollProducts(
                    items: groupValue == 0
                        ? widget.items?.data
                            ?.where((e) => widget.viewModel.currentCity != null
                                ? e.cityId == widget.viewModel.currentCity?.id
                                : true)
                            .toList()
                        : widget.items?.data
                            ?.where(
                              (e) =>
                                  (widget.viewModel.currentCity != null
                                      ? e.cityId ==
                                          widget.viewModel.currentCity?.id
                                      : true) &&
                                  e.catalog?.id == groupValue,
                            )
                            .toList(),
                  ),
                  const ColumnSpacer(2.8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChipSort extends StatelessWidget {
  const ChipSort({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    this.onChanged,
  });
  final String text;
  final int value;
  final int groupValue;
  final Function(int?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = value != groupValue;
        if (selected) {
          onChanged!(value);
        } else {
          onChanged!(0);
        }
      },
      child: Container(
        padding: AppPaddings.locationContainer,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: AppComponents.taggroupTagFilledActiveBgColorDefault,
          border: Border.all(
            color: value == groupValue
                ? AppComponents.chipgroupChipsSelectedBorderColorDefault
                : AppColors.none,
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyles.bodyL
                  .copyWith(color: AppColors.semanticFgDefault),
            ),
            value == groupValue
                ? Row(
                    children: [
                      const RowSpacer(0.2),
                      SvgPicture.asset(
                        AppSvgImages.closeLarge,
                        height: 20,
                      )
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
