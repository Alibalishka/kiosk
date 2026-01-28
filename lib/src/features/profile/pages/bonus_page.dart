import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/formatters/date_formats.dart';
import 'package:qr_pay_app/src/core/formatters/price_formats.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_divider.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/list_item1.dart';
import 'package:qr_pay_app/src/features/app/router/app_router.dart';
import 'package:qr_pay_app/src/features/profile/logic/bloc/history_bloc/history_bloc.dart';
import 'package:qr_pay_app/src/features/profile/logic/model/responses/history_model.dart';
import 'package:qr_pay_app/src/features/profile/pages/bonus_history.dart';
import 'package:qr_pay_app/src/features/profile/vm/profile_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:qr_pay_app/src/features/profile/widgets/shimmer_hor.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_appbar.dart';
import 'package:talker_flutter/talker_flutter.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key, required this.viewModel});
  final ProfileVm viewModel;

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  late HistoryBloc bloc;
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  @override
  void initState() {
    super.initState();
    bloc = HistoryBloc(authRepository: sl())
      ..add(const HistoryEvent.fetchHistory());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    int countDev = 0;
    return Consumer<ProfileVm>(builder: (context, value, state) {
      return Scaffold(
        appBar: CustomAppBar(
            text: LocaleKeys.myBonuses.tr(),
            hasLeading: true,
            // rightText: viewModel.user?.data?.subscription == null ? null : '',
            onRightTap: () =>
                context.router.push(const SubscriptionProviderRoute())
            // context.router.push(const SubscriptionInfoPageRoute()),
            ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ColumnSpacer(1),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.semanticBgSurface1,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          count++;
                          count == 10
                              ? Navigator.of(context)
                                  .push(MaterialPageRoute(
                                    builder: (context) =>
                                        TalkerScreen(talker: sl<Talker>()),
                                  ))
                                  .then((_) => count = 0)
                              : null;
                        },
                        child: ListItem2(
                          title: LocaleKeys.pointsAccumulated.tr(),
                          subtitle:
                              '${priceFormat(value.user?.data?.balance?.bonus.toString() ?? '0')} ',
                          titleStyle: AppTextStyles.bodyL.copyWith(
                              color: AppComponents.listitemTitleColorDefault),
                          subtitleStyle: AppTextStyles.headingH2.copyWith(
                              color: AppComponents.listitemTitleColorDefault),
                        ),
                      ),
                      ListItem2(
                        title: LocaleKeys.cashback.tr(),
                        subtitle:
                            ' ${value.user?.data!.cashbackPercentage ?? 0} %',
                        titleStyle: AppTextStyles.bodyL.copyWith(
                            color: AppComponents.listitemTitleColorDefault),
                        subtitleStyle: AppTextStyles.headingH2.copyWith(
                            color: AppComponents.listitemTitleColorDefault),
                        divider: false,
                      ),
                      // ListItem2(
                      //   title: 'Всего чеков',
                      //   subtitle:
                      //       '${priceFormat(value.user?.data?.endCheckHour?.toString() ?? '0')}',
                      //   divider: false,
                      //   titleStyle: AppTextStyles.bodyL.copyWith(
                      //       color: AppComponents.listitemTitleColorDefault),
                      //   subtitleStyle: AppTextStyles.headingH2.copyWith(
                      //       color: AppComponents.listitemTitleColorDefault),
                      // )
                    ],
                  ),
                ),
              ),
              //const ColumnSpacer(1.2),
              BlocBuilder<HistoryBloc, HistoryState>(
                bloc: bloc,
                builder: (context, state) => state.maybeWhen(
                  orElse: () => Container(),
                  loading: () => const ShimmerLoadingHorizontal(count: 10),
                  failed: (_) => const SizedBox(),
                  success: (history) => history.data?.isEmpty ?? true
                      ? const SizedBox()

                      // Padding(
                      //     padding: AppPaddings.horizontal16,
                      //     child: NotAutorizedView(
                      //       title: LocaleKeys.bonusesHere.tr(),
                      //       subtitle: LocaleKeys.bonusesHereDesc.tr(),
                      //       buttonText: '',
                      //       button: false,
                      //       image: AppWebpImages.noBonuses,
                      //     ),
                      //   )
                      : GroupedListView<HistoryDatum, String>(
                          shrinkWrap: true,
                          //padding: AppPaddings.horizontal16,
                          elements: history.data ?? [],
                          sort: false,
                          floatingHeader: true,
                          groupBy: (element) =>
                              (element.createdAt ?? DateTime.now()).toString(),
                          itemComparator: (e1, e2) => (dateFormat.parse(
                                  e1.createdAt ?? DateTime.now().toString()))
                              .compareTo((dateFormat.parse(
                                  e2.createdAt ?? DateTime.now().toString()))),
                          groupSeparatorBuilder: (value) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SeparatorContainer(),
                              Padding(
                                padding: AppPaddings.horizontal16,
                                child: Text(
                                  getDayMonth2(
                                      dateFormat.parse(value).toString()),
                                  style: AppTextStyles.bodyM.copyWith(
                                    color: AppComponents
                                        .listitemSubtitleColorDefault,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          separator: Padding(
                            padding: AppPaddings.horizontal16,
                            child: const CustomDivider(),
                          ),
                          itemBuilder: (ctx, e) => Padding(
                            padding: AppPaddings.horizontal16,
                            child: OrderItemWidget(
                              onTap: () {
                                if (e.orderId != null && e.orderId != 0) {
                                  context.router.push(
                                    HistoryOrderDetailPageRoute(id: e.orderId!),
                                  );
                                } else {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    const CustomSnackBar.error(
                                      textAlign: TextAlign.start,
                                      message: 'Нет данных о заказе',
                                    ),
                                    dismissType: DismissType.onSwipe,
                                  );
                                }
                              },
                              title: '${e.bonus} ${LocaleKeys.points.tr()}',
                              subtitle: e.text,
                            ),
                          ),
                        ),
                ),
              ),
              // CustomButton(
              //   text: LocaleKeys.bonusHistory.tr(),
              //   onPressed: () =>
              //       context.router.push(const BonusHistoryPageRoute()),
              // ),
            ],
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
        //   child: GestureDetector(
        //     onTap: () {
        //       showCustomSheet(
        //         context,
        //         child: const SpendBonus(),
        //       );
        //     },
        //     child: Container(
        //       decoration: const BoxDecoration(
        //         color: AppColors.semanticBgSurface1,
        //         borderRadius: BorderRadius.all(Radius.circular(12)),
        //       ),
        //       child: Padding(
        //         padding: AppPaddings.sym16x12,
        //         child: Row(
        //           children: [
        //             Text(
        //               LocaleKeys.howToSpendBonuses.tr(),
        //               style: AppTextStyles.headingH4.copyWith(
        //                   color: AppComponents.listitemTitleColorDefault),
        //             ),
        //             const Spacer(),
        //             SvgPicture.asset(
        //               AppSvgImages.chevronForward,
        //               color: AppComponents
        //                   .navmenuNavmenuelementIconrightColorDefault,
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      );
    });
  }
}
