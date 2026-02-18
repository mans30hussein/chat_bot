
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';


abstract class ChatRepo {
    Future<ChatMessageModel> sendMessages({required List<ChatMessageModel> messages});
}