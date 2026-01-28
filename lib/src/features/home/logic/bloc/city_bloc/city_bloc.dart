import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/city_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final HomeRepository _homeRepository;
  CityBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    on<CityEvent>(
      (event, emit) => event.map(fetchCity: (event) => _fetchCity(event, emit)),
    );
  }

  Future<void> _fetchCity(
    _FetchCity event,
    Emitter<CityState> emit,
  ) async {
    try {
      final result = await _homeRepository.fetchCity();
      result.when(
        success: (response) => emit(CityState.success(cityModel: response)),
        failure: (error) => emit(
            CityState.failed(message: error.msg ?? 'Ошибка загурзки данных')),
      );
    } on Object {
      emit(const CityState.failed());
    }
  }
}
