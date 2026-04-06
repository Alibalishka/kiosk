import 'dart:async';

import 'package:battery_plus/battery_plus.dart';

/// Предупреждение при низком заряде (&lt; [lowThresholdPercent]), только когда устройство
/// **не** получает внешнее питание (см. [BatteryState] в battery_plus).
///
/// Учтённые сценарии:
/// - [BatteryState.charging] — идёт зарядка → не показываем.
/// - [BatteryState.full] — полный заряд (часто на кабеле) → не показываем.
/// - [BatteryState.connectedNotCharging] — кабель/док, но батарея не заряжается (лимит %,
///   слабый БП и т.д.) → **не показываем** — пользователь уже «на проводе».
/// - [BatteryState.discharging] — работа от батареи → при % ниже порога показываем.
/// - [BatteryState.unknown] — прошивка не отдала состояние: делаем повторное чтение
///   через короткую задержку; если стало ясно (charging и т.д.) — не показываем.
/// - `batteryLevel &lt; 0` — уровень неизвестен (редко desktop/emulator): не показываем,
///   один раз перечитываем после задержки.
/// - Уровень &gt; 100 — приводим к 100.
class BatteryStatusService {
  BatteryStatusService({this.lowThresholdPercent = 10});

  final int lowThresholdPercent;
  final Battery _battery = Battery();

  final _controller = StreamController<bool>.broadcast();
  Stream<bool> get stream => _controller.stream;

  bool _showLow = false;
  int _lastLevel = 100;
  bool _inited = false;

  bool get showLowBatteryWarning => _showLow;
  int get lastBatteryLevel => _lastLevel;

  Future<void> init() async {
    if (_inited) return;
    _inited = true;
    await _emitIfChanged();
    _battery.onBatteryStateChanged.listen((_) => _emitIfChanged());
    Timer.periodic(const Duration(seconds: 30), (_) => _emitIfChanged());
  }

  /// Публично можно вызвать при возврате приложения с фона (например из оверлея).
  Future<void> refresh() => _emitIfChanged();

  Future<void> _emitIfChanged() async {
    try {
      var level = await _battery.batteryLevel;
      var state = await _battery.batteryState;

      // Уровень неизвестен — типично desktop / первый кадр; один повтор.
      if (level < 0) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
        level = await _battery.batteryLevel;
        state = await _battery.batteryState;
      }

      if (level >= 0) {
        _lastLevel = level.clamp(0, 100);
      }

      // «unknown» при низком % часто сменяется на charging после задержки (OEM).
      if (state == BatteryState.unknown &&
          level >= 0 &&
          level < lowThresholdPercent) {
        await Future<void>.delayed(const Duration(milliseconds: 350));
        final state2 = await _battery.batteryState;
        final level2 = await _battery.batteryLevel;
        if (state2 != BatteryState.unknown) {
          state = state2;
        }
        if (level2 >= 0) {
          level = level2;
          _lastLevel = level2.clamp(0, 100);
        }
      }

      final show = _computeShow(level, state);
      if (show != _showLow) {
        _showLow = show;
        _controller.add(show);
      }
    } catch (_) {
      if (_showLow) {
        _showLow = false;
        _controller.add(false);
      }
    }
  }

  bool _computeShow(int level, BatteryState state) {
    if (level < 0) return false;
    final pct = level.clamp(0, 100);
    if (pct >= lowThresholdPercent) return false;
    if (_isPluggedIn(state)) return false;
    return true;
  }

  /// Внешнее питание или полный заряд — предупреждение не нужно.
  bool _isPluggedIn(BatteryState state) {
    switch (state) {
      case BatteryState.charging:
      case BatteryState.full:
      case BatteryState.connectedNotCharging:
        return true;
      case BatteryState.discharging:
        return false;
      case BatteryState.unknown:
        // После стабилизации в [_emitIfChanged] всё ещё unknown — считаем «не на кабеле».
        return false;
    }
  }
}
