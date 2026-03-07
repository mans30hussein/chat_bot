import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';

import '../../../../core/mixin/chat_service_validation_mixin.dart';
import '../model/chat_model/gemini_chat_response.dart';

class GemenaiChatRepoImpl with ChatServiceValidationMixin implements ChatRepo {
  final ChatApiService _chatApiService;

  GemenaiChatRepoImpl({required ChatApiService chatApiService})
    : _chatApiService = chatApiService;

  @override
  Future<ChatMessageModel> sendMessages({
    required List<ChatMessageModel> messages,
  }) async {
    inputValidation(messages);

    final result = await _chatApiService.sendMessages(messages: messages);

    outputValidation(result);

    return result;
  }
}
