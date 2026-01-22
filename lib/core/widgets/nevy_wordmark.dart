import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// Logo mínimo tipo "wordmark".
/// Como todavía no hay ícono, mantenemos marca limpia.
/// Luego puedes reemplazarlo por SVG o ícono sin romper el resto.
class NevyLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const NevyLogo({super.key, this.size = 40, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Nevy',
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w800,
        letterSpacing: -1.2,
        color: color ?? NevyColors.brandPrimary,
      ),
    );
  }
}
