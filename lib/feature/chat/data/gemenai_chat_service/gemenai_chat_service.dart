import 'package:chat_bot/core/network/parse_error.dart';
import 'package:chat_bot/feature/chat/data/model/api_model/chat_message_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:chat_bot/core/network/api_constant.dart';

part 'chat_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChatApiService {
  ParseErrorLogger? get errorLogger;

  factory ChatApiService(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) = _ChatApiService;

  @POST(ApiConstants.generateContent)
  Future<ChatResponse> sendMessage(
    @Body() Map<String, dynamic> body,
  );
}
