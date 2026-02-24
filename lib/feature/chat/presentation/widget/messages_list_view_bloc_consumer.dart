import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:chat_bot/feature/chat/presentation/widget/list_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesListViewBlocConsumer extends StatelessWidget {
  MessagesListViewBlocConsumer({super.key, required this.conversation});
  final List<ChatMessageModel> conversation ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendMessageCubit, SendMessageState>(
      listener: (context, state) {
        if(state is SendMessageUpdated) {
          conversation.add(state.messages);  // add the ai response message to the conversation
        }
      },
      builder: (context, state) {

        return MessagesListView(
         isFailure: state is SendMessageError,
          isLoading: state is SendMessageLoading,
          conversation: conversation);
      },
    );
  }
}
