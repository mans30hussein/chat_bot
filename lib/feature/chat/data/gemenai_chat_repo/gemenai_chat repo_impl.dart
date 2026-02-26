import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';

import '../model/chat_model/gemini_chat_response.dart';

class GemenaiChatRepoImpl implements ChatRepo {
  final ChatApiService _chatApiService;

  GemenaiChatRepoImpl({required ChatApiService chatApiService})
    : _chatApiService = chatApiService;

  @override
  Future<ChatMessageModel> sendMessages({
    required List<ChatMessageModel> messages,
  }) async {
    if (messages.isEmpty) {
      throw ArgumentError('No messages provided');
    } else if (messages.length < 1) {
      throw ArgumentError('At least one message is required');
    } else if (messages.last.role != 'user') {
      throw ArgumentError('Last message must be user');
    } else if (messages.last.text.isEmpty) {
      throw ArgumentError('Last message content must not be empty');
    } else if (messages.last.text.trim().isEmpty) {
      throw ArgumentError('Last message content must not be empty');
    }

    final result = await _chatApiService.sendMessages(messages: messages);

    if (result.role == null || result.role!.trim().isEmpty) {
      throw StateError('missing role in response');
    }
    if (result.parts == null || result.parts!.isEmpty) {
      throw StateError('missing parts in response');
    }
    if (result.parts!.first.text == null || result.parts!.first.text!.isEmpty) {
      throw StateError('parts cannot be empty');
    }
    if (result.role != 'model') {
      throw StateError('role must be model');
    }

    return result;
  }
}
