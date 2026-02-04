import 'package:chat_bot/feature/chat/data/model/chat_message_model.dart/chat_message_model.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
import 'package:flutter/material.dart';

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
