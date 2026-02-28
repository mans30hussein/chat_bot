import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';

mixin ChatRepoValidation {
  outputValidation(ChatMessageModel result) {
    if (result.role == null || result.role!.trim().isEmpty) {
      throw StateError('missing role in response');
    }
    if (result.parts == null || result.parts!.isEmpty) {
      throw StateError('missing parts in response');
    }
    if (result.parts!.first.text == null || result.parts!.first.text!.isEmpty) {
      throw StateError('parts cannot be empty');
    }
    if (result.role != 'model') {
      throw StateError('role must be model');
    }
  }

  void input_validation(List<ChatMessageModel> messages) {
    if (messages.isEmpty) {
      throw ArgumentError('No messages provided');
    } else if (messages.length < 1) {
      throw ArgumentError('At least one message is required');
    } else if (messages.last.role != 'user') {
      throw ArgumentError('Last message must be user');
    } else if (messages.last.text.isEmpty) {
      throw ArgumentError('Last message content must not be empty');
    } else if (messages.last.text.trim().isEmpty) {
      throw ArgumentError('Last message content must not be empty');
    }
  }
}
