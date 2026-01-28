import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/launch_in_browser.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_appbar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/bank_cart_bloc/bank_cart_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/payment_method.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key, required this.paymentMethod});
  final List<PaymentMethodDatum> paymentMethod;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  late BankCartBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BankCartBloc(authRepository: sl());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankCartBloc, BankCartState>(
      bloc: bloc,
      listener: (context, state) => state.maybeWhen(
        orElse: () => Container(),
        successAdd: (data) => LaunchInBrowserUtil.launchUrl(data.data!.url!)
            // ignore: use_build_context_synchronously
            .then((_) => context.router.pop()),
      ),
      builder: (context, state) => state.maybeWhen(
        loading: () => Container(
          decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerLoadingHorizontal(),
            ],
          ),
        ),
        orElse: () => Container(
          decoration: const BoxDecoration(
              color: AppColors.semanticBgSurface1,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BottomSheetAppBar(
                title: 'Выберите способы оплаты',
                svg: AppSvgImages.iconLeft,
              ),
              Padding(
                padding: AppPaddings.horizontal16,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () => bloc.add(BankCartEvent.addBankCard(
                        id: widget.paymentMethod[index].id!)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        color: AppColors.none,
                        child: Row(
                          children: [
                            SvgPicture.asset(AppSvgImages.card),
                            const RowSpacer(1.2),
                            Text(
                              widget.paymentMethod[index].name ?? '',
                              style: AppTextStyles.bodyL.copyWith(
                                  color:
                                      AppComponents.listitemTitleColorDefault),
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppSvgImages.chevronForward)
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const CustomDivider(),
                  itemCount: widget.paymentMethod.length,
                ),
              ),
              const ColumnSpacer(1.6),
            ],
          ),
        ),
      ),
    );
  }
}
