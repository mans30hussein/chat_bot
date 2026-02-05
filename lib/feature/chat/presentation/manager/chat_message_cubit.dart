import 'package:bloc/bloc.dart';
import 'package:chat_bot/feature/chat/data/chat_api_servvice/chat_api_service.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';

import '../../data/model/chat_message_model.dart/chat_message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatApiService apiService;

  ChatCubit({required this.apiService}) : super(ChatInitial());
  List<MessageModel> messages = [];

  Future<void> sendMessage(String text) async {
    emit(ChatLoading());
    await Future.delayed(const Duration(seconds: 10));

    if (text.trim().isEmpty) return;
    messages.add(MessageModel(message: text, isMe: true));
    emit(ChatUpdated(messages));

    final body = {
      "contents": [
        {
          "parts": [
            {"text": text},
          ],
        },
      ],
    };

    try {
      final response = await apiService.sendMessage(body);

      final chatResponse =
          response.candidates?.first.content?.parts?.first.text;

      messages.add(
        MessageModel(message: chatResponse ?? 'No response', isMe: false),
      );
      emit(ChatUpdated(messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
