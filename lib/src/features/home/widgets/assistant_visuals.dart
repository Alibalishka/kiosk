import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sizer/sizer.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';
import 'package:qr_pay_app/src/core/resources/app_text_style.dart';

/// Цвета помощника. Меню монохромное, поэтому помощник нарочно цветной:
/// его сразу видно и он ощущается отдельным «режимом».
abstract final class AssistantPalette {
  static const Color violet = AppColors.primitivePurple500;
  static const Color blue = AppColors.primitiveBlue500;
  static const Color coral = AppColors.primitiveRed400;
  static const Color amber = AppColors.primitiveOrange500;

  static const List<Color> spectrum = [violet, blue, coral, amber, violet];

  /// Фон экрана помощника: тёмный, с фиолетовым светом сверху.
  static const Color backgroundTop = Color(0xFF2A1748);
  static const Color background = Color(0xFF0B0A10);

  static const Color text = AppColors.primitiveNeutralcold0;
  static Color get textSoft => text.withValues(alpha: 0.7);
  static Color get surface => text.withValues(alpha: 0.08);
  static Color get outline => text.withValues(alpha: 0.16);
}

/// Часы анимации со «скоростью»: [energy] плавно догоняет цель, поэтому
/// сфера не дёргается, когда помощник начинает «думать» и затихает.
class _EnergyClock extends ChangeNotifier {
  _EnergyClock(TickerProvider vsync, double energy)
      : _energy = energy,
        target = energy {
    _ticker = vsync.createTicker(_tick)..start();
  }

  late final Ticker _ticker;
  Duration _last = Duration.zero;

  /// Накопленная фаза, радианы.
  double phase = 0;

  double _energy;
  double get energy => _energy;

  /// 0 — покой, 1 — помощник «думает».
  double target;

  void _tick(Duration elapsed) {
    final dt =
        (elapsed - _last).inMicroseconds / Duration.microsecondsPerSecond;
    _last = elapsed;
    _energy += (target - _energy) * math.min(1, dt * 3);
    phase += dt * (0.7 + _energy * 3.3);
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}

/// Живая сфера помощника: переливающиеся цветные пятна внутри шара.
class AssistantOrb extends StatefulWidget {
  const AssistantOrb({super.key, required this.size, this.energy = 0.2});

  final double size;

  /// 0..1: чем выше, тем быстрее перелив и сильнее «дыхание».
  final double energy;

  @override
  State<AssistantOrb> createState() => _AssistantOrbState();
}

class _AssistantOrbState extends State<AssistantOrb>
    with SingleTickerProviderStateMixin {
  late final _EnergyClock _clock = _EnergyClock(this, widget.energy);

  @override
  void didUpdateWidget(covariant AssistantOrb oldWidget) {
    super.didUpdateWidget(oldWidget);
    _clock.target = widget.energy;
  }

  @override
  void dispose() {
    _clock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: Size.square(widget.size),
        painter: _OrbPainter(_clock),
      ),
    );
  }
}

class _OrbPainter extends CustomPainter {
  _OrbPainter(this.clock) : super(repaint: clock);

  final _EnergyClock clock;

  static const _blobs = [
    AssistantPalette.violet,
    AssistantPalette.blue,
    AssistantPalette.coral,
    AssistantPalette.amber,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final t = clock.phase;
    final energy = clock.energy;
    final center = size.center(Offset.zero);
    // «Дыхание»: в покое еле заметно, когда думает — отчётливо.
    final radius =
        size.shortestSide / 2 * (0.94 + 0.06 * energy * math.sin(t * 2.2));

    // Мягкое свечение вокруг шара.
    canvas.drawCircle(
      center,
      radius * 1.05,
      Paint()
        ..color = Color.lerp(
          AssistantPalette.violet,
          AssistantPalette.blue,
          (math.sin(t) + 1) / 2,
        )!
            .withValues(alpha: 0.35 + 0.35 * energy)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, radius * 0.35),
    );

    final ball = Rect.fromCircle(center: center, radius: radius);
    canvas.save();
    canvas.clipPath(Path()..addOval(ball));
    canvas.drawRect(ball, Paint()..color = const Color(0xFF160C2A));

    for (var i = 0; i < _blobs.length; i++) {
      final angle = t * (0.8 + i * 0.27) + i * math.pi / 2;
      final offset = Offset(
            math.cos(angle),
            math.sin(angle * 1.3 + i),
          ) *
          radius *
          0.5;
      final blobCenter = center + offset;
      final blobRadius = radius * (0.9 + 0.15 * math.sin(t * 1.7 + i));
      canvas.drawCircle(
        blobCenter,
        blobRadius,
        Paint()
          ..blendMode = BlendMode.screen
          ..shader = RadialGradient(
            colors: [_blobs[i], _blobs[i].withValues(alpha: 0)],
          ).createShader(
            Rect.fromCircle(center: blobCenter, radius: blobRadius),
          ),
      );
    }

    // Блик сверху слева — шар, а не плоский круг.
    final highlight = center + Offset(-radius * 0.32, -radius * 0.38);
    canvas.drawCircle(
      highlight,
      radius * 0.55,
      Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.white.withValues(alpha: 0.55),
            Colors.white.withValues(alpha: 0),
          ],
        ).createShader(
          Rect.fromCircle(center: highlight, radius: radius * 0.55),
        ),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _OrbPainter oldDelegate) =>
      oldDelegate.clock != clock;
}

/// Мягкое цветное свечение, бегущее по краю прямоугольника со
/// скруглением: по краям экрана помощника, вокруг кнопок и барабана.
///
/// Только размытый ореол под ребёнком, без чёткой линии по краю: линия
/// читалась как жёсткая рамка.
class AssistantGlowBorder extends StatefulWidget {
  const AssistantGlowBorder({
    super.key,
    this.energy = 0.4,
    this.radius = 28,
    this.glowWidth = 26,
    this.glowOpacity = 1,
    this.child,
  });

  final double energy;
  final double radius;

  /// Ширина размытого ореола: чем больше, тем дальше он расходится.
  final double glowWidth;

  /// Прозрачность ореола: по краям экрана он должен быть едва заметной
  /// дымкой, а не яркой рамкой.
  final double glowOpacity;
  final Widget? child;

  @override
  State<AssistantGlowBorder> createState() => _AssistantGlowBorderState();
}

class _AssistantGlowBorderState extends State<AssistantGlowBorder>
    with SingleTickerProviderStateMixin {
  late final _EnergyClock _clock = _EnergyClock(this, widget.energy);

  @override
  void didUpdateWidget(covariant AssistantGlowBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    _clock.target = widget.energy;
  }

  @override
  void dispose() {
    _clock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ореол — под ребёнком, чтобы не подкрашивать содержимое.
    return CustomPaint(
      painter: _GlowBorderPainter(
        clock: _clock,
        radius: widget.radius,
        width: widget.glowWidth,
        opacity: widget.glowOpacity,
      ),
      child: widget.child ?? const SizedBox.expand(),
    );
  }
}

class _GlowBorderPainter extends CustomPainter {
  _GlowBorderPainter({
    required this.clock,
    required this.radius,
    required this.width,
    required this.opacity,
  }) : super(repaint: clock);

  final _EnergyClock clock;
  final double radius;
  final double width;
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    if (width <= 0) return;
    final rect = Offset.zero & size;
    final energy = clock.energy;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      Paint()
        // Альфа цвета кисти приглушает и шейдер.
        ..color = Color.fromRGBO(0, 0, 0, opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width * (0.6 + 0.4 * energy)
        ..maskFilter =
            MaskFilter.blur(BlurStyle.normal, width * (0.5 + 0.5 * energy))
        ..shader = SweepGradient(
          colors: AssistantPalette.spectrum,
          transform: GradientRotation(clock.phase),
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant _GlowBorderPainter oldDelegate) =>
      oldDelegate.clock != clock ||
      oldDelegate.radius != radius ||
      oldDelegate.width != width ||
      oldDelegate.opacity != opacity;
}

/// Плавающая кнопка запуска помощника поверх меню.
class AssistantLauncher extends StatefulWidget {
  const AssistantLauncher({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<AssistantLauncher> createState() => _AssistantLauncherState();
}

class _AssistantLauncherState extends State<AssistantLauncher> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.94 : 1,
        duration: const Duration(milliseconds: 120),
        child: RepaintBoundary(
          child: AssistantGlowBorder(
            radius: 40,
            glowWidth: 26,
            glowOpacity: 0.8,
            energy: 0.15,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AssistantPalette.background,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 28, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AssistantOrb(size: 56),
                    const SizedBox(width: 14),
                    Flexible(
                      child: Text(
                        widget.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyLStrong.copyWith(
                          fontSize: 15.sp,
                          color: AssistantPalette.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
