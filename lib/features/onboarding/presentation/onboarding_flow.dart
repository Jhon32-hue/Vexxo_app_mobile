import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/nevy_wordmark.dart';
import 'loading_transition_page.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_indicator.dart';
import 'widgets/onboarding_slide.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  // Contenido principal de las 3 pantallas.
  final slides = const [
    (
      title: 'La forma más fácil de manejar tu dinero',
      description: 'Sin líos ni estrés financiero.',
    ),
    (
      title: 'Todo en un solo lugar',
      description: 'Cuentas, gastos y decisiones conectadas con sentido.',
    ),
    (
      title: 'Hecho para tu vida real',
      description: 'No finanzas de banco. Finanzas humanas.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NevyColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const NevyLogo(size: 36, color: Colors.white),
            const SizedBox(height: 12),
            // Slides con animaciones suaves.
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => currentIndex = index),
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  final slide = slides[index];
                  return OnboardingSlide(
                    title: slide.title,
                    description: slide.description,
                    isActive: index == currentIndex,
                  );
                },
              ),
            ),
            OnboardingIndicator(
              currentIndex: currentIndex,
              total: slides.length,
            ),
            // CTA principal y navegación de flujo.
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: OnboardingButton(
                label: currentIndex == slides.length - 1
                    ? 'Empezar ahora'
                    : 'Continuar',
                onPressed: () {
                  if (currentIndex < slides.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutCubic,
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LoadingTransitionPage(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
