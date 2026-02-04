import 'package:chat_bot/core/gen/assets.dart';
import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';

class OnbourdingViewBody extends StatelessWidget {
  const OnbourdingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Text("You AI Assistant", style: AppStyles.styleBold23),
            SizedBox(height: 14),
            Text(
              "Using this software,you can ask you\nquestions and receive articles using\n artificial intelligence assistant",
              style: AppStyles.styleMedium15,
            ),
            SizedBox(height: 86),
            Image.asset(Assets.onbourding),
            Expanded(child: SizedBox()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3369FF),
                minimumSize: const Size(double.maxFinite, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text("Continue", style: AppStyles.styleBold20),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
