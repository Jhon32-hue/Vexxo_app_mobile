import 'package:flutter/material.dart';

/// Paleta oficial de Nevy.
/// - Predominante: Amarillo pastel intenso (calma premium).
/// - Secundario: Verde menta suave (CTA humano).
/// - Oscuro premium: fondo profundo.
/// - Neutros: para textos y superficies.
class NevyColors {
  // Brand
  static const Color brandPrimary = Color(0xFFF6C453); // Amarillo pastel intenso
  static const Color brandSecondary = Color(0xFFB7E4C7); // Verde menta suave

  // Neutrals
  static const Color background = Color(0xFF0B1220); // Fondo oscuro premium
  static const Color surface = Color(0xFF141B2D); // Cards / paneles oscuros
  static const Color textPrimary = Color(0xFFFFFFFF); // Texto principal
  static const Color textSecondary = Color(0xFFC7CCD6); // Texto secundario

  // UI helpers
  static const Color border = Color(0xFF2A3246);
  static const Color success = Color(0xFFB7E4C7);
  static const Color warning = Color(0xFFF6C453);

  /// Gradiente suave (premium) para headers y fondos del onboarding.
  /// Mantiene calma sin usar azul bancario clásico.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0B1220), // Oscuro premium
      Color(0xFF151C2E), // Oscuro suave
      Color(0xFF0B1220), // Loop visual
    ],
  );
}
