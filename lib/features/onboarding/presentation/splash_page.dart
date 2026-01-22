import 'package:flutter/material.dart';
import '../../../core/widgets/nevy_wordmark.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220), // dark calm
      body: const Center(child: NevyLogo(size: 72, color: Colors.white)),
    );
  }
}
