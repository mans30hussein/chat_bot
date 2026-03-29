import 'package:flutter/material.dart';
import 'package:chat_bot/core/shared_pref/shared_pref.dart';
import 'package:chat_bot/core/utils/assets.dart';
import 'package:chat_bot/feature/chat/presentation/view/chat_view.dart';
import 'package:chat_bot/feature/onbourding/presentation/onbourding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800), // reasonable duration
    );

    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // Start navigation logic after animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });
  }

  Future<void> _navigateToNextScreen() async {
    // Small extra delay to make it feel smooth
   // await Future.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;

    final bool onboardingSeen = await AppPrefs.isOnboardingShown();

    if (onboardingSeen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ChatView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnbourdingView()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3369FF),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: Image.asset(
            Assets.appLogo,
            width: 140,
          ),
        ),
      ),
    );
  }
}