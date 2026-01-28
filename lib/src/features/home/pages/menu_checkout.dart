import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/logic/token_storage.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/vm/qr_menu_vm.dart';
import 'package:qr_pay_app/src/features/home/widgets/in_restaurant_content.dart';
import 'package:qr_pay_app/src/features/home/widgets/tabbar_widget.dart';
import 'package:qr_pay_app/src/features/home/widgets/take_away.dart';
import 'package:qr_pay_app/src/features/profile/widgets/enter_phone_bottom_sheet.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class QrMenuCheckoutPage extends StatefulWidget {
  const QrMenuCheckoutPage({super.key});

  @override
  State<QrMenuCheckoutPage> createState() => _QrMenuCheckoutPageState();
}

class _QrMenuCheckoutPageState extends State<QrMenuCheckoutPage>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<QrMenuVm>(context, listen: false);
    return Scaffold(
      backgroundColor: AppComponents.blockBgColorDefault,
      appBar: CustomAppBar(
        text: LocaleKeys.yourOrder.tr(),
        isTablet: true,
        hasLeading: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppComponents.blockBgColorDefault,
            ),
            child: Column(
              children: [
                const ColumnSpacer(1.2),
                TabbarWidget(tabController: tabController),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                InRestaurantContent(),
                TakeAwayContent(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppComponents.buttondockBgColorDefault,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 20,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 34,
            left: 16,
            right: 16,
          ),
          child: Consumer<QrMenuVm>(
            builder: (context, value, state) {
              return SafeArea(
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(16),
                  onPressed: () async {
                    if (sl<ITokenStorage>().getToken()?.isNotEmpty ?? false) {
                      await value.checkQrCode(context, tabController.index);
                    } else {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        useRootNavigator: true,
                        backgroundColor: AppComponents.modalBgColorDefault,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12))),
                        builder: (context) => const EnterPhoneBottomSheet(),
                      );
                    }
                  },
                  color: AppComponents.buttongroupButtonPrimaryBgColorDefault,
                  padding: EdgeInsets.symmetric(
                      vertical: viewModel.isTablet ? 8 : 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.payment.tr(),
                          style: AppTextStyles.bodyLStrong.copyWith(
                              fontSize: viewModel.isTablet ? 18.sp : null,
                              color: AppComponents
                                  .buttongroupButtonPrimaryTextColorDefault),
                        ),
                        const RowSpacer(0.8),
                        Text(
                          priceFormat(
                            '${priceFormat(value.getTotalPrice().toInt().toString())} ₸',
                          ),
                          style: AppTextStyles.bodyLStrong.copyWith(
                            color: AppComponents
                                .buttongroupButtonPrimaryTextColorDefault,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
