import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/widgets/animated_card.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({
    super.key,
    this.detailPage = false,
  });
  final bool detailPage;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileVm>(
      builder: (context, value, state) {
        return value.subscription == null
            ? const SizedBox.shrink()
            : AnimatedCard(
                child: Material(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: GestureDetector(
                    onTap: () => context.router
                        .push(const SubscriptionProviderRoute())
                        .then((_) => context.read<ProfileVm>().fetchUser()),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                stops: [0.1, 0.85],
                                colors: [
                                  Color.fromRGBO(197, 120, 33, 1),
                                  Color.fromRGBO(149, 11, 46, 1)
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 16, top: 16, bottom: 16, left: 90),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          detailPage
                                              ? 'Действует акция'
                                              : '${LocaleKeys.subscription.tr()} PRIME',
                                          style: AppTextStyles.bodyXlStrong
                                              .copyWith(
                                                  color: AppComponents
                                                      .tileTitleColorDefault),
                                        ),
                                        const ColumnSpacer(0.6),
                                        Text(
                                          detailPage
                                              ? LocaleKeys
                                                  .freeDrinkWithSubscription
                                                  .tr()
                                              : value.subscription?.data
                                                      ?.description ??
                                                  '',
                                          style: AppTextStyles.bodyS.copyWith(
                                              color: AppComponents
                                                  .tileTitleColorDefault),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(AppSvgImages.chevronForward),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          bottom: 12,
                          child: Image.asset(
                            detailPage
                                ? AppWebpImages.backgroundSquare
                                : AppWebpImages.buySubscription,
                            height: 98,
                            width: 74,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
