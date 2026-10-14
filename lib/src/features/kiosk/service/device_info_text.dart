import 'dart:io' show Platform;

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_pay_app/src/core/utils/device_display_name.dart';
import 'package:qr_pay_app/src/features/kiosk/service/device_id_service.dart';

const MethodChannel _dpc = MethodChannel('dpc');

/// Блок «--- Device ---» для админ-диалогов: что за планшет и в каком он
/// состоянии. Что не удалось прочитать, выводится как «-».
///
/// [appVersion] — если не передан, берётся из пакета вместе с номером
/// сборки: по нему видно, дошло ли до планшета OTA.
Future<String> deviceInfoText({
  required String locale,
  String? appVersion,
}) async {
  var displayName = '';
  var deviceModel = '';
  var osVersion = '';

  try {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final info = await deviceInfo.androidInfo;
      displayName = await androidDeviceDisplayNameResolved(info);
      deviceModel = androidBuildPropModel(info);
      osVersion = 'Android ${info.version.release} (SDK ${info.version.sdkInt})';
    } else if (Platform.isIOS) {
      final info = await deviceInfo.iosInfo;
      displayName = iosDeviceDisplayName(info);
      deviceModel = info.utsname.machine;
      osVersion = '${info.systemName} ${info.systemVersion}';
    }
  } catch (_) {}

  final platform = Platform.isAndroid
      ? 'Android'
      : Platform.isIOS
          ? 'iOS'
          : 'Unknown';

  final deviceId = await const DeviceIdService().getOrCreate();
  final version = appVersion ?? await _packageVersion();
  final metrics = await _deviceMetrics();

  return (StringBuffer()
        ..writeln('--- Device ---')
        ..writeln('Platform: $platform')
        ..writeln('OS: ${_orDash(osVersion)}')
        ..writeln('Device ID: $deviceId')
        ..writeln('Name: ${_orDash(displayName)}')
        ..writeln('Model: ${_orDash(deviceModel)}')
        ..writeln('App version: ${_orDash(version)}')
        ..writeln('Locale: $locale')
        ..writeln('Battery: ${await _battery()}')
        ..writeln('Battery temp: ${_temperature(metrics)}')
        ..writeln('RAM: ${_ram(metrics)}')
        ..write('Uptime: ${_uptime(metrics)}'))
      .toString();
}

String _orDash(String? value) {
  final v = value?.trim() ?? '';
  return v.isEmpty ? '-' : v;
}

Future<String> _packageVersion() async {
  try {
    final info = await PackageInfo.fromPlatform();
    return '${info.version} (${info.buildNumber})';
  } catch (_) {
    return '';
  }
}

Future<String> _battery() async {
  final battery = Battery();
  String? level;
  String? state;
  try {
    level = '${await battery.batteryLevel}%';
  } catch (_) {}
  try {
    state = switch (await battery.batteryState) {
      BatteryState.charging => 'charging',
      BatteryState.full => 'full',
      BatteryState.discharging => 'discharging',
      BatteryState.connectedNotCharging => 'connected, not charging',
      BatteryState.unknown => null,
    };
  } catch (_) {}
  return _orDash([level, state].whereType<String>().join(', '));
}

/// Температура, память и аптайм из нативной части (только Android).
Future<Map<dynamic, dynamic>> _deviceMetrics() async {
  if (!Platform.isAndroid) return const {};
  try {
    final data = await _dpc.invokeMethod<dynamic>('getDeviceMetrics');
    if (data is Map) return data;
  } catch (_) {}
  return const {};
}

String _temperature(Map<dynamic, dynamic> metrics) {
  final value = metrics['temperature_c'];
  return value is num ? '${value.toStringAsFixed(1)} °C' : '-';
}

String _ram(Map<dynamic, dynamic> metrics) {
  final used = metrics['ram_used_mb'];
  final total = metrics['ram_total_mb'];
  if (used is! num || total is! num) return '-';
  return '$used / $total MB';
}

String _uptime(Map<dynamic, dynamic> metrics) {
  final seconds = metrics['uptime_sec'];
  if (seconds is! num) return '-';
  final uptime = Duration(seconds: seconds.toInt());
  final days = uptime.inDays;
  final hours = uptime.inHours % 24;
  final minutes = uptime.inMinutes % 60;
  return days > 0 ? '${days}d ${hours}h ${minutes}m' : '${hours}h ${minutes}m';
}
