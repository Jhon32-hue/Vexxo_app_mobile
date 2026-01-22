import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'flying_man_animation.dart';

/// Slide individual del onboarding con jerarquía clara y animación suave.
class OnboardingSlide extends StatelessWidget {
  final String title;
  final String description;
  final bool isActive;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.description,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isActive ? 1 : 0.6,
            curve: Curves.easeInOut,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
              offset: isActive ? Offset.zero : const Offset(0, 0.08),
              child: _HeroCard(isActive: isActive),
            ),
          ),
          const SizedBox(height: 36),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 450),
            opacity: isActive ? 1 : 0,
            curve: Curves.easeInOut,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOutCubic,
              offset: isActive ? Offset.zero : const Offset(0, 0.08),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: NevyColors.textPrimary,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: NevyColors.textSecondary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card hero con motion graphic del hombre volando.
class _HeroCard extends StatelessWidget {
  final bool isActive;

  const _HeroCard({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: 240,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1729),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: NevyColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: NevyColors.heroGradient,
                ),
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: isActive ? 1 : 0.6,
                child: const FlyingManAnimation(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
