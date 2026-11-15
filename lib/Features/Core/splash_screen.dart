import 'package:flutter/material.dart';
import 'package:media_player_app/Features/audio_player/presentation/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17191B),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.75, end: 1.0),
          duration: const Duration(milliseconds: 2500),
          curve: Curves.easeOutCubic,
          builder: (context, scale, child) {
            return Transform.scale(scale: scale, child: child);
          },
          child: Image.asset(
            'assets/swarika_splash_logo.png',
            width: 260,
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
