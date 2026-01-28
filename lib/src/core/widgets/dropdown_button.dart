import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DropDownButton extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final String title;
  final String placeholder;
  const DropDownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.title,
    required this.placeholder,
  });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          textAlign: TextAlign.left,
          style: AppTextStyles.bodyM
              .copyWith(color: AppComponents.inputPrimaryLabeltextColorDefault),
        ),
        const ColumnSpacer(0.8),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primitiveNeutral10,
              borderRadius: BorderRadius.circular(12)),
          padding: AppPaddings.horizontal16,
          child: Row(children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  widget.placeholder,
                  style: AppTextStyles.bodyL
                      .copyWith(color: AppColors.primitiveNeutral300),
                  overflow: TextOverflow.ellipsis,
                ),
                items: widget.items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: AppTextStyles.bodyL
                                .copyWith(color: AppColors.primitiveNeutral300),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: widget.selectedValue,
                onChanged: (value) {
                  setState(() {
                    widget.selectedValue == value;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
                iconStyleData: const IconStyleData(
                  // icon: Icon(
                  //   Icons.chevron_right,
                  //   color: AppColors.none,
                  // ),
                  iconSize: 1,
                  iconEnabledColor: AppColors.none,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(4),
                    thumbVisibility: WidgetStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 45,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
            SvgPicture.asset(
              AppSvgImages.chevronForward,
              color: AppColors.primitiveNeutral300,
            )
          ]),
        ),
      ],
    );
  }
}
