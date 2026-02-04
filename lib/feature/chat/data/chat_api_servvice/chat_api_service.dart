import 'package:chat_bot/feature/chat/data/model/api_model/chat_message_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/network/api_constant.dart';
part '../api_servvice/chat_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String baseUrl}) = _ChatApiService;

  @POST(ApiConstants.generateContent)
  Future<ChatResponse> sendMessage(@Body() Map<String, dynamic> body);
}