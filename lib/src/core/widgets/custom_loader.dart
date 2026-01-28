import 'dart:io';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleLoader extends StatelessWidget {
  const CircleLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const Center(
          child: CupertinoActivityIndicator(
        color: AppColors.primitiveNeutralwarm0,
      ));
    } else if (Platform.isAndroid) {
      return Center(
        child: Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.semanticBgSurface1),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(
              color: AppColors.semanticFgDefault,
              strokeWidth: 2.5,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
