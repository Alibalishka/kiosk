import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/free_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

part 'free_event.dart';
part 'free_state.dart';
part 'free_bloc.freezed.dart';

class FreeBloc extends Bloc<FreeEvent, FreeState> {
  final HomeRepository _homeRepository;
  FreeBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    on<FreeEvent>(
      (event, emit) => event.map(
        fetchFreeItems: (event) => _fetchFreeItems(event, emit),
      ),
    );
  }

  Future<void> _fetchFreeItems(
    _FetchFreeItems event,
    Emitter<FreeState> emit,
  ) async {
    emit(const FreeState.loading());
    try {
      final result = await _homeRepository.fetchFreeItems(
        idSubscription: event.idSubscription,
        idItem: event.idItem,
      );
      result.when(
        success: (items) => emit(FreeState.success(items: items)),
        failure: (error) => emit(
          FreeState.failed(message: error.msg ?? 'Ошибка загурзки данных'),
        ),
      );
    } on Object {
      emit(const FreeState.failed());
    }
  }
}
