import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:chat_bot/feature/chat/presentation/widget/error_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/typing_indicator_bubble.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMessages extends StatelessWidget {
  const ListMessages({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final messages = context.watch<ChatCubit>().messages;
        if (state is ChatError) {
          return ChatMessageError(message: messages.last);
        }
        return Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length + (state is ChatLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (state is ChatLoading && index == 0) {
                return const TypingIndicatorBubble();
              }
              final messageIndex = state is ChatLoading ? index - 1 : index; 
              final message = messages[messages.length - 1 - messageIndex];
              return message.isMe
                  ? MyChatMessage(message: message)
                  : UserChatMessage(message: message);
            },
          ),
        );
      },
    );
  }
}
