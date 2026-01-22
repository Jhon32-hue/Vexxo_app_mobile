import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

/// Indicador con líneas que marca el avance del onboarding.
class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int total;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          height: 4,
          width: isActive ? 32 : 16,
          decoration: BoxDecoration(
            color: isActive
                ? NevyColors.brandPrimary
                : NevyColors.textSecondary.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}
