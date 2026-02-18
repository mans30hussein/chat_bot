import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key, required this.conversation});
  final List<ChatMessageModel> conversation;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: conversation.length,
      itemBuilder: (context, index) {
        final msg = conversation[index];
        return msg.isUser
            ? MyChatMessage(message: msg.text)
            : UserChatMessage(message: msg.text);
      },
    );
  }
}
