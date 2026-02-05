import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/data/model/chat_message_model.dart/chat_message_model.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessageError extends StatelessWidget {
  const ChatMessageError({super.key, required this.message});

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: SizedBox()),
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
                  message.message,
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
                  onPressed: () {
                    context.read<ChatCubit>().retryLastMessage();
                  },
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
