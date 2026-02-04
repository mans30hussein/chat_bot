import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:chat_bot/feature/chat/presentation/widget/error_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMessages extends StatelessWidget {
  ListMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final messages = context.read<ChatCubit>().messages;

        if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ChatError) {
          return ErrorChatMessage();
        }

        return Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[messages.length - 1 - index];

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
