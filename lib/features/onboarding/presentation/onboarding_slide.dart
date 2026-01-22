import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';

/// UI de una pantalla del onboarding
class OnboardingSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String asset;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.subtitle,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: NevyColors.heroGradient),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),

          /// Ilustración principal
          Expanded(child: Image.asset(asset, fit: BoxFit.contain)),

          const SizedBox(height: 24),

          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: Colors.white),
          ),

          const SizedBox(height: 12),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
