import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

/// Loader circular tipo SVG para la marca Nevy.
/// - Trazo circular con dash animado.
/// - Rotación suave e infinita.
class NevyLogoLoader extends StatefulWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const NevyLogoLoader({
    super.key,
    this.size = 52,
    this.strokeWidth = 4,
    this.color,
  });

  @override
  State<NevyLogoLoader> createState() => _NevyLogoLoaderState();
}

class _NevyLogoLoaderState extends State<NevyLogoLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
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
      builder: (_, __) {
        final rotation = _controller.value * 2 * pi;
        return Transform.rotate(
          angle: rotation,
          child: CustomPaint(
            size: Size.square(widget.size),
            painter: _LogoLoaderPainter(
              progress: _controller.value,
              strokeWidth: widget.strokeWidth,
              color: widget.color ?? NevyColors.brandPrimary,
            ),
          ),
        );
      },
    );
  }
}

/// Painter del loader con animación de dash.
class _LogoLoaderPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;

  _LogoLoaderPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = Offset.zero & size;
    final normalized = progress <= 0.5 ? progress * 2 : (1 - progress) * 2;
    final sweep = lerpDouble(pi * 0.3, pi * 1.4, normalized) ?? pi;
    final startAngle = -pi / 2 + progress * 2 * pi;

    canvas.drawArc(rect.deflate(strokeWidth * 0.5), startAngle, sweep, false, paint);
  }

  @override
  bool shouldRepaint(covariant _LogoLoaderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }
}
