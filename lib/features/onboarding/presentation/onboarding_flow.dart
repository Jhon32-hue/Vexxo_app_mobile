import 'package:flutter/material.dart';
import 'widgets/onboarding_slide.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final slides = const [
    OnboardingSlide(
      title: 'Nevy',
      subtitle: 'Tu dinero, sin ruido.',
      description:
          'Entiende tu vida financiera\nsin estrés, sin letras pequeñas.',
    ),
    OnboardingSlide(
      title: 'Todo en un solo lugar',
      subtitle: '',
      description:
          'Cuentas, gastos, metas y decisiones\nconectadas inteligentemente.',
    ),
    OnboardingSlide(
      title: 'Decisiones claras',
      subtitle: '',
      description:
          'Opciones reales basadas en tu situación,\nno en comisiones.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (index) => setState(() => currentIndex = index),
            children: slides,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () {
              if (currentIndex < slides.length - 1) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              } else {
                //TODO: ir a auth / home
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CC9A7),
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              currentIndex == slides.length - 1
                  ? 'Empezar con calma'
                  : 'Continuar',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
