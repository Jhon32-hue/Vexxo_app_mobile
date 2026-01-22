import 'dart:async';
import 'package:flutter/material.dart';
import 'loading_transition_page.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int index = 0;
  Timer? _timer;

  final slides = const [
    _OnboardingScene(
      tag: 'APP BUILDING',
      title: 'Diseñe su app en minutos',
      subtitle: 'Pantallas limpias, rápidas y listas para lanzar.',
      backgroundColor: Color(0xFF2532D4),
      textColor: Colors.white,
      accentColor: Color(0xFFF4B544),
      heroStyle: _HeroStyle.appBuilder,
    ),
    _OnboardingScene(
      tag: 'INVERSIÓN',
      title: 'Portafolio digital premium',
      subtitle: 'Cripto, ahorro y activos en un solo panel.',
      backgroundColor: Color(0xFF0C1026),
      textColor: Colors.white,
      accentColor: Color(0xFF4CA1FF),
      heroStyle: _HeroStyle.investment,
    ),
    _OnboardingScene(
      tag: 'ENTRETENIMIENTO',
      title: 'Suscripciones sin fricción',
      subtitle: 'Streaming y gaming con control total.',
      backgroundColor: Color(0xFF14121D),
      textColor: Colors.white,
      accentColor: Color(0xFFF4504A),
      heroStyle: _HeroStyle.entertainment,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !controller.hasClients) return;
      final nextIndex = (index + 1) % slides.length;
      controller.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slide = slides[index];
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: slide.backgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: slides.length,
                  onPageChanged: (i) => setState(() => index = i),
                  itemBuilder: (_, i) {
                    final data = slides[i];
                    return _OnboardingSlideView(
                      data: data,
                      isActive: i == index,
                    );
                  },
                ),
              ),
              OnboardingIndicator(
                currentIndex: index,
                total: slides.length,
                activeColor: slide.accentColor,
                inactiveColor: slide.textColor.withValues(alpha: 0.3),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
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

class _OnboardingScene {
  final String tag;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;
  final Color accentColor;
  final _HeroStyle heroStyle;

  const _OnboardingScene({
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.textColor,
    required this.accentColor,
    required this.heroStyle,
  });
}

enum _HeroStyle { appBuilder, investment, entertainment }

class _OnboardingSlideView extends StatelessWidget {
  final _OnboardingScene data;
  final bool isActive;

  const _OnboardingSlideView({
    required this.data,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isActive ? 1 : 0,
            curve: Curves.easeOut,
            child: Column(
              children: [
                Text(
                  data.tag,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w600,
                    color: data.textColor.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: data.textColor,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: data.textColor.withValues(alpha: 0.78),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          AnimatedScale(
            duration: const Duration(milliseconds: 550),
            scale: isActive ? 1 : 0.95,
            child: _Floating(
              isActive: isActive,
              child: _HeroCard(
                data: data,
                isActive: isActive,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final _OnboardingScene data;
  final bool isActive;

  const _HeroCard({required this.data, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: 280,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: switch (data.heroStyle) {
          _HeroStyle.appBuilder => _AppBuilderHero(
              accentColor: data.accentColor,
              isActive: isActive,
            ),
          _HeroStyle.investment => _InvestmentHero(
              accentColor: data.accentColor,
              isActive: isActive,
            ),
          _HeroStyle.entertainment => _EntertainmentHero(
              accentColor: data.accentColor,
              isActive: isActive,
            ),
        },
      ),
    );
  }
}

class _AppBuilderHero extends StatelessWidget {
  final Color accentColor;
  final bool isActive;

  const _AppBuilderHero({
    required this.accentColor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF3948FF),
                  accentColor.withValues(alpha: 0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 18,
          child: _GlowBadge(
            label: 'UI/UX',
            color: Colors.white,
          ),
        ),
        Positioned(
          left: 24,
          bottom: 24,
          child: AnimatedRotation(
            turns: isActive ? 1 : 0.85,
            duration: const Duration(milliseconds: 900),
            child: Icon(
              Icons.settings,
              color: Colors.white.withValues(alpha: 0.85),
              size: 32,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 180,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 16,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apps, color: accentColor, size: 48),
                const SizedBox(height: 12),
                Text(
                  'App Building',
                  style: TextStyle(
                    color: const Color(0xFF1C1E3A),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Fast & clean',
                  style: TextStyle(
                    color: const Color(0xFF1C1E3A).withValues(alpha: 0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InvestmentHero extends StatelessWidget {
  final Color accentColor;
  final bool isActive;

  const _InvestmentHero({
    required this.accentColor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.3, -0.6),
                radius: 1.1,
                colors: [Color(0xFF1D4CFF), Color(0xFF0A0E2E)],
              ),
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 20,
          child: Text(
            'Inversión',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Portafolio cripto',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _LogoBubble(
                      url:
                          'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/btc.png',
                      label: 'BTC',
                    ),
                    _LogoBubble(
                      url:
                          'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/eth.png',
                      label: 'ETH',
                    ),
                    _LogoBubble(
                      url:
                          'https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/sol.png',
                      label: 'SOL',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text(
                    'Saldo: 1.654,34€',
                    style: TextStyle(
                      color: Color(0xFF0B0F28),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _EntertainmentHero extends StatelessWidget {
  final Color accentColor;
  final bool isActive;

  const _EntertainmentHero({
    required this.accentColor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E1E2F), Color(0xFF0E0C16)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              'Streaming & gaming',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: const [
              _LogoBubble(
                url: 'https://logo.clearbit.com/netflix.com?size=128',
                label: 'Netflix',
              ),
              _LogoBubble(
                url: 'https://logo.clearbit.com/spotify.com?size=128',
                label: 'Spotify',
              ),
              _LogoBubble(
                url: 'https://logo.clearbit.com/twitch.tv?size=128',
                label: 'Twitch',
              ),
              _LogoBubble(
                url: 'https://logo.clearbit.com/steampowered.com?size=128',
                label: 'Steam',
              ),
              _LogoBubble(
                url: 'https://logo.clearbit.com/playstation.com?size=128',
                label: 'PlayStation',
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: _GlowBadge(label: 'Control', color: accentColor),
        ),
      ],
    );
  }
}

class _GlowBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _GlowBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.9),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LogoBubble extends StatelessWidget {
  final String url;
  final String label;

  const _LogoBubble({
    required this.url,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 52,
          width: 52,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Image.network(
            url,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _Floating extends StatefulWidget {
  final Widget child;
  final bool isActive;

  const _Floating({required this.child, required this.isActive});

  @override
  State<_Floating> createState() => _FloatingState();
}

class _FloatingState extends State<_Floating>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        final offset = widget.isActive ? _controller.value * 6 : 0.0;
        return Transform.translate(
          offset: Offset(0, -offset),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
