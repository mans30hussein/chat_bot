import 'package:chat_bot/feature/onbourding/presentation/onbourding_view_body.dart';
import 'package:flutter/material.dart';

class OnbourdingView extends StatelessWidget {
  const OnbourdingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OnbourdingViewBody(),
    );
  }
}
