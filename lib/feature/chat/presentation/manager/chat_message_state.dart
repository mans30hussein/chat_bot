 
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_request.dart';


abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatUpdated extends ChatState {
  final List<Content> messages;
  ChatUpdated({required this.messages});
}
class ChatError extends ChatState {
  final String error;
  ChatError(this.error);
}
