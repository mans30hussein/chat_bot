// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gemini_chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => ChatMessagePartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String?,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{'parts': instance.parts, 'role': instance.role};

ChatMessagePartModel _$ChatMessagePartModelFromJson(
  Map<String, dynamic> json,
) => ChatMessagePartModel(
  text: json['text'] as String?,
  thoughtSignature: json['thoughtSignature'] as String?,
);

Map<String, dynamic> _$ChatMessagePartModelToJson(
  ChatMessagePartModel instance,
) => <String, dynamic>{
  'text': instance.text,
  'thoughtSignature': instance.thoughtSignature,
};
