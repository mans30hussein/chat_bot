import 'package:bloc/bloc.dart';
import 'package:chat_bot/feature/chat/data/gemenai_chat_service/gemenai_chat_service.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';

import '../../data/model/chat_message_model.dart/chat_message_model.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatApiService apiService;

  ChatCubit({required this.apiService}) : super(ChatInitial());
  final List<MessageModel> messages = [];
  MessageModel? _lastUserMessage;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMessage = MessageModel(message: text, isMe: true);
    _lastUserMessage = userMessage; // save it for retry

    messages.add(userMessage);
    emit(ChatUpdated(List.from(messages)));

    await _formRequest();
  }

  Future<void> retryLastMessage() async {
    if (_lastUserMessage == null) return;
    if (messages.isNotEmpty && !messages.last.isMe) {
      messages.removeLast();
    }
    emit(ChatUpdated(
      List.from(messages),
    ));

    await _formRequest();
  }

  Future<void> _formRequest() async {
    emit(ChatLoading());

    final body = {
      "contents": [
        {
          "parts": [
            {"text": _lastUserMessage?.message ?? ''},
          ],
        },
      ],
    };

    try {
      final response = await apiService.sendMessage(body);

      final botReply = response.candidates?.first.content?.parts?.first.text;

      messages.add(
        MessageModel(message: botReply ?? 'No response', isMe: false),
      );

      emit(ChatUpdated(List.from(messages)));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

 
}