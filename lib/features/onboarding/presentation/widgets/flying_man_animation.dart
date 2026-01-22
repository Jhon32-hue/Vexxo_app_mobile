import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

/// Animación del hombre volando con líneas de velocidad y nubes suaves.
/// Movimiento continuo de izquierda a derecha para expresar fluidez.
class FlyingManAnimation extends StatefulWidget {
  final double speed;

  /// [speed] controla la velocidad del loop animado.
  const FlyingManAnimation({super.key, this.speed = 1});

  @override
  State<FlyingManAnimation> createState() => _FlyingManAnimationState();
}

class _FlyingManAnimationState extends State<FlyingManAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        return CustomPaint(
          painter: _FlyingPainter(
            progress: _controller.value,
            speed: widget.speed,
          ),
          size: const Size(double.infinity, double.infinity),
        );
      },
    );
  }
}

class _FlyingPainter extends CustomPainter {
  final double progress;
  final double speed;

  _FlyingPainter({required this.progress, required this.speed});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.transparent;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    // Capas en parallax: nubes, líneas y personaje.
    _drawClouds(canvas, size);
    _drawSpeedLines(canvas, size);
    _drawFlyingMan(canvas, size);
  }

  void _drawClouds(Canvas canvas, Size size) {
    final cloudPaint = Paint()..color = Colors.white.withValues(alpha: 0.08);
    final cloudPaintSecondary =
        Paint()..color = Colors.white.withValues(alpha: 0.05);

    final cloudOffsetPrimary =
        (progress * speed * size.width * 0.25) % (size.width * 1.2);
    final cloudOffsetSecondary =
        (progress * speed * size.width * 0.4) % (size.width * 1.4);

    final cloudRects = [
      Rect.fromCenter(
        center: Offset(size.width * 0.15 - cloudOffsetPrimary, size.height * 0.2),
        width: size.width * 0.22,
        height: size.height * 0.12,
      ),
      Rect.fromCenter(
        center: Offset(size.width * 0.75 - cloudOffsetPrimary, size.height * 0.28),
        width: size.width * 0.18,
        height: size.height * 0.1,
      ),
      Rect.fromCenter(
        center:
            Offset(size.width * 0.55 - cloudOffsetSecondary, size.height * 0.65),
        width: size.width * 0.26,
        height: size.height * 0.14,
      ),
    ];

    for (final rect in cloudRects) {
      final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(60));
      canvas.drawRRect(rrect, cloudPaint);
      canvas.drawCircle(rect.center.translate(-rect.width * 0.2, 0), rect.height * 0.35,
          cloudPaintSecondary);
      canvas.drawCircle(rect.center.translate(rect.width * 0.2, 0), rect.height * 0.3,
          cloudPaintSecondary);
    }
  }

  void _drawSpeedLines(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.35)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final baseOffset = (progress * speed * size.width) % (size.width * 1.4);
    for (int i = 0; i < 6; i++) {
      final y = size.height * (0.25 + i * 0.08);
      final lineLength = size.width * (0.12 + (i % 3) * 0.05);
      final startX = size.width * 0.1 + i * 40 - baseOffset;
      canvas.drawLine(
        Offset(startX, y),
        Offset(startX + lineLength, y),
        linePaint,
      );
    }
  }

  void _drawFlyingMan(Canvas canvas, Size size) {
    final manProgress = (progress * speed) % 1;
    final x = lerpDouble(-size.width * 0.2, size.width * 1.1, manProgress) ??
        size.width * 0.5;
    final y = size.height * 0.45 + sin(manProgress * 2 * pi) * 12;

    final bodyPaint = Paint()..color = NevyColors.brandPrimary;
    final suitPaint = Paint()..color = Colors.white.withValues(alpha: 0.9);
    final accentPaint = Paint()..color = NevyColors.brandSecondary;

    final head = Offset(x, y - size.height * 0.05);
    canvas.drawCircle(head, size.height * 0.03, bodyPaint);

    final bodyRect = Rect.fromCenter(
      center: Offset(x, y),
      width: size.width * 0.12,
      height: size.height * 0.06,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(bodyRect, const Radius.circular(24)),
      suitPaint,
    );

    final armPath = Path()
      ..moveTo(bodyRect.left + 6, y - size.height * 0.015)
      ..lineTo(bodyRect.left - size.width * 0.05, y - size.height * 0.02)
      ..lineTo(bodyRect.left + 6, y);
    canvas.drawPath(armPath, accentPaint);

    final legPath = Path()
      ..moveTo(bodyRect.right - 6, y + size.height * 0.015)
      ..lineTo(bodyRect.right + size.width * 0.06, y + size.height * 0.02)
      ..lineTo(bodyRect.right - 6, y + size.height * 0.03);
    canvas.drawPath(legPath, accentPaint);

    final trailPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.4)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 3; i++) {
      final trailX = x - size.width * (0.1 + i * 0.08);
      final trailY = y + size.height * (0.01 * i);
      canvas.drawLine(
        Offset(trailX, trailY),
        Offset(trailX - size.width * 0.08, trailY),
        trailPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FlyingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.speed != speed;
}
