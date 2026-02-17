import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/core/network/api_constant.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart' hide Content;

import '../model/chat_model/gemini_chat_request.dart';

  class ChatApiService {
  final ApiClient apiClient;

  ChatApiService(this.apiClient);

  Future<GeminiChatResponse> sendMessages({
    required List<Content> contents,
  }) async {
    final request = GeminiRequest(contents: contents);
    final response = await apiClient.post(
      urlEndPoint: ApiConstants.generateContent,
      data:request.toJson() ,  // {"contents": contents.map((message) => message.toJson()).toList()}
    );
    return GeminiChatResponse.fromJson(response.data);  
  }
}
