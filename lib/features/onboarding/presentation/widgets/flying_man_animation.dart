import 'package:flutter/material.dart';

/// Animación inspirada en tu loader HTML/CSS
/// Simula velocidad, líneas y movimiento continuo
class FlyingManAnimation extends StatefulWidget {
  const FlyingManAnimation({super.key});

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
      duration: const Duration(milliseconds: 700),
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
          painter: _FlyingPainter(progress: _controller.value),
          size: const Size(double.infinity, double.infinity),
        );
      },
    );
  }
}

class _FlyingPainter extends CustomPainter {
  final double progress;
  _FlyingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.6)
      ..strokeWidth = 2;

    for (int i = 0; i < 10; i++) {
      final y = size.height * (i / 10);
      final x = size.width - (progress * size.width * 2);
      canvas.drawLine(
        Offset(x + i * 80, y),
        Offset(x + i * 80 + 120, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FlyingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
