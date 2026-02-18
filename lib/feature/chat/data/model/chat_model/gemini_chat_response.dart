import 'package:json_annotation/json_annotation.dart';
part 'gemini_chat_response.g.dart';


@JsonSerializable()
class ChatMessageModel {
  List<ChatMessagePartModel>? parts;
  String? role;

  ChatMessageModel({this.parts, this.role});

factory ChatMessageModel.fromJson(Map<String, dynamic> json) => _$ChatMessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);

 bool get isUser => role == 'user';
 String get text => parts![0].text!;
 factory ChatMessageModel.fromUserMessage(String message) => ChatMessageModel(parts: [ChatMessagePartModel(text: message)], role: 'user');

    
}
 
@JsonSerializable()
class ChatMessagePartModel {
  String? text;
  String? thoughtSignature;

  ChatMessagePartModel({this.text, this.thoughtSignature});

factory ChatMessagePartModel.fromJson(Map<String, dynamic> json) => _$ChatMessagePartModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMessagePartModelToJson(this); 
}

