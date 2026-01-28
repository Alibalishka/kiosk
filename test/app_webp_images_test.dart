import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

void main() {
  test('app_webp_images assets test', () {
    expect(File(AppWebpImages.airplane).existsSync(), isTrue);
    expect(File(AppWebpImages.backgroundSquare).existsSync(), isTrue);
    expect(File(AppWebpImages.backgroundSquare2).existsSync(), isTrue);
    expect(File(AppWebpImages.backgroundSquareCancel2).existsSync(), isTrue);
    expect(File(AppWebpImages.backgroundSquareCheck).existsSync(), isTrue);
    expect(File(AppWebpImages.backgroundSquareCheck2).existsSync(), isTrue);
    expect(File(AppWebpImages.backgroundSquarePhone).existsSync(), isTrue);
    expect(File(AppWebpImages.buySubscription).existsSync(), isTrue);
    expect(File(AppWebpImages.calendar).existsSync(), isTrue);
    expect(File(AppWebpImages.cancelSubscription).existsSync(), isTrue);
    expect(File(AppWebpImages.cardsLittle).existsSync(), isTrue);
    expect(File(AppWebpImages.chayla).existsSync(), isTrue);
    expect(File(AppWebpImages.close).existsSync(), isTrue);
    expect(File(AppWebpImages.coffee).existsSync(), isTrue);
    expect(File(AppWebpImages.coffeeLittle).existsSync(), isTrue);
    expect(File(AppWebpImages.coffeecup).existsSync(), isTrue);
    expect(File(AppWebpImages.delete2).existsSync(), isTrue);
    expect(File(AppWebpImages.delete3).existsSync(), isTrue);
    expect(File(AppWebpImages.delete4).existsSync(), isTrue);
    expect(File(AppWebpImages.delete5).existsSync(), isTrue);
    expect(File(AppWebpImages.emptyBell).existsSync(), isTrue);
    expect(File(AppWebpImages.error).existsSync(), isTrue);
    expect(File(AppWebpImages.flowInterruption).existsSync(), isTrue);
    expect(File(AppWebpImages.handshake).existsSync(), isTrue);
    expect(File(AppWebpImages.kaspiLogo).existsSync(), isTrue);
    expect(File(AppWebpImages.locationFill).existsSync(), isTrue);
    expect(File(AppWebpImages.logoApple).existsSync(), isTrue);
    expect(File(AppWebpImages.logo).existsSync(), isTrue);
    expect(File(AppWebpImages.logoGooglePay).existsSync(), isTrue);
    expect(File(AppWebpImages.logoMastercard).existsSync(), isTrue);
    expect(File(AppWebpImages.logoVisa).existsSync(), isTrue);
    expect(File(AppWebpImages.modalClock).existsSync(), isTrue);
    expect(File(AppWebpImages.money).existsSync(), isTrue);
    expect(File(AppWebpImages.noBonuses).existsSync(), isTrue);
    expect(File(AppWebpImages.noOrder).existsSync(), isTrue);
    expect(File(AppWebpImages.noOrders).existsSync(), isTrue);
    expect(File(AppWebpImages.noConnection).existsSync(), isTrue);
    expect(File(AppWebpImages.notFound).existsSync(), isTrue);
    expect(File(AppWebpImages.notFoundImage).existsSync(), isTrue);
    expect(File(AppWebpImages.ornament).existsSync(), isTrue);
    expect(File(AppWebpImages.placeholderMenu).existsSync(), isTrue);
    expect(File(AppWebpImages.present).existsSync(), isTrue);
    expect(File(AppWebpImages.programRules).existsSync(), isTrue);
    expect(File(AppWebpImages.qrCodeNotFound).existsSync(), isTrue);
    expect(File(AppWebpImages.reserve).existsSync(), isTrue);
    expect(File(AppWebpImages.sandyqGroup).existsSync(), isTrue);
    expect(File(AppWebpImages.subscriptionCanceled).existsSync(), isTrue);
    expect(File(AppWebpImages.subscriptionLogo).existsSync(), isTrue);
    expect(File(AppWebpImages.wallet).existsSync(), isTrue);
  });
}
