import 'package:chat_bot/core/failure/failure.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';

import '../model/chat_model/gemini_chat_response.dart';

class GemenaiChatRepoImpl implements ChatRepo {
  final ChatApiService _chatApiService;

  GemenaiChatRepoImpl({required ChatApiService chatApiService})
    : _chatApiService = chatApiService;

  @override
  Future< ChatMessageModel> sendMessages({
    required List<ChatMessageModel> messages,
  }) {
    if(messages.isEmpty){
      throw ArgumentError('No messages provided');
    }else if(messages.length < 2){
      throw ArgumentError('At least two messages are required');
    }else if(messages.last.role != 'user'){
      throw ArgumentError('Last message must be user');
    }else if(messages.last.text.isEmpty){
      throw ArgumentError('Last message content must not be empty');
    }else if(messages.last.text.trim().isEmpty){
      throw ArgumentError('Last message content must not be empty');
    }

    try {
      final result = _chatApiService.sendMessages(messages: messages);
     
      return result;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
