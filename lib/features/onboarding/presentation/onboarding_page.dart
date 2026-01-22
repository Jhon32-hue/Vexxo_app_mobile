import 'package:flutter/material.dart';
import '../domain/onboarding_slide_model.dart';
import 'onboarding_slide.dart';
import 'loading_transition_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  int index = 0;

  final slides = const [
    OnboardingSlideModel(
      title: 'Tu dinero, sin ruido',
      subtitle: 'Ve claro cuánto tienes y cómo se mueve.',
      asset: 'assets/onboarding/slide1.png',
    ),
    OnboardingSlideModel(
      title: 'Decisiones inteligentes',
      subtitle: 'Ahorra, paga y planifica con contexto.',
      asset: 'assets/onboarding/slide2.png',
    ),
    OnboardingSlideModel(
      title: 'Hecho para tu vida real',
      subtitle: 'No finanzas de banco. Finanzas humanas.',
      asset: 'assets/onboarding/slide3.png',
    ),
  ];

  void next() {
    if (index < slides.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoadingTransitionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: slides.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (_, i) {
              final s = slides[i];
              return OnboardingSlide(
                title: s.title,
                subtitle: s.subtitle,
                asset: s.asset,
              );
            },
          ),
          Positioned(
            bottom: 40,
            right: 24,
            child: FloatingActionButton(
              onPressed: next,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
