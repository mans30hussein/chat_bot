import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/core/network/api_constant.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';

class ChatApiService {
  final ApiClient apiClient;

  ChatApiService(this.apiClient);

  Future<ChatMessageModel> sendMessages({
    required List<ChatMessageModel> messages,
  }) async {
    const int maxRetries = 3;
    Object? lastError;

    for (var attempt = 0; attempt < maxRetries; attempt++) {
      try {
        final response = await apiClient.post(
          urlEndPoint: ApiConstants.generateContent,
          data: {"contents": messages.map((e) => e.toJson()).toList()},
        );

        return ChatMessageModel.fromJson(
          response.data['candidates'][0]['content'],
        );
      } catch (e) {
        lastError = e;
      }
    }

    throw lastError ?? Exception('Failed to send messages after $maxRetries attempts');
  }
}
