import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import 'widgets/flying_man_animation.dart';

/// Pantalla que aparece al terminar onboarding
/// antes de ir a login / register
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
      backgroundColor: NevyColors.brandPrimary,
      body: Stack(
        children: const [
          FlyingManAnimation(),
          Center(
            child: Text(
              'Nevy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
