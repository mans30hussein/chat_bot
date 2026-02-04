 
import 'package:chat_bot/feature/chat/data/model/chat_message_model.dart/chat_message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatUpdated extends ChatState {
  final List<MessageModel> messages;
  ChatUpdated(this.messages);
}

class ChatError extends ChatState {
  final String error;
  ChatError(this.error);
}
