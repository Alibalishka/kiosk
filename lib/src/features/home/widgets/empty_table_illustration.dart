import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:qr_pay_app/src/core/resources/app_colors.dart';

/// Пустой стол: сервированная тарелка ждёт заказ, над ней парит чек.
///
/// Рисуется кодом, а не картинкой: чёткая на любом планшете и в цветах
/// приложения. Чек плавно покачивается, искры мерцают — экран не выглядит
/// зависшим, пока гость ничего не заказал.
class EmptyTableIllustration extends StatefulWidget {
  const EmptyTableIllustration({super.key, this.width = 320});

  final double width;

  @override
  State<EmptyTableIllustration> createState() => _EmptyTableIllustrationState();
}

class _EmptyTableIllustrationState extends State<EmptyTableIllustration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _loop = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat();

  @override
  void dispose() {
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: widget.width,
        height: widget.width *
            _EmptyTablePainter.canvas.height /
            _EmptyTablePainter.canvas.width,
        child: CustomPaint(painter: _EmptyTablePainter(_loop)),
      ),
    );
  }
}

class _EmptyTablePainter extends CustomPainter {
  _EmptyTablePainter(this.loop) : super(repaint: loop);

  /// Рисуем в этих координатах и масштабируем под размер виджета.
  static const Size canvas = Size(320, 260);

  static const Color _cream = Color(0xFFFFEFD9);
  static const Color _white = AppColors.primitiveNeutralcold0;
  static const Color _line = AppColors.primitiveNeutralcold100;
  static const Color _metal = AppColors.primitiveNeutralcold200;
  static const Color _metalDark = AppColors.primitiveNeutralcold300;
  static const Color _accent = AppColors.primitiveOrange500;
  static const Color _accentSoft = AppColors.primitiveOrange300;

  static const Offset _plate = Offset(160, 152);

  final Animation<double> loop;

  @override
  void paint(Canvas canvas, Size size) {
    final phase = loop.value * 2 * math.pi;
    canvas
      ..save()
      ..scale(size.width / _EmptyTablePainter.canvas.width);

    _backdrop(canvas);
    _plateWithShadow(canvas);
    _fork(canvas, 62);
    _knife(canvas, 258);
    _receipt(canvas, lift: (math.sin(phase) + 1) / 2);
    _sparkle(canvas, const Offset(78, 56), 10, _accent, phase);
    _sparkle(canvas, const Offset(292, 120), 7, _accentSoft, phase + 2.1);
    _sparkle(canvas, const Offset(112, 240), 5, _accentSoft, phase + 4.2);

    canvas.restore();
  }

  void _backdrop(Canvas canvas) {
    canvas
      ..drawCircle(const Offset(160, 140), 116, Paint()..color = _cream)
      ..drawCircle(
        const Offset(286, 186),
        12,
        Paint()..color = _cream,
      )
      ..drawCircle(
        const Offset(38, 176),
        8,
        Paint()..color = _cream,
      );
  }

  void _plateWithShadow(Canvas canvas) {
    canvas
      ..drawCircle(
        _plate.translate(0, 8),
        78,
        Paint()
          ..color = Colors.black.withValues(alpha: 0.08)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
      )
      ..drawCircle(_plate, 78, Paint()..color = _white)
      ..drawCircle(
        _plate,
        78,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = _line,
      )
      ..drawCircle(
        _plate,
        56,
        Paint()
          ..shader = const RadialGradient(
            center: Alignment(-0.35, -0.45),
            radius: 1,
            colors: [_white, AppColors.primitiveNeutralcold50],
          ).createShader(Rect.fromCircle(center: _plate, radius: 56)),
      )
      ..drawCircle(
        _plate,
        56,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = _line,
      )
      // Блик по краю углубления.
      ..drawArc(
        Rect.fromCircle(center: _plate, radius: 46),
        math.pi * 1.1,
        math.pi * 0.32,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..color = _white,
      );
  }

  void _fork(Canvas canvas, double x) {
    final paint = Paint()..color = _metal;
    for (final dx in [-7.5, -2.5, 2.5, 7.5]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset(x + dx, 120), width: 3.2, height: 30),
          const Radius.circular(1.6),
        ),
        paint,
      );
    }
    final neck = Path()
      ..moveTo(x - 10, 132)
      ..lineTo(x + 10, 132)
      ..quadraticBezierTo(x + 10, 148, x + 4, 154)
      ..lineTo(x - 4, 154)
      ..quadraticBezierTo(x - 10, 148, x - 10, 132)
      ..close();
    canvas
      ..drawPath(neck, paint)
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x - 5, 150, x + 5, 236),
          const Radius.circular(5),
        ),
        paint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x - 1.5, 184, x + 1.5, 224),
          const Radius.circular(1.5),
        ),
        Paint()..color = _metalDark,
      );
  }

  void _knife(Canvas canvas, double x) {
    final blade = Path()
      ..moveTo(x - 6, 162)
      ..lineTo(x - 6, 112)
      ..quadraticBezierTo(x - 6, 104, x, 104)
      ..quadraticBezierTo(x + 8, 108, x + 8, 132)
      ..lineTo(x + 8, 162)
      ..close();
    canvas
      ..drawPath(blade, Paint()..color = _metal)
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x - 6, 158, x + 8, 164),
          const Radius.circular(2),
        ),
        Paint()..color = _metalDark,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x - 5, 164, x + 7, 236),
          const Radius.circular(6),
        ),
        Paint()..color = _metal,
      );
  }

  /// Чек над столом. [lift] 0…1 — насколько он поднялся: тень под ним
  /// тем меньше и прозрачнее, чем он выше.
  void _receipt(Canvas canvas, {required double lift}) {
    const center = Offset(236, 52);
    const width = 66.0;
    const height = 80.0;
    final rise = -6 * lift;

    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(240, 108),
        width: 44 - 10 * lift,
        height: 7 - 2 * lift,
      ),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.07 - 0.03 * lift)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );

    canvas
      ..save()
      ..translate(center.dx, center.dy + rise)
      ..rotate(8 * math.pi / 180);

    const left = -width / 2;
    const top = -height / 2;
    const bottom = height / 2;
    const teeth = 5;
    const tooth = width / teeth;
    final paper = Path()
      ..moveTo(left, top + 8)
      ..quadraticBezierTo(left, top, left + 8, top)
      ..lineTo(-left - 8, top)
      ..quadraticBezierTo(-left, top, -left, top + 8)
      ..lineTo(-left, bottom);
    for (var i = teeth; i > 0; i--) {
      final x = left + i * tooth;
      paper
        ..lineTo(x - tooth / 2, bottom - 5)
        ..lineTo(x - tooth, bottom);
    }
    paper.close();

    canvas
      ..drawShadow(paper, Colors.black, 4, false)
      ..drawPath(paper, Paint()..color = _white)
      ..drawPath(
        paper,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..strokeJoin = StrokeJoin.round
          ..color = _line,
      );

    void bar(double x, double y, double w, Color color, {double h = 6}) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, w, h),
          Radius.circular(h / 2),
        ),
        Paint()..color = color,
      );
    }

    bar(left + 10, top + 11, 26, _accent, h: 7);
    bar(left + 10, top + 26, 46, _line, h: 5);
    bar(left + 10, top + 36, 34, _line, h: 5);
    bar(left + 10, top + 46, 40, _line, h: 5);
    bar(-left - 10 - 18, top + 60, 18, _metalDark, h: 5);

    canvas.restore();
  }

  /// Четырёхлучевая искра; [phase] сдвигает мерцание, чтобы искры не
  /// вспыхивали разом.
  void _sparkle(
    Canvas canvas,
    Offset at,
    double radius,
    Color color,
    double phase,
  ) {
    final glow = 0.35 + 0.65 * (math.sin(phase) + 1) / 2;
    final r = radius * (0.85 + 0.15 * glow);
    final path = Path()
      ..moveTo(at.dx, at.dy - r)
      ..quadraticBezierTo(at.dx, at.dy, at.dx + r, at.dy)
      ..quadraticBezierTo(at.dx, at.dy, at.dx, at.dy + r)
      ..quadraticBezierTo(at.dx, at.dy, at.dx - r, at.dy)
      ..quadraticBezierTo(at.dx, at.dy, at.dx, at.dy - r)
      ..close();
    canvas.drawPath(path, Paint()..color = color.withValues(alpha: glow));
  }

  @override
  bool shouldRepaint(_EmptyTablePainter oldDelegate) =>
      oldDelegate.loop != loop;
}
