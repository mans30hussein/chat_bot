import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart' hide Content;
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';


class GemenaiChatRepoImpl implements ChatRepo {
  final ChatApiService _chatApiService;

  GemenaiChatRepoImpl({required ChatApiService chatApiService}):
    _chatApiService = chatApiService;
  
  @override
  Future<ChatMessageModel> sendMessages({required List<ChatMessageModel> messages}) {
    
    
      return _chatApiService.sendMessages(messages:messages );
   
  }
}