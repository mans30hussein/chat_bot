
import 'dart:io';
import 'package:chat_bot/core/network/api_client.dart';
import 'package:chat_bot/core/network/api_constant.dart';
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';
import 'package:dio/dio.dart';
class ChatApiService {
  final ApiClient apiClient;

  ChatApiService(this.apiClient);

 Future<ChatMessageModel> sendMessages({
  required List<ChatMessageModel> messages,
}) async {

  const int maxRetries = 3;
  int retryCount = 0;

  while (retryCount < maxRetries) {
    try {
      final response = await apiClient.post(
        urlEndPoint: ApiConstants.generateContent,
        data: {
          "contents": messages.map((e) => e.toJson()).toList(),
        },
      );

      return ChatMessageModel.fromJson(
        response.data['candidates'][0]['content'],
      );

    } on DioException catch (e) {

      final isNetworkError =
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.error is SocketException;

      if (!isNetworkError) rethrow;

      retryCount++;

      if (retryCount >= maxRetries) {
        rethrow;
      }

      await Future.delayed(
        Duration(seconds: retryCount * 2),
      );
    }
  }

  throw Exception("Failed after retry attempts");
}
}
