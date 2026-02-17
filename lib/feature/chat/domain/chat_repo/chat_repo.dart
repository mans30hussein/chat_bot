

import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_request.dart';

import '../../data/model/chat_model/gemini_chat_response.dart' hide Content;

abstract class ChatRepo {
    Future<GeminiChatResponse> sendMessages({required List<Content> contents});
}