import 'package:chat_bot/core/style/app_styles.dart';
import 'package:flutter/material.dart';

class ChatMessageError extends StatelessWidget {
  const ChatMessageError({super.key, required this.lastMessage, this.onPressed});

  final String lastMessage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Expanded(child: SizedBox()),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  lastMessage,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold13.copyWith(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onPressed,
                  icon: Icon(Icons.refresh, color: Colors.white),
                  label: Text(
                    "Retry",
                    style: AppStyles.styleBold14.copyWith(
                      color: Colors.white,
                      // fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
