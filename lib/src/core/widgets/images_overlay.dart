import 'package:auto_route/auto_route.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class ImagesOverlay extends StatelessWidget {
  final int length;
  final int current;

  const ImagesOverlay({
    required this.length,
    required this.current,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  color: Colors.black,
                  onPressed: () => context.router.pop(),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                length,
                (index) => Container(
                  width: 15,
                  height: 15,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: current == index
                        ? AppColors.semanticFgDefault
                        : AppColors.semanticBgSurface1,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
