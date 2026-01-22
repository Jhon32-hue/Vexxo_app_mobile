import 'package:flutter/material.dart';
import 'features/onboarding/presentation/onboarding_page.dart';

void main() {
  runApp(const NevyApp());
}

class NevyApp extends StatelessWidget {
  const NevyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(), // 👈 AQUÍ
    );
  }
}
