import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterWatchAll extends StatefulWidget {
  final List<String> list;
  final List<String> isSelected;
  const FilterWatchAll({
    super.key,
    required this.list,
    required this.isSelected,
  });

  @override
  State<FilterWatchAll> createState() => _FilterWatchAllState();
}

class _FilterWatchAllState extends State<FilterWatchAll> {
  @override
  Widget build(BuildContext context) {
    //List<bool> isSelected = List<bool>.filled(widget.list.length, false);
    return Scaffold(
      backgroundColor: AppColors.semanticBgSurface1,
      appBar: const CustomAppBar(
        text: 'lsdkfps',
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.all,
              child: CupertinoSearchTextField(
                // borderRadius: BorderRadius.circular(12),
                placeholder: 'Поиск',
                //controller: searchController,
                style: AppTextStyles.bodyL.copyWith(
                    color: AppComponents
                        .inputSecondaryPlaceholdertextColorDefault),
                decoration: BoxDecoration(
                  color: AppColors.semanticBgSurface1,
                  border: Border.all(
                      color: AppComponents.inputSecondaryBorderColorDefault),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            ListView.builder(
                padding: AppPaddings.empty,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      if (widget.isSelected.contains(widget.list[index])) {
                        widget.isSelected.remove(widget.list[index]);
                      } else {
                        widget.isSelected.add(widget.list[index]);
                      }
                      setState(() {});
                    },

                    //setState(() => isSelect = !isSelect),
                    child: Padding(
                      padding: AppPaddings.all,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.list[index],
                            style: AppTextStyles.bodyL.copyWith(
                                color:
                                    AppComponents.listitemBodytextColorDefault),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: widget.isSelected
                                        .contains(widget.list[index])
                                    ? AppColors.primitiveBrand500
                                    : null,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: widget.isSelected
                                            .contains(widget.list[index])
                                        ? AppColors.primitiveBrand500
                                        : AppColors.semanticFgSoft)),
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: SvgPicture.asset(AppSvgImages.checkmark),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: widget.list.length),
          ],
        ),
      ),
    );
  }
}
