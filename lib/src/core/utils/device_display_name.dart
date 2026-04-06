import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

const MethodChannel _dpcDeviceName = MethodChannel('dpc');

/// То же имя, что «Имя устройства» в настройках Android ([Settings.Global.DEVICE_NAME]),
/// иначе сборка из [androidDeviceDisplayName] (производитель + модель и т.д.).
Future<String> androidDeviceDisplayNameResolved(AndroidDeviceInfo i) async {
  if (Platform.isAndroid) {
    try {
      final dynamic raw = await _dpcDeviceName.invokeMethod('getDeviceDisplayName');
      if (raw is String && raw.trim().isNotEmpty) {
        return raw.trim();
      }
    } catch (_) {}
  }
  return androidDeviceDisplayName(i);
}

/// Человекочитаемое имя Android (запасной вариант без системного имени): производитель + модель.
String androidDeviceDisplayName(AndroidDeviceInfo i) {
  final manufacturer = i.manufacturer.trim();
  final brand = i.brand.trim();
  final modelName = i.model.trim();
  final product = i.product.trim();
  final device = i.device.trim();

  final lead = manufacturer.isNotEmpty
      ? manufacturer
      : (brand.isNotEmpty ? brand : '');

  if (lead.isNotEmpty && modelName.isNotEmpty) {
    return '$lead $modelName';
  }
  if (modelName.isNotEmpty) return modelName;
  if (product.isNotEmpty) return product;
  if (device.isNotEmpty) return device;
  return 'unknown';
}

/// Имя в настройках + идентификатор модели (utsname.machine).
String iosDeviceDisplayName(IosDeviceInfo i) {
  final human = i.name.trim();
  final machine = i.utsname.machine.trim();
  if (human.isNotEmpty && machine.isNotEmpty) {
    return '$human ($machine)';
  }
  return human.isNotEmpty ? human : machine;
}
