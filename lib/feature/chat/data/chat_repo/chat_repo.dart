import 'package:chat_bot/feature/chat/data/model/api_model/chat_message_model.dart';

import '../gemenai_chat_service/gemenai_chat_service.dart';

class ChatRepo {
  final ChatApiService chatApiService;

  ChatRepo({required this.chatApiService});

  Future<ChatResponse> sendMessage(Map<String, dynamic> body) async {
    try {
      final response = await chatApiService.sendMessage(body);
      return response;
    } catch (e) {
      print("error ${e.toString()}");
      rethrow;
    }
  }
}