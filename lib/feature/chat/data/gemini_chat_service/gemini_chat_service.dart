import 'dart:io';

import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/core/network/api_constant.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:retry/retry.dart';
import 'package:dio/dio.dart';

class ChatApiService {
  final ApiClient apiClient;

  ChatApiService(this.apiClient);

  Future<ChatMessageModel> sendMessages({
    required List<ChatMessageModel> messages,
  }) async {
    final retryOptions = RetryOptions(
      maxAttempts: 3,
      maxDelay: const Duration(seconds: 1),
    );

    final response = await retryOptions.retry(
      () async {
        print("retrying request");
        return await apiClient.post(
          urlEndPoint: ApiConstants.generateContent,
          data: {
            "contents": messages.map((content) => content.toJson()).toList(),
          },
        );
      },
      retryIf: (e) {
        if (e is DioException) {
          print("🔁 Retry because of: $e");
          return e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout ||
              e.type == DioExceptionType.connectionError ||
              e.type == DioExceptionType.connectionTimeout ||
              e.error is SocketException;
        }
        
        return false;
      },
      onRetry: (e) {
        print("retrying attempt ");
      },
    );
    return ChatMessageModel.fromJson(response.data['candidates'][0]['content']);
  }
}
