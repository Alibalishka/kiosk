import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_pay_app/src/core/base/view_model_mixin.dart';
import 'package:qr_pay_app/src/core/resources/app_components.dart';
import 'package:qr_pay_app/src/core/resources/app_paddings.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/t_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/column_spacer.dart';
import 'package:qr_pay_app/src/core/widgets/custom_bar.dart';
import 'package:qr_pay_app/src/core/widgets/custom_loader.dart';
import 'package:qr_pay_app/src/core/widgets/custom_snack_bar.dart';
import 'package:qr_pay_app/src/core/widgets/row_spacer.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/review_bloc/review_bloc.dart';
import 'package:qr_pay_app/src/features/home/vm/review_vm.dart';
import 'package:qr_pay_app/src/features/profile/widgets/not_auth_profile.dart';
import 'package:qr_pay_app/src/features/qr/widgets/custom_button.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({
    super.key,
    required this.viewModel,
  });
  final ReviewVm viewModel;

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage>
    with ViewModelMixin<RatingPage, ReviewVm> {
  @override
  ReviewVm get viewModel => widget.viewModel;

  List<String> price = ['0 ₸', '500 ₸', '1 000 ₸', '2 000 ₸'];
  int selectedIndex = 0;
  String? customPrice;
  bool showFeeInfo = false;
  bool isFeeChecked = false;
  bool isAgreementChecked = false;

  void showModal(BuildContext context) {
    TextEditingController controller = TextEditingController();
    bool isButtonEnabled = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: AppComponents.navbarBgColorDefault,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: AppPaddings.horizontal16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ColumnSpacer(0.8),
                    const CustomBar(),
                    const ColumnSpacer(2),
                    Text(
                      'Другая сумма',
                      style: AppTextStyles.headingH2.copyWith(
                        color: AppComponents.navbarTitleColorDefault,
                      ),
                    ),
                    const ColumnSpacer(2.8),
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setModalState(() {
                          isButtonEnabled = value.trim().isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Введите сумму',
                        hintStyle: AppTextStyles.bodyL.copyWith(
                          color: AppComponents
                              .textareaPrimaryPlaceholdertextColorDefault,
                        ),
                        filled: true,
                        fillColor:
                            AppComponents.textareaSecondaryBgColorDefault,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: AppComponents
                                .textareaSecondaryBorderColorDefault,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color:
                                AppComponents.textareaSecondaryBorderColorFocus,
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: AppComponents
                                .textareaSecondaryBorderColorDefault,
                          ),
                        ),
                      ),
                    ),
                    const ColumnSpacer(1.2),
                    CustomButton(
                      text: 'Сохранить',
                      onPressed: isButtonEnabled
                          ? () {
                              setState(() {
                                customPrice = '${controller.text} ₸';
                                selectedIndex = price.length;
                              });
                              Navigator.pop(context);
                            }
                          : null,
                    ),
                    const ColumnSpacer(3),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  double calculateFee() {
    String selectedPrice = selectedIndex == price.length
        ? customPrice?.replaceAll(RegExp(r'[^0-9]'), '') ?? '0'
        : price[selectedIndex].replaceAll(RegExp(r'[^0-9]'), '');

    double amount = double.tryParse(selectedPrice) ?? 0;
    return (amount * 0.01).roundToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.howDidItGo.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.headingH2.copyWith(
                color: AppComponents
                    .modalModalcontentTextcontentTitleColorDefault),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () => context.router.pop(),
              child: Padding(
                padding: AppPaddings.horizontal16,
                child: SvgPicture.asset(AppSvgImages.closeLarge),
              ),
            )
          ],
        ),
        body: BlocConsumer<ReviewBloc, ReviewState>(
          bloc: viewModel.bloc,
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            successFetch: (data) => viewModel.synchData(data),
            failed: (error) => showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                textAlign: TextAlign.start,
                message: error,
              ),
              dismissType: DismissType.onSwipe,
            ),
            successSend: () {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.success(
                  textAlign: TextAlign.start,
                  message: LocaleKeys.feedbackSent.tr(),
                ),
                dismissType: DismissType.onSwipe,
              );
              context.router.pop();
              return null;
            },
          ),
          builder: (context, state) => state.maybeWhen(
            // orElse: () => const SizedBox.shrink(),
            loading: () => const CircleLoader(),
            orElse: () => Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //const ColumnSpacer(1.6),
                      // Text(
                      //   LocaleKeys.howDidItGo.tr(),
                      //   textAlign: TextAlign.center,
                      //   style: AppTextStyles.headingH2.copyWith(
                      //       color: AppComponents
                      //           .modalModalcontentTextcontentTitleColorDefault),
                      // ),
                      const ColumnSpacer(0.8),
                      Text(
                        LocaleKeys.rateVisitSandyq.tr(),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyL.copyWith(
                            color: AppComponents
                                .modalModalcontentTextcontentSubtitleColorDefault),
                      ),
                      const ColumnSpacer(1.6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          viewModel.data.data?.length ?? 0,
                          (index) => GestureDetector(
                            onTap: () => viewModel.selectRating(
                              viewModel.data.data![index],
                              index + 1,
                            ),
                            child: Padding(
                              padding: AppPaddings.cardText,
                              child: SvgPicture.asset(
                                index < viewModel.ratingInitial
                                    ? AppSvgImages.ratingYellow
                                    : AppSvgImages.ratingStar,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const ColumnSpacer(1.6),
                      Text(
                        viewModel.name,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyL.copyWith(
                            color: AppComponents
                                .modalModalcontentTextcontentTitleColorDefault),
                      ),
                      const ColumnSpacer(2.4),
                      Text(
                        viewModel.slogan,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headingH3.copyWith(
                            color: AppComponents.listitemTitleColorDefault),
                      ),
                      const ColumnSpacer(1.6),
                      Padding(
                        padding: AppPaddings.horizontal16,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8,
                          runSpacing: 8,
                          children: viewModel.messages
                              .map(
                                (message) => GestureDetector(
                                  onTap: () =>
                                      viewModel.selectMessage(message.id ?? 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: AppComponents
                                      //     .chipgroupChipsSelectedBgColorDefault,
                                      border: Border.all(
                                        color: viewModel.selectMessages
                                                .contains(message.id)
                                            ? AppComponents
                                                .taggroupTagAccentActiveBorderColorDefault
                                            : AppComponents
                                                .taggroupTagInactiveBorderColorDefault,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    padding: AppPaddings.symmetric8x16,
                                    child: Text(
                                      message.message ?? '',
                                      style:
                                          // viewModel.selectMessages
                                          //         .contains(message.id)
                                          //     ? AppTextStyles.bodyMStrong.copyWith(
                                          //         color: AppComponents
                                          //             .chipgroupChipsSelectedLabelColorDefault,
                                          //       )
                                          //  :
                                          AppTextStyles.bodyM.copyWith(
                                        color: AppComponents
                                            .chipgroupChipsNotSelectedLabelColorDefault,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const ColumnSpacer(1.2),
                      viewModel.messages.isEmpty
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: AppPaddings.horizontal16,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.commentOptional.tr(),
                                  hintStyle: AppTextStyles.bodyL.copyWith(
                                    color: AppComponents
                                        .textareaPrimaryPlaceholdertextColorDefault,
                                  ),
                                  filled: true,
                                  fillColor: AppComponents
                                      .textareaSecondaryBgColorDefault,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                      color: AppComponents
                                          .textareaSecondaryBorderColorDefault,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: AppComponents
                                            .textareaSecondaryBorderColorFocus),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    borderSide: BorderSide(
                                        color: AppComponents
                                            .textareaSecondaryBorderColorDefault),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.done,
                                minLines: 4,
                                maxLines: 6,
                                controller: viewModel.commentController,
                                cursorColor: AppComponents
                                    .textareaPrimaryPlaceholdertextColorDefault,
                                style: AppTextStyles.bodyL.copyWith(
                                  color: AppComponents
                                      .textareaSecondaryInputtextColorDefault,
                                ),
                              ),
                            ),
                      // const SeparatorContainer(),
                      // Padding(
                      //   padding: AppPaddings.horizontal16,
                      //   child: Text(
                      //     'Ваш официант',
                      //     style: AppTextStyles.headingH4.copyWith(
                      //         color: AppComponents
                      //             .blockBlocktitleTitleColorDefault),
                      //   ),
                      // ),
                      // const ColumnSpacer(1.6),
                      // Padding(
                      //   padding: AppPaddings.horizontal16,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         width: 48,
                      //         height: 48,
                      //         decoration: const BoxDecoration(
                      //           shape: BoxShape.circle,
                      //         ),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(100),
                      //           child: CachedNetworkImage(
                      //             imageUrl:
                      //                 "https://s3-alpha-sig.figma.com/img/f855/4390/895640ad0dc14f4bf5beb6cb5274447a?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=tmLKxKbkNAUkj-DCBQtLCB~Tqngp~bodUVjhAkRfqP~AYZTJAkLdvm29e0QKNGhbUh8xl4LSzdm52X15NdnXJvXOOLjrqemoWSWgeItBHT3WMVH54iUwBBlBLBHoc-pTPdxwxdmSEhXe-ptwFfhraacEIIJOvak9HuFty-2le5CznYk2bdEXr6~0cN1ca3h7~md9lyOffyDsr0Mr223h9MPZJ1hn3qNXW2zuyXsTd739BzhfVpf~5PMTHynocWk6epDn0FGcsY7kjG4kkTT~WD-1Hq-gM6FuGxhmj8lJERgksZ9H-uZz1cDY3k0pCNeckwYqMgzmz3oJxvodBblbUQ__",
                      //             placeholder: (context, url) =>
                      //                 Image.asset(AppWebpImages.waiterAvatar),
                      //             errorWidget: (context, url, error) =>
                      //                 Image.asset(AppWebpImages.waiterAvatar),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //       const RowSpacer(1.2),
                      //       Flexible(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               'Таня',
                      //               style: AppTextStyles.bodyM.copyWith(
                      //                   color: AppComponents
                      //                       .listitemSubtitleColorDefault),
                      //             ),
                      //             const ColumnSpacer(0.4),
                      //             Text(
                      //               'Коплю на первый взнос по ипотеке, буду рада поддержке!',
                      //               style: AppTextStyles.bodyLStrong.copyWith(
                      //                   color: AppComponents
                      //                       .listitemTitleColorDefault),
                      //               overflow: TextOverflow.ellipsis,
                      //               maxLines: 3,
                      //             )
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const ColumnSpacer(1.6),
                      // SizedBox(
                      //   height: 44,
                      //   child: ListView.separated(
                      //     padding: AppPaddings.horizontal16,
                      //     scrollDirection: Axis.horizontal,
                      //     shrinkWrap: true,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       bool isSelected = selectedIndex == index;

                      //       if (index == price.length) {
                      //         return GestureDetector(
                      //           onTap: () => showModal(context),
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               border: Border.all(
                      //                   color: isSelected
                      //                       ? Colors.black
                      //                       : AppComponents
                      //                           .taggroupTagInactiveBorderColorDefault),
                      //               borderRadius: BorderRadius.circular(100),
                      //             ),
                      //             padding: AppPaddings.sym16x12,
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   customPrice ?? 'Другая сумма',
                      //                   style:
                      //                       AppTextStyles.bodyMStrong.copyWith(
                      //                     color: AppComponents
                      //                         .taggroupTagInactiveTextColorDefault,
                      //                   ),
                      //                 ),
                      //                 if (customPrice != null) ...[
                      //                   const RowSpacer(0.4),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       setState(() {
                      //                         customPrice = null;
                      //                         selectedIndex = 0;
                      //                         showFeeInfo = false;
                      //                       });
                      //                     },
                      //                     child: const Icon(Icons.close,
                      //                         size: 16,
                      //                         color: AppComponents
                      //                             .taggroupTagAccentActiveIconright1ColorDefault),
                      //                   ),
                      //                 ],
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       }

                      //       return GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             selectedIndex = index;
                      //             showFeeInfo = index != 0;
                      //           });
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: isSelected
                      //                     ? Colors.black
                      //                     : AppComponents
                      //                         .taggroupTagInactiveBorderColorDefault),
                      //             borderRadius: BorderRadius.circular(100),
                      //           ),
                      //           padding: AppPaddings.sym16x12,
                      //           child: Text(
                      //             price[index],
                      //             style: AppTextStyles.bodyMStrong.copyWith(
                      //               color: AppComponents
                      //                   .taggroupTagInactiveTextColorDefault,
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     separatorBuilder: (BuildContext contex, int index) =>
                      //         const RowSpacer(0.8),
                      //     itemCount: price.length + 1,
                      //   ),
                      // ),
                      // const ColumnSpacer(1.6),

                      if (showFeeInfo) ...[
                        Padding(
                          padding: AppPaddings.horizontal16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 1 соглашение
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFeeChecked = !isFeeChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isFeeChecked
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        color: isFeeChecked
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                      child: isFeeChecked
                                          ? const Icon(
                                              Icons.check,
                                              size: 16,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                    const RowSpacer(1.2),
                                    Flexible(
                                      child: Text(
                                        "Я хочу возместить комиссию ${calculateFee().toInt()} ₸, чтобы покрыть издержки на перевод средств сотруднику",
                                        style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .listitemBodytextColorDefault,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // 2 соглашение
                              const ColumnSpacer(1.6),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isAgreementChecked = !isAgreementChecked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isAgreementChecked
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        color: isAgreementChecked
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                      child: isAgreementChecked
                                          ? const Icon(
                                              Icons.check,
                                              size: 16,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                    const RowSpacer(1.2),
                                    Flexible(
                                      child: Text(
                                        "Я согласен с условиями Пользовательского соглашения и Политики обработки персональных данных",
                                        style: AppTextStyles.bodyM.copyWith(
                                          color: AppComponents
                                              .listitemBodytextColorDefault,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const ColumnSpacer(14),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 16,
                  right: 16,
                  child: SafeArea(
                      child: state.maybeWhen(
                    sendLoading: () => const CircleLoader(),
                    orElse: () => CustomButton(
                      text: LocaleKeys.send.tr(),
                      onPressed: () => viewModel.sendReview(),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
