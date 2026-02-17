import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_request.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:chat_bot/feature/chat/presentation/widget/error_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/my_chat_message.dart';
import 'package:chat_bot/feature/chat/presentation/widget/typing_indicator_bubble.dart';
import 'package:chat_bot/feature/chat/presentation/widget/user_chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListMessages extends StatelessWidget {
    ListMessages({super.key});
    final List<Content> _conversation = [];
    String userText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
            final chatCubit = context.read<ChatCubit>();

        final messages = chatCubit.conversation;

        if (state is ChatError) {
          return ChatMessageError();
        }
        if(state is ChatUpdated){
           final userContent = Content(
      role: 'user',
      parts: [Part(text: userText)],
    );
    _conversation.add(userContent);
    final aiRsponse = Content(
      role: 'model',
      parts: [Part(text: userText)],
    );

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
              return message.role == 'user'
                  ? MyChatMessage(message: Content(role: message.role, parts: message.parts))
                  : UserChatMessage(message: Content(role: message.role, parts: message.parts));
            },
          ),
        );
      },
    );
  }
}
