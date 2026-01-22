import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/widgets/nevy_wordmark.dart';
import 'widgets/nevy_logo_loader.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NevyColors.background, // dark calm
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Wordmark principal en splash.
            NevyLogo(size: 72, color: Colors.white),
            SizedBox(height: 20),
            // Loader circular tipo SVG.
            NevyLogoLoader(size: 64),
          ],
        ),
      ),
    );
  }
}
