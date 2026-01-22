import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

/// UI de una pantalla del onboarding
class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Container(
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
            color: NevyColors.surface.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: NevyColors.border.withValues(alpha: 0.7),
            ),
          ),
        ),
      ),
    );
  }
}
