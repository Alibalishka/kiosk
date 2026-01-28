import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/qr_menu_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';

part 'qr_menu_event.dart';
part 'qr_menu_state.dart';
part 'qr_menu_bloc.freezed.dart';

class QrMenuBloc extends Bloc<QrMenuEvent, QrMenuState> {
  final HomeRepository _homeRepository;
  QrMenuBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Initial()) {
    on<QrMenuEvent>(
      (event, emit) =>
          event.map(fetchQrMenu: (event) => _fetchQrMenu(event, emit)),
    );
  }
  Future<void> _fetchQrMenu(
    QrMenuEvent event,
    Emitter<QrMenuState> emit,
  ) async {
    emit(const QrMenuState.loading());
    try {
      final result = await _homeRepository.fetchQrMenu(id: event.id);
      result.when(
        success: (response) => emit(QrMenuState.success(qrMenuModel: response)),
        failure: (error) => emit(
          QrMenuState.failed(
            message: error.msg ?? 'Ошибка загурзки данных',
            errorCode: error.errorCode,
          ),
        ),
      );
    } on Object {
      emit(const QrMenuState.failed());
    }
  }
}
