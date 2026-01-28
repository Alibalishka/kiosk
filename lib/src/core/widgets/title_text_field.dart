import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String title;
  final TextInputType textInputType;
  final bool readOnly;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int minLines;
  final int maxLines;
  final bool isBorder;
  final bool isRequired;
  final String? error;
  final bool hasBorderColor;
  final bool hasTitle;
  final bool titleRed;
  const TitleTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.title,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 2,
    this.isBorder = false,
    this.isRequired = false,
    this.hasBorderColor = false,
    this.error,
    this.hasTitle = true,
    this.titleRed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: AppTextStyles.bodyM.copyWith(
              color: titleRed
                  ? AppComponents.inputPrimaryHinttextColorError
                  : AppComponents.inputPrimaryLabeltextColorDefault),
        ),
        const ColumnSpacer(0.8),
        CustomTextField2(
          placeholder: placeholder,
          readOnly: readOnly,
          //backgroundColor: AppComponents.inputPrimaryBgColorDefault,
          isBorder: true,
          controller: controller,
          textInputType: textInputType,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          hasBorderColor: hasBorderColor,
        ),
        // isRequired ? const ColumnSpacer(0.8) : const SizedBox.shrink(),
        // isRequired
        //     ? Text(
        //         error ?? 'Обязательное поле',
        //         textAlign: TextAlign.left,
        //         style: AppTextStyles.bodyM.copyWith(
        //             color: AppComponents.inputPrimaryHinttextColorError),
        //       )
        //     : const SizedBox.shrink(),
      ],
    );
  }
}

class TimeTextInputFormatter extends TextInputFormatter {
  TimeTextInputFormatter(
      {required this.hourMaxValue, required this.minuteMaxValue}) {
    _exp = RegExp(r'^$|[0-9:]+$');
  }
  late RegExp _exp;

  final int hourMaxValue;
  final int minuteMaxValue;

  get math => null;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (_exp.hasMatch(newValue.text)) {
      TextSelection newSelection = newValue.selection;

      final String value = newValue.text;
      String newText;

      String leftChunk = '';
      String rightChunk = '';

      if (value.length > 1 &&
          (int.tryParse(value.substring(0, 2)) ?? 0) == hourMaxValue)
      //this logic is to restrict value more than max hour
      {
        if (oldValue.text.contains(':')) {
          leftChunk = value.substring(0, 1);
        } else {
          leftChunk = '${value.substring(0, 2)}:';
          rightChunk = '00';
        }
      } else if (value.length > 5) {
        //this logic is to not allow more value
        leftChunk = oldValue.text;
      } else if (value.length == 5) {
        if ((int.tryParse(value.substring(3)) ?? 0) > minuteMaxValue) {
          //this logic is to restrict value more than max minute
          leftChunk = oldValue.text;
        } else {
          leftChunk = value;
        }
      } else if (value.length == 2) {
        if (oldValue.text.contains(':')) {
          //this logic is to delete : & value before : ,when backspacing
          leftChunk = value.substring(0, 1);
        } else {
          if ((int.tryParse(value) ?? 0) > hourMaxValue) {
            //this logic is to restrict value more than max hour
            leftChunk = oldValue.text;
          } else {
            //this logic is to add : with second letter
            leftChunk = '${value.substring(0, 2)}:';
            rightChunk = value.substring(2);
          }
        }
      } else {
        leftChunk = value;
      }
      newText = leftChunk + rightChunk;

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(newText.length, newText.length),
        extentOffset: math.min(newText.length, newText.length),
      );

      return TextEditingValue(
        text: newText,
        selection: newSelection,
      );
    }
    return oldValue;
  }
}
