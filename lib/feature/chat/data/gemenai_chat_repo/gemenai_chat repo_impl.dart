import 'package:chat_bot/core/validation/chat_repo_validation.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';

import '../model/chat_model/gemini_chat_response.dart';

class GemenaiChatRepoImpl with ChatRepoValidation implements ChatRepo  {
  final ChatApiService _chatApiService;

  GemenaiChatRepoImpl({required ChatApiService chatApiService})
    : _chatApiService = chatApiService;

  @override
  Future<ChatMessageModel> sendMessages({
    required List<ChatMessageModel> messages,
  }) async {
    input_validation(messages);

    final result = await _chatApiService.sendMessages(messages: messages);

  outputValidation(result);

    return result;
  }

  
}
