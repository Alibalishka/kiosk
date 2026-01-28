import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/extensions/context.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/city_bloc/city_bloc.dart';
import 'package:qr_pay_app/src/features/home/vm/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.viewModel,
  });
  final HomeVm viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CityBloc, CityState>(
      bloc: viewModel.cityBloc,
      listener: (context, state) => state.maybeWhen(
          orElse: () => Container(),
          success: (cityData) => viewModel.saveCity(cityData.data ?? [])),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            const ColumnSpacer(7),
            Padding(
              padding: AppPaddings.horizontal16,
              child: Container(
                color: AppColors.none,
                child: Row(
                  children: [
                    // Image.asset(
                    //   AppWebpImages.logo,
                    //   height: 20,
                    // ),
                    Text(
                      'Qr Pay',
                      style: AppTextStyles.headingH2.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    // выбор города
                    // GestureDetector(
                    //     onTap: () => showCustomSheet(
                    //           context,
                    //           child: ChooseCity(viewModel: viewModel),
                    //         ),
                    //     child: Row(
                    //       children: [
                    //         SvgPicture.asset(AppSvgImages.location),
                    //         const RowSpacer(0.8),
                    //         Text(
                    //           viewModel.currentCity?.name ??
                    //               LocaleKeys.selectCity.tr(),
                    //           overflow: TextOverflow.ellipsis,
                    //           style: AppTextStyles.bodyL.copyWith(
                    //               color: AppComponents.navbarTitleColorDefault),
                    //         ),
                    //       ],
                    //     )),

                    //
                    const Spacer(),
                    Consumer<ProfileVm>(
                      builder: (context, value, state) {
                        return value.isAuthorized
                            ? GestureDetector(
                                onTap: () => context.router
                                    .push(BonusPageRoute(viewModel: value)),
                                child: Row(
                                  children: [
                                    // Image.asset(
                                    //   AppWebpImages.p,
                                    //   height: 16,
                                    // ),
                                    SvgPicture.asset(
                                      AppSvgImages.point,
                                      height: 20,
                                    ),
                                    const RowSpacer(0.6),
                                    Text(
                                      priceFormat(value
                                              .user?.data?.balance?.bonus
                                              .toString() ??
                                          '0'),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.headingH3.copyWith(
                                          color: AppColors.semanticFgDefault),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
            const ColumnSpacer(0.2),
          ],
        ),
      ),
    );
  }
}
