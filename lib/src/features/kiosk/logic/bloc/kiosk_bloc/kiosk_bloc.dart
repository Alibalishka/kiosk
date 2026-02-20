import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_status_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kaspi_status_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/screen_savers_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/tech_work_response.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/repository/kiosk_repository.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_request.dart';

part 'kiosk_event.dart';
part 'kiosk_state.dart';
part 'kiosk_bloc.freezed.dart';

class KioskBloc extends Bloc<KioskEvent, KioskState> {
  final KioskRepository _kioskRepository;
  KioskBloc({required final KioskRepository kioskRepository})
      : _kioskRepository = kioskRepository,
        super(const _Initial()) {
    on<KioskEvent>(
      (event, emit) => event.map(
        register: (event) => _register(event, emit),
        checkKiosk: (event) => _checkKiosk(event, emit),
        sendStatusKiosk: (event) => _sendStatusKiosk(event, emit),
        payKaspi: (event) => _payKaspi(event, emit),
        checkKapiPayStatus: (event) => _checkKapiPayStatus(event, emit),
        fetchScreenSavers: (event) => _fetchScreenSavers(event, emit),
        techWork: (event) => _techWork(event, emit),
      ),
    );
  }

  Future<void> _register(
    _Register event,
    Emitter<KioskState> emit,
  ) async {
    emit(const KioskState.loading());
    try {
      final result = await _kioskRepository.register(body: event.body);
      result.when(
        success: (reponse) => emit(KioskState.success(response: reponse)),
        failure: (error) => emit(KioskState.failed(
          message: error.msg ?? 'Ошибка загурзки данных',
          errorCode: error.errorCode,
        )),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }

  Future<void> _checkKiosk(
    _CheckKiosk event,
    Emitter<KioskState> emit,
  ) async {
    emit(const KioskState.loading());
    try {
      final result =
          await _kioskRepository.checkKiosk(deviceId: event.deviceId);
      result.when(
        success: (reponse) =>
            emit(KioskState.checkKioskSuccess(response: reponse)),
        failure: (error) => emit(KioskState.failed(
          message: error.msg ?? 'Ошибка загурзки данных',
          errorCode: error.errorCode,
        )),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }

  Future<void> _sendStatusKiosk(
    _SendStatusKiosk event,
    Emitter<KioskState> emit,
  ) async {
    emit(const KioskState.loading());
    try {
      final result = await _kioskRepository.sendStatusKiosk(
          body: event.body, deviceId: event.deviceId);
      result.when(
        success: (response) =>
            emit(KioskState.successKioskStatus(response: response)),
        failure: (error) => emit(KioskState.failed(
          message: error.msg ?? 'Ошибка загурзки данных',
          errorCode: error.errorCode,
        )),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }

  Future<void> _payKaspi(
    _PayKaspi event,
    Emitter<KioskState> emit,
  ) async {
    emit(const KioskState.loading());
    try {
      final result = await _kioskRepository.payKaspi(body: event.body);
      result.when(
        success: (reponse) =>
            emit(KioskState.successPayData(response: reponse)),
        failure: (error) => emit(
          KioskState.failed(
            message: error.msg ?? 'Ошибка загурзки данных',
            errorCode: error.errorCode,
          ),
        ),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }

  Future<void> _checkKapiPayStatus(
    _CheckKapiPayStatus event,
    Emitter<KioskState> emit,
  ) async {
    emit(const KioskState.loadingPay());
    try {
      final result =
          await _kioskRepository.checkKapiPayStatus(orderId: event.orderId);
      result.when(
        success: (reponse) => emit(KioskState.successPay(response: reponse)),
        failure: (error) => emit(KioskState.failed(
          message: error.msg ?? 'Ошибка загурзки данных',
          errorCode: error.errorCode,
        )),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }

  Future<void> _fetchScreenSavers(
    _FetchScreenSavers event,
    Emitter<KioskState> emit,
  ) async {
    try {
      final result =
          await _kioskRepository.fetchScreenSavers(deviceId: event.deviceId);
      result.when(
        success: (reponse) =>
            emit(KioskState.successScreenSavers(response: reponse)),
        failure: (error) => emit(KioskState.failed(
          message: error.msg ?? 'Ошибка загурзки данных',
          errorCode: error.errorCode,
        )),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }

  Future<void> _techWork(
    _TechWork event,
    Emitter<KioskState> emit,
  ) async {
    try {
      final result = await _kioskRepository.techWork();
      result.when(
        success: (reponse) =>
            emit(KioskState.successTechWork(response: reponse)),
        failure: (error) => emit(KioskState.failed(
          message: error.msg ?? 'Ошибка загурзки данных',
          errorCode: error.errorCode,
        )),
      );
    } on Object {
      emit(const KioskState.failed());
    }
  }
}
