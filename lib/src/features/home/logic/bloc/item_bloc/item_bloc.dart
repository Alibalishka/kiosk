import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/items_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

part 'item_event.dart';
part 'item_state.dart';
part 'item_bloc.freezed.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final HomeRepository _homeRepository;
  ItemBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    on<ItemEvent>(
      (event, emit) => event.map(
        fetchItem: (event) => _fetchItems(event, emit),
      ),
    );
  }

  Future<void> _fetchItems(
    _FetchItem event,
    Emitter<ItemState> emit,
  ) async {
    emit(const ItemState.loading());
    try {
      final result = await _homeRepository.fetchItem();
      result.when(
        success: (response) => emit(ItemState.success(items: response)),
        failure: (error) => emit(
          ItemState.failed(message: error.msg ?? 'Ошибка загурзки данных'),
        ),
      );
    } on Object {
      emit(const ItemState.failed());
    }
  }
}
