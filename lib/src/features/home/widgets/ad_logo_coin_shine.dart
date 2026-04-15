import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_pay_app/src/core/resources/resources.dart';

/// Логотип в углу рекламы: 3D‑оборот «монета» с паузой между оборотами.
class AdLogoCoinShine extends StatefulWidget {
  const AdLogoCoinShine({
    super.key,
    this.height = 24,

    /// Длительность одного полного оборота вокруг Y.
    this.flipDurationSeconds = 1.35,

    /// Пауза в спокойном положении между оборотами.
    this.pauseBetweenFlipsSeconds = 4.5,
  });

  final double height;
  final double flipDurationSeconds;
  final double pauseBetweenFlipsSeconds;

  @override
  State<AdLogoCoinShine> createState() => _AdLogoCoinShineState();
}

class _AdLogoCoinShineState extends State<AdLogoCoinShine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _spin;

  @override
  void initState() {
    super.initState();
    _spin = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds:
            (widget.flipDurationSeconds * 1000).round().clamp(500, 8000),
      ),
    );

    _runSpinLoop();
  }

  Future<void> _runSpinLoop() async {
    final pauseMs =
        (widget.pauseBetweenFlipsSeconds * 1000).round().clamp(400, 120000);

    while (mounted) {
      await Future<void>.delayed(Duration(milliseconds: pauseMs));
      if (!mounted) return;
      try {
        await _spin.forward(from: 0);
      } on TickerCanceled {
        return;
      } catch (_) {
        return;
      }
      if (!mounted) return;
      _spin.reset();
    }
  }

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _spin,
      builder: (context, child) {
        final eased = Curves.easeInOutCubic.transform(_spin.value);
        final spin = eased * 2 * math.pi;
        final matrix = Matrix4.identity()
          ..setEntry(3, 2, 0.00135)
          ..rotateY(spin);

        return Transform(
          alignment: Alignment.center,
          transform: matrix,
          child: SvgPicture.asset(
            AppSvgImages.qrpayLogo,
            height: widget.height,
            color: Colors.white.withValues(alpha: 0.94),
          ),
        );
      },
    );
  }
}
