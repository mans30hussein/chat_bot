import 'package:chat_bot/core/utils/assets.dart';
import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';


class UserChatMessage extends StatelessWidget {
  const UserChatMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(Assets.robotIcon, width: 24, height: 24),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            margin: EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Text(
              message,
              style: AppStyles.styleBold13.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
