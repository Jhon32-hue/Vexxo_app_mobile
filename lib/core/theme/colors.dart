import 'package:flutter/material.dart';

/// Paleta oficial de Nevy.
/// - Predominante: Azul océano profundo (confianza, calma, claridad).
/// - Secundario: Coral suave (acción, llamados a la acción).
/// - Neutros: para fondo y textos.
class NevyColors {
  // Brand
  static const Color brandPrimary = Color(0xFF0B1F3B); // Azul profundo (Nevy)
  static const Color brandSecondary = Color(0xFFFF6B6B); // Coral suave (CTA)

  // Neutrals
  static const Color background = Color(0xFFF6F8FC); // Fondo claro neutro
  static const Color surface = Color(0xFFFFFFFF); // Cards / paneles
  static const Color textPrimary = Color(0xFF0F172A); // Texto principal
  static const Color textSecondary = Color(0xFF64748B); // Texto secundario

  // UI helpers
  static const Color border = Color(0xFFE6EAF2);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);

  /// Gradiente suave (premium) para headers y fondos del onboarding.
  /// Mantiene “tranquilidad” sin ser morado.
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0B1F3B), // Azul profundo
      Color(0xFF123B6B), // Azul medio
      Color(0xFF0B1F3B), // vuelve a profundo (loop visual)
    ],
  );
}
