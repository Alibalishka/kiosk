import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/requests/check_promo_requests.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/promo_model.dart';
import 'package:qr_pay_app/src/features/qr/logic/repository/cart_repository.dart';

part 'promo_code_event.dart';
part 'promo_code_state.dart';
part 'promo_code_bloc.freezed.dart';

class PromoCodeBloc extends Bloc<PromoCodeEvent, PromoCodeState> {
  final CartRepository _cartRepository;
  PromoCodeBloc({required final CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const _Initial()) {
    on<PromoCodeEvent>(
      (event, emit) => event.map(
        checkPromoCode: (event) => _checkPromoCode(event, emit),
      ),
    );
  }

  Future<void> _checkPromoCode(
    _CheckPromoCode event,
    Emitter<PromoCodeState> emit,
  ) async {
    emit(const PromoCodeState.loading());
    try {
      final result = await _cartRepository.checkPromoCode(body: event.body);
      result.when(
        success: (response) =>
            emit(PromoCodeState.success(promoModel: response)),
        failure: (error) => emit(
          PromoCodeState.failed(message: error.msg ?? 'Ошибка загурзки данных'),
        ),
      );
    } on Object {
      emit(const PromoCodeState.failed());
    }
  }
}
