import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/nevy_wordmark.dart';
import 'widgets/flying_man_animation.dart';
import 'widgets/nevy_logo_loader.dart';

/// Pantalla de transición al finalizar el onboarding.
/// Mantiene la marca y una animación suave mientras carga.
class LoadingTransitionPage extends StatefulWidget {
  const LoadingTransitionPage({super.key});

  @override
  State<LoadingTransitionPage> createState() => _LoadingTransitionPageState();
}

class _LoadingTransitionPageState extends State<LoadingTransitionPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pop(context); // luego va a auth
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NevyColors.background,
      body: Stack(
        children: [
          // Fondo animado con hombre volando.
          const FlyingManAnimation(speed: 0.8),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // Branding y loader central.
                NevyLogo(size: 48, color: Colors.white),
                SizedBox(height: 16),
                NevyLogoLoader(size: 56),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
