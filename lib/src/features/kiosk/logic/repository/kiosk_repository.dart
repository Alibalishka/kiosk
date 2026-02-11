import 'package:qr_pay_app/src/core/server/layers/network_executer.dart';
import 'package:qr_pay_app/src/core/server/result.dart';
import 'package:qr_pay_app/src/features/home/logic/models/requests/menu_checkout.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/kiosk_api.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/requests/kiosk_status_request.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kaspi_status_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/kiosk_status.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/screen_savers_response.dart';
import 'package:qr_pay_app/src/features/kiosk/logic/model/response/tech_work_response.dart';
import 'package:qr_pay_app/src/features/qr/logic/models/responses/pay_model.dart';

abstract class KioskRepository {
  Future<Result<KioskResponse>> register({required KioskRequest body});
  Future<Result<KioskResponse>> checkKiosk({required String deviceId});
  Future<Result<KioskStatus>> sendStatusKiosk({
    required KioskStatusRequest body,
    required String deviceId,
  });
  Future<Result<PayModel>> payKaspi({required MenuCheckoutRequest body});
  Future<Result<KaspiStatus>> checkKapiPayStatus({required int orderId});
  Future<Result<ScreenSaversResponse>> fetchScreenSavers(
      {required String deviceId});
  Future<Result<TechWorkResponse>> techWork();
}

class KioskRepositoryImpl implements KioskRepository {
  final NetworkExecuter client;

  KioskRepositoryImpl({required this.client});

  @override
  Future<Result<KioskResponse>> register({required KioskRequest body}) async {
    return await client.execute(
      route: KioskApi.register(body: body),
      responseType: KioskResponse(),
    );
  }

  @override
  Future<Result<KioskResponse>> checkKiosk({required String deviceId}) async {
    return await client.execute(
      route: KioskApi.checkKiosk(deviceId: deviceId),
      responseType: KioskResponse(),
    );
  }

  @override
  Future<Result<KioskStatus>> sendStatusKiosk({
    required KioskStatusRequest body,
    required String deviceId,
  }) async {
    return await client.execute(
      route: KioskApi.sendStatusKiosk(body: body, deviceId: deviceId),
      responseType: KioskStatus(),
    );
  }

  @override
  Future<Result<PayModel>> payKaspi({required MenuCheckoutRequest body}) async {
    return await client.execute(
      route: KioskApi.payKaspi(body: body),
      responseType: PayModel(),
    );
  }

  @override
  Future<Result<KaspiStatus>> checkKapiPayStatus({required int orderId}) async {
    return await client.execute(
      route: KioskApi.checkKapiPayStatus(orderId: orderId),
      responseType: KaspiStatus(),
    );
  }

  @override
  Future<Result<ScreenSaversResponse>> fetchScreenSavers(
      {required String deviceId}) async {
    return await client.execute(
      route: KioskApi.fetchScreenSavers(deviceId: deviceId),
      responseType: ScreenSaversResponse(),
    );
  }

  @override
  Future<Result<TechWorkResponse>> techWork() async {
    return await client.execute(
      route: const KioskApi.techWork(),
      responseType: TechWorkResponse(),
    );
  }
}
