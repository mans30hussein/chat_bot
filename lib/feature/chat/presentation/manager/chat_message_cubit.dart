import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_request.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatRepo}) : super(ChatInitial());

  final ChatRepo chatRepo;

  final List<Content> _conversation = [];

  List<Content> get conversation => List.unmodifiable(_conversation);

  Future<void> sendMessage(String userText) async {
    if (userText.trim().isEmpty) return;

    final userContent = Content(
      role: 'user',
      parts: [Part(text: userText)],
    );
    _conversation.add(userContent);
    emit(ChatUpdated(messages: List.from(_conversation)));
    emit(ChatLoading());

    try {
      final response = await chatRepo.sendMessages(contents: _conversation);

      final aiResponse = response.candidates
              ?.firstOrNull
              ?.content
              ?.parts
              ?.firstOrNull
              ?.text ??
          '';

      if (aiResponse.isNotEmpty) {
        final modelContent = Content(
          role: 'model',
          parts: [Part(text: aiResponse)],
        );

        _conversation.add(modelContent);
        emit(ChatUpdated(messages: List.from(_conversation)));
      } else {
        emit(ChatError("Some this is wrong"));
      }
    } catch (e) {
      emit(ChatError('Something went wrong'));
    }
  }
}