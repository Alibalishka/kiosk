import 'dart:io';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';

const _blueColor = AppComponents.buttongroupButtonPrimaryBgColorDefault;
const _containerHeight = 40.0;

class KeyboardOverlayFocusWidget extends StatelessWidget {
  final bool showArrows;
  final Widget? widget;
  final Function()? callback;

  const KeyboardOverlayFocusWidget({
    this.showArrows = false,
    this.widget,
    this.callback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return isKeyboardVisible
            ? Platform.isIOS
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: _containerHeight,
                      margin: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xff27282D)
                            : const Color(0xffF1F1F1),
                      ),
                      child: Row(
                        children: [
                          if (showArrows)
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      FocusScope.of(context).previousFocus(),
                                  child: SvgPicture.asset(AppSvgImages.barcode),
                                ),
                                const RowSpacer(16),
                                GestureDetector(
                                  onTap: () =>
                                      FocusScope.of(context).nextFocus(),
                                  child: SvgPicture.asset(AppSvgImages.camera),
                                ),
                              ],
                            ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              callback?.call();
                              FocusScope.of(context).unfocus();
                            },
                            child: Text(
                              'Далее',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: _blueColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
            : Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: widget ?? const SizedBox(),
              );
      },
    );
  }
}
