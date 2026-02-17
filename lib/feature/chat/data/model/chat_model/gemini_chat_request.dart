import 'package:json_annotation/json_annotation.dart';

part 'gemini_chat_request.g.dart';

@JsonSerializable()
class GeminiRequest {
  final List<Content> contents;

  GeminiRequest({required this.contents});

  factory GeminiRequest.fromJson(Map<String, dynamic> json) =>
      _$GeminiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GeminiRequestToJson(this);
}

@JsonSerializable()
class Content {
  final String role;
  final List<Part> parts;

  Content({required this.role, required this.parts});

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class Part {
  final String? text;

  Part({this.text});

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}