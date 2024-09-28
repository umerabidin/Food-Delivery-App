import 'package:json_annotation/json_annotation.dart';
part 'news_response.g.dart';

@JsonSerializable()
class PostResponse {
  PostResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) =>_$PostResponseFromJson(json);

  final int userId;
  final int id;
  final String title;
  final String body;

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
