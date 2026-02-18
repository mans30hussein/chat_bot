 
import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';


abstract class SendMessageState {}

class SendMessageInitial extends SendMessageState {}

class SendMessageLoading extends SendMessageState {}

class SendMessageUpdated extends SendMessageState {
  final ChatMessageModel messages;
  SendMessageUpdated({required this.messages});
}
class SendMessageError extends SendMessageState {
  final String error;
  SendMessageError(this.error);
}
