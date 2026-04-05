// ignore_for_file: must_be_immutable

import 'package:chat_bot/core/service_locator/service_locator.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_text_field.dart';
import 'package:chat_bot/feature/chat/presentation/widget/messages_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewBody extends StatelessWidget {
   ChatViewBody({super.key});
List<ChatMessageModel> conversation = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SendMessageCubit>(), // SendMessageCubit(chatRepo: getIt<GemenaiChatRepoImpl>())
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child:MessagesListViewBlocConsumer(
              conversation: conversation,
            )), 
            CustomTextField(conversation: conversation),
            ]),
      ),
    );
  }
}
