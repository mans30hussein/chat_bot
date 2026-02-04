// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
  candidates: (json['candidates'] as List<dynamic>?)
      ?.map((e) => Candidates.fromJson(e as Map<String, dynamic>))
      .toList(),
  usageMetadata: json['usageMetadata'] == null
      ? null
      : UsageMetadata.fromJson(json['usageMetadata'] as Map<String, dynamic>),
  modelVersion: json['modelVersion'] as String?,
  responseId: json['responseId'] as String?,
);

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'usageMetadata': instance.usageMetadata,
      'modelVersion': instance.modelVersion,
      'responseId': instance.responseId,
    };

Candidates _$CandidatesFromJson(Map<String, dynamic> json) => Candidates(
  content: json['content'] == null
      ? null
      : Content.fromJson(json['content'] as Map<String, dynamic>),
  finishReason: json['finishReason'] as String?,
  index: (json['index'] as num?)?.toInt(),
);

Map<String, dynamic> _$CandidatesToJson(Candidates instance) =>
    <String, dynamic>{
      'content': instance.content,
      'finishReason': instance.finishReason,
      'index': instance.index,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
  parts: (json['parts'] as List<dynamic>?)
      ?.map((e) => Parts.fromJson(e as Map<String, dynamic>))
      .toList(),
  role: json['role'] as String?,
);

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
  'parts': instance.parts,
  'role': instance.role,
};

Parts _$PartsFromJson(Map<String, dynamic> json) => Parts(
  text: json['text'] as String?,
  thoughtSignature: json['thoughtSignature'] as String?,
);

Map<String, dynamic> _$PartsToJson(Parts instance) => <String, dynamic>{
  'text': instance.text,
  'thoughtSignature': instance.thoughtSignature,
};

UsageMetadata _$UsageMetadataFromJson(Map<String, dynamic> json) =>
    UsageMetadata(
      promptTokenCount: (json['promptTokenCount'] as num?)?.toInt(),
      candidatesTokenCount: (json['candidatesTokenCount'] as num?)?.toInt(),
      totalTokenCount: (json['totalTokenCount'] as num?)?.toInt(),
      promptTokensDetails: (json['promptTokensDetails'] as List<dynamic>?)
          ?.map((e) => PromptTokensDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      thoughtsTokenCount: (json['thoughtsTokenCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsageMetadataToJson(UsageMetadata instance) =>
    <String, dynamic>{
      'promptTokenCount': instance.promptTokenCount,
      'candidatesTokenCount': instance.candidatesTokenCount,
      'totalTokenCount': instance.totalTokenCount,
      'promptTokensDetails': instance.promptTokensDetails,
      'thoughtsTokenCount': instance.thoughtsTokenCount,
    };

PromptTokensDetails _$PromptTokensDetailsFromJson(Map<String, dynamic> json) =>
    PromptTokensDetails(
      modality: json['modality'] as String?,
      tokenCount: (json['tokenCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PromptTokensDetailsToJson(
  PromptTokensDetails instance,
) => <String, dynamic>{
  'modality': instance.modality,
  'tokenCount': instance.tokenCount,
};
