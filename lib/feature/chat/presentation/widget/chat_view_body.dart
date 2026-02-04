import 'package:chat_bot/core/network/api_service.dart';
import 'package:chat_bot/feature/chat/data/chat_api_servvice/chat_api_service.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:chat_bot/feature/chat/presentation/widget/custom_text_field.dart';
import 'package:chat_bot/feature/chat/presentation/widget/list_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(apiService: ChatApiService(ApiService.createDio())),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [ListMessages(), CustomTextField()]),
      ),
    );
  }
}
