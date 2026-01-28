import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/review_request.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/review_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

part 'review_event.dart';
part 'review_state.dart';
part 'review_bloc.freezed.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final HomeRepository _homeRepository;
  ReviewBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    on<ReviewEvent>(
      (event, emit) => event.map(
        fetchRatings: (event) => _fetchRatings(event, emit),
        sendReview: (event) => _sendReview(event, emit),
      ),
    );
  }

  Future<void> _fetchRatings(
    _FetchRatings event,
    Emitter<ReviewState> emit,
  ) async {
    emit(const ReviewState.loading());
    try {
      final result = await _homeRepository.fetchRatings();
      result.when(
        success: (response) =>
            emit(ReviewState.successFetch(ratingEntity: response)),
        failure: (error) => emit(
            ReviewState.failed(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const ReviewState.failed());
    }
  }

  Future<void> _sendReview(
    _SendReview event,
    Emitter<ReviewState> emit,
  ) async {
    emit(const ReviewState.sendLoading());
    try {
      final result =
          await _homeRepository.sendReview(body: event.body, id: event.id);
      result.when(
        success: (response) => emit(const ReviewState.successSend()),
        failure: (error) => emit(
            ReviewState.failed(message: error.msg ?? 'Ошибка отправки отзыва')),
      );
    } on Object {
      emit(const ReviewState.failed());
    }
  }
}
