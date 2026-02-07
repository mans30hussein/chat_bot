import 'package:flutter/material.dart';
import 'package:chat_bot/core/shared_pref/shared_pref.dart';
import 'package:chat_bot/core/utils/assets.dart';
import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/presentation/view/chat_view.dart';


class OnbourdingViewBody extends StatelessWidget {
  const OnbourdingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text("Your AI Assistant", style: AppStyles.styleBold23),
            const SizedBox(height: 16),
            Text(
              "Using this software, you can ask questions\nand receive smart answers using\nartificial intelligence.",
              textAlign: TextAlign.center,
              style: AppStyles.styleMedium15,
            ),
            const SizedBox(height: 60),
            Image.asset(
              Assets.onbourding,
              height: 280, // adjust as needed
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3369FF),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              onPressed: () async {
                await AppPrefs.setOnboardingShown();
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatView()),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue", style: AppStyles.styleBold20),
                  const SizedBox(width: 12),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}