import 'package:chat_bot/core/style/app_styles.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../data/chat_message_model.dart/chat_message_model.dart';

class ListMessages extends StatelessWidget {
  ListMessages({super.key, required this.messages});
  final List<MessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          return message.isMe ? UserChatMessage(message: message) : MyChatMessage(message: message);
        },
      ),
    );
  }
}

class MyChatMessage extends StatelessWidget {
  const MyChatMessage({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe
          ? Alignment.centerRight
          : Alignment.centerLeft,
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
          message.message,
          style: AppStyles.styleBold13.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class UserChatMessage extends StatelessWidget {
  const UserChatMessage({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe
          ? Alignment.centerRight 
          : Alignment.centerLeft,
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
        message.message,
        style: AppStyles.styleBold13.copyWith(
          color: message.isMe ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    )
    );
  }
}
