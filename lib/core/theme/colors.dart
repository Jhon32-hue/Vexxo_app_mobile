import 'package:flutter/material.dart';

/// Paleta oficial de Nevy.
/// - Predominante: Verdes bosque para sensación natural/premium.
/// - Acentos: Naranja vibrante y amarillo ocre para CTAs y promociones.
/// - Azul petróleo: soporte en secciones secundarias y gradientes.
/// - Negro profundo: fondo premium.
class NevyColors {
  // Brand
  static const Color brandPrimary = Color(0xFF4D8133); // Verde bosque
  static const Color brandSecondary = Color(0xFFF6B100); // Amarillo ocre (CTA)
  static const Color brandAccent = Color(0xFFF36906); // Naranja vibrante (promo)
  static const Color brandSupport = Color(0xFF085B5E); // Azul petróleo

  // Neutrals
  static const Color background = Color(0xFF091619); // Fondo oscuro premium
  static const Color surface = Color(0xFF0F2F33); // Cards / paneles oscuros
  static const Color textPrimary = Color(0xFFFFFFFF); // Texto principal
  static const Color textSecondary = Color(0xFFCBD6CF); // Texto secundario

  // UI helpers
  static const Color border = Color(0xFF1B3D3F);
  static const Color success = Color(0xFF4D8133);
  static const Color warning = Color(0xFFF6B100);
  static const Color alert = Color(0xFFF36906);

  /// Gradiente suave (premium) para headers y fondos del onboarding.
  /// Mantiene calma sin usar azul bancario clásico.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF091619), // Negro profundo
      Color(0xFF085B5E), // Azul petróleo
      Color(0xFF4D8133), // Verde bosque
    ],
  );
}
