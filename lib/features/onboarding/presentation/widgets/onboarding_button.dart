import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

/// Botón principal del onboarding con CTA claro.
class OnboardingButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSecondary;

  const OnboardingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSecondary
        ? Colors.transparent
        : NevyColors.brandSecondary;
    final foregroundColor = isSecondary
        ? NevyColors.textPrimary
        : NevyColors.background;
    final borderSide = isSecondary
        ? const BorderSide(color: NevyColors.textSecondary)
        : BorderSide.none;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: borderSide,
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: foregroundColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
