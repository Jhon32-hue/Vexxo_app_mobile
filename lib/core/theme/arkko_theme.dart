import 'package:flutter/material.dart';
import 'colors.dart';

/// Theme global de Nevy.
/// Aquí defines el "look & feel" consistente:
/// tipografías, colores, botones, cards, etc.
class ArkkoTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: NevyColors.background,

      /// ColorScheme es la base de los componentes Material.
      colorScheme: const ColorScheme.light(
        primary: NevyColors.brandPrimary,
        secondary: NevyColors.brandSecondary,
        surface: NevyColors.surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: NevyColors.textPrimary,
      ),

      /// Tipografías:
      /// Si luego instalas "Inter", aquí se reflejará en toda la app.
      fontFamily: 'Inter',

      /// TextTheme para jerarquía clara: título grande, subtítulo, body, etc.
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: NevyColors.textPrimary,
          height: 1.1,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: NevyColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: NevyColors.textSecondary,
          height: 1.3,
        ),
      ),

      /// Estilo por defecto de AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        foregroundColor: NevyColors.textPrimary,
      ),

      /// Botones: que se vean premium sin exagerar.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NevyColors.brandSecondary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),

      /// Cards: bordes suaves y sombra leve.
      cardTheme: CardThemeData(
        color: NevyColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: NevyColors.border),
        ),
      ),
    );
  }
}
