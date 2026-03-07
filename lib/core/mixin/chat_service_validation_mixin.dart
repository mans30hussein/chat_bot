import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';

mixin ChatServiceValidationMixin {
  
  void inputValidation(List<ChatMessageModel> messages) {
    if (messages.isEmpty) {
      throw ArgumentError('messages cannot be empty');
    }
   
    else if (messages.last.role != 'user') {
      throw ArgumentError('Last message must be user');
    }
    else if (messages.last.text.isEmpty) {
      throw ArgumentError('Last message content must not be empty');
    }
    else if (messages.first.parts!.isEmpty) {
      throw ArgumentError('Parts can not by empty');
    }
  }

  void outputValidation(ChatMessageModel response) {
    if (response.role == null || response.role!.trim().isEmpty) {
      throw ArgumentError('missing role in response');
    }
    
    if (response.role != 'model') {
      throw ArgumentError('role must be model');
    }
  }
}