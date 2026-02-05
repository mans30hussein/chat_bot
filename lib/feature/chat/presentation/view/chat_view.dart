import 'package:chat_bot/feature/chat/presentation/widget/chat_view_body.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(),
      ),
      body: ChatViewBody(),
    );
  }
}
