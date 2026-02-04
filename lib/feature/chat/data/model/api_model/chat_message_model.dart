import 'package:json_annotation/json_annotation.dart';
part 'chat_message_model.g.dart';
@JsonSerializable()
class ChatResponse {
  List<Candidates>? candidates;
  UsageMetadata? usageMetadata;
  String? modelVersion;
  String? responseId;

  ChatResponse(
      {this.candidates,
      this.usageMetadata,
      this.modelVersion,
      this.responseId});
factory ChatResponse.fromJson(Map<String, dynamic> json) => _$ChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
@JsonSerializable()
class Candidates {
  Content? content;
  String? finishReason;
  int? index;

  Candidates({this.content, this.finishReason, this.index});
factory Candidates.fromJson(Map<String, dynamic> json) => _$CandidatesFromJson(json);
  Map<String, dynamic> toJson() => _$CandidatesToJson(this);
}
@JsonSerializable()
class Content {
  List<Parts>? parts;
  String? role;

  Content({this.parts, this.role});

factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
 
    
    
}
 
@JsonSerializable()
class Parts {
  String? text;
  String? thoughtSignature;

  Parts({this.text, this.thoughtSignature});

factory Parts.fromJson(Map<String, dynamic> json) => _$PartsFromJson(json);
  Map<String, dynamic> toJson() => _$PartsToJson(this); 
}
@JsonSerializable()
class UsageMetadata {
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;
  List<PromptTokensDetails>? promptTokensDetails;
  int? thoughtsTokenCount;

  UsageMetadata(
      {this.promptTokenCount,
      this.candidatesTokenCount,
      this.totalTokenCount,
      this.promptTokensDetails,
      this.thoughtsTokenCount});
factory UsageMetadata.fromJson(Map<String, dynamic> json) => _$UsageMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$UsageMetadataToJson(this);
}
@JsonSerializable()
class PromptTokensDetails {
  String? modality;
  int? tokenCount;

  PromptTokensDetails({this.modality, this.tokenCount});
factory PromptTokensDetails.fromJson(Map<String, dynamic> json) => _$PromptTokensDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PromptTokensDetailsToJson(this);

 
}