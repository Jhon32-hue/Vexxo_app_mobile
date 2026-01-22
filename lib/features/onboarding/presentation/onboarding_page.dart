import 'package:flutter/material.dart';
import '../domain/onboarding_slide_model.dart';
import 'onboarding_slide.dart';
import 'loading_transition_page.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_indicator.dart';
import '../../../core/theme/colors.dart';

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
      tag: 'IDENTIDAD',
      title: 'Vexxo',
      subtitle: 'Maneje su dinero sin enredos.',
    ),
    OnboardingSlideModel(
      tag: 'ORDEN',
      title: 'Todo claro, todo en un solo lugar',
      subtitle: 'Cuentas, gastos y movimientos organizados como deben estar.',
    ),
    OnboardingSlideModel(
      tag: 'CONTROL',
      title: 'Sepa en qué se va la plata',
      subtitle: 'Vea sus gastos reales y tome mejores decisiones sin adivinar.',
    ),
    OnboardingSlideModel(
      tag: 'RELACIONES',
      title: 'Las cuentas claras mantienen las relaciones',
      subtitle: 'Comparta gastos con amigos o pareja sin discusiones incómodas.',
    ),
    OnboardingSlideModel(
      tag: 'INTELIGENCIA',
      title: 'Una ayuda extra cuando hace falta',
      subtitle: 'La IA le muestra opciones y le ayuda a anticiparse.',
    ),
    OnboardingSlideModel(
      tag: 'CRECIMIENTO',
      title: 'Haga que su dinero trabaje mejor',
      subtitle: 'Ahorro, inversión y alternativas pensadas para usted.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final slide = slides[index];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: NevyColors.heroGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
                child: Column(
                  children: [
                    Text(
                      slide.tag,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        letterSpacing: 2,
                        color: NevyColors.textSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      slide.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                            color: NevyColors.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      slide.subtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: NevyColors.textSecondary,
                            height: 1.4,
                          ),
                    ),
                    const SizedBox(height: 20),
                    OnboardingIndicator(
                      currentIndex: index,
                      total: slides.length,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: slides.length,
                  onPageChanged: (i) => setState(() => index = i),
                  itemBuilder: (_, __) => const OnboardingSlide(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Column(
                  children: [
                    OnboardingButton(
                      label: 'Ingresar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoadingTransitionPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    OnboardingButton(
                      label: 'Registrarme',
                      isSecondary: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoadingTransitionPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
