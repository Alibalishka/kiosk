import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_pay_app/src/core/base/view_model.dart';
import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/localization_keys.g.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';
import 'package:qr_pay_app/src/core/utils/vibration.dart';
import 'package:qr_pay_app/src/core/widgets/bottom_sheet_content.dart';
import 'package:qr_pay_app/src/core/widgets/custom_sheet.dart';
import 'package:qr_pay_app/src/features/home/logic/bloc/review_bloc/review_bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/review_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/review_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

class ReviewVm extends ViewModel {
  final BuildContext context;
  final int id;
  final bool showModal;

  ReviewVm({
    required this.context,
    required this.id,
    this.showModal = true,
  });

  late ReviewBloc bloc;
  late ReviewRequest body;
  ReviewModel data = ReviewModel();
  TextEditingController commentController = TextEditingController();
  List<Message> messages = [];
  List<int> selectMessages = [];
  int ratingInitial = 0;
  String name = '';
  String slogan = '';

  @override
  void init() {
    bloc = ReviewBloc(homeRepository: sl<HomeRepository>())
      ..add(const ReviewEvent.fetchRatings());
    showModal ? showSheet() : null;
    super.init();
  }

  void showSheet() => Future.delayed(
        const Duration(milliseconds: 10),
        () => showCustomSheet(
          context,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.semanticBgSurface1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            child: BottomSheetContent(
              title: LocaleKeys.paymentSuccessful.tr(),
              text: LocaleKeys.orderPaySuccess.tr(),
              buttonText: LocaleKeys.close.tr(),
              icon: AppWebpImages.backgroundSquare,
            ),
          ),
        ),
      );

  Future<void> synchData(ReviewModel data) async {
    this.data = data;
    this.data.data?.sort((a, b) => a.rating!.compareTo(b.rating!));
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> selectRating(ReviewDatum data, int ratingInitial) async {
    Vibration.vibrate();
    this.ratingInitial = ratingInitial;
    name = data.name ?? '';
    slogan = data.slogan ?? '';
    messages = data.messages ?? [];
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  Future<void> selectMessage(int id) async {
    selectMessages.contains(id)
        ? selectMessages.remove(id)
        : selectMessages.add(id);
    await Future.delayed(const Duration(milliseconds: 10));
    notifyListeners();
  }

  void sendReview() {
    body = ReviewRequest(
      comment: commentController.text.isEmpty ? '' : commentController.text,
      rating: ratingInitial,
      ratingMessages: selectMessages,
    );
    bloc.add(ReviewEvent.sendReview(body: body, id: id));
  }
}
