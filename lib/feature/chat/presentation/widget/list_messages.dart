import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/widget/error_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/typing_indicator_bubble.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.conversation,
    required this.isLoading,
    required this.isFailure,
  });
  final List<ChatMessageModel> conversation;
  final bool isLoading;
  final bool isFailure;

  @override
  Widget build(BuildContext context) {
    final visibleConversation = isFailure
    ? conversation.sublist(0, conversation.length - 1)
    : conversation;
    return ListView.builder(
      reverse: true, //  reverse the list
      itemCount: isLoading || isFailure
          ? visibleConversation.length + 1
          : visibleConversation.length,
      itemBuilder: (context, index) {
        if ((isLoading) && index == 0) {
          return const TypingIndicatorBubble();
        }

        if (isFailure && index == 0) {
          return ChatMessageError(
            lastMessage: conversation.last.text,
            onPressed: () {
              var sendMessageCubit = context.read<SendMessageCubit>();
              sendMessageCubit.sendMessage(messages: conversation);
            },
          );
        }

        final newMassageIndex =
            visibleConversation.length - (isLoading || isFailure ? index : index + 1);

        final msg = visibleConversation[newMassageIndex];
        return msg.isUser
            ? MyChatMessage(message: msg.text)
            : UserChatMessage(message: msg.text);
      },
    );
  }
}
