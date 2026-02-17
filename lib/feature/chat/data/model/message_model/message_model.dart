
class MessageModel {
  final String message;
  final bool isMe;
  MessageModel({required this.message, required this.isMe });
}
class UiChatMessage {
  final String text;
  final bool isUser;

  UiChatMessage({
    required this.text,
    required this.isUser,
  });
}
