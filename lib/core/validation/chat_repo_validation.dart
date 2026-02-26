import 'package:chat_bot/feature/chat/data/model/chat_model/gemini_chat_response.dart';

extension ChatRepoValidation on ChatMessageModel {
  bool isValid() {
    return role != null &&
        role!.isNotEmpty &&
        parts != null &&
        parts!.isNotEmpty &&
        parts!.first.text != null &&
        parts!.first.text!.isNotEmpty;
  }
}
