import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';

class MyChatMessage extends StatelessWidget {
  const MyChatMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {          // alignment: message.role == 'user'
                                                // ? Alignment.centerRight
                                                // : Alignment.centerLeft,
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        margin: EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          color: Color(0xff3369FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Text(
          message,
          style: AppStyles.styleBold13.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
