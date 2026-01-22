import 'package:flutter/material.dart';

/// Botón principal reutilizable.
/// Lo usas en onboarding, auth, y CTAs del marketplace.
///
/// Ventaja: si cambias estilo acá, se actualiza en toda la app.
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          if (icon != null) ...[
            const SizedBox(width: 10),
            Icon(icon, size: 18),
          ],
        ],
      ),
    );
  }
}
