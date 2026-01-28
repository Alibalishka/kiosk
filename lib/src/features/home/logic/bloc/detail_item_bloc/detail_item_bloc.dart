import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/detail_item_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/detail_item_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_item_event.dart';
part 'detail_item_state.dart';
part 'detail_item_bloc.freezed.dart';

class DetailItemBloc extends Bloc<DetailItemEvent, DetailItemState> {
  final DetailItemRepository _detailItemRepository;
  DetailItemBloc({required final DetailItemRepository detailItemRepository})
      : _detailItemRepository = detailItemRepository,
        super(const _Initial()) {
    on<DetailItemEvent>(
      (event, emit) => event.map(
        fetchDetailItem: (event) => _fetchDetailItem(event, emit),
      ),
    );
  }

  Future<void> _fetchDetailItem(
    DetailItemEvent event,
    Emitter<DetailItemState> emit,
  ) async {
    try {
      emit(const DetailItemState.initial());
      final result =
          await _detailItemRepository.getDetailItem(itemId: event.itemId);
      result.when(success: (response) {
        emit(DetailItemState.successDetailItem(detailItemModel: response));
      }, failure: (error) {
        emit(DetailItemState.errorDetailItem(
            message: error.msg ?? 'Ошибка загурзки данных'));
      });
    } on Object {
      emit(const DetailItemState.errorDetailItem());
      rethrow;
    }
  }
}
