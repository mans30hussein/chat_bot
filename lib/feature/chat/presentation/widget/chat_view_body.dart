import 'package:chat_bot/feature/chat/presentation/widget/all_header_section.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_text_field.dart';
import 'package:chat_bot/feature/chat/presentation/widget/list_messages.dart';
import 'package:flutter/material.dart';

import '../../data/chat_message_model.dart/chat_message_model.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final List<MessageModel> messages = [];
  final TextEditingController controller = TextEditingController();
  void onSendMessage(String text) {
    setState(() {
      messages.add(MessageModel(message: text, isMe: true));
    });
  }

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    onSendMessage(text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListMessages(messages: messages),
          CustomTextField(controller: controller, onPressed: sendMessage),
        ],
      ),
    );
  }
}
