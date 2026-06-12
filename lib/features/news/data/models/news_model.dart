import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/news_entity.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends NewsEntity {
  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: '')
  final String content;

  @JsonKey(name: 'urlToImage', defaultValue: '')
  final String imageUrl;

  @JsonKey(defaultValue: '')
  final String author;

  @JsonKey(defaultValue: '')
  final String articleUrl;

  @JsonKey(defaultValue: '')
  final String publishedAt;

  @JsonKey(
    fromJson: _sourceFromJson,
  )
  final String source;

  const NewsModel({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.source,
    required this.publishedAt,
    required this.articleUrl,
  }) : super(
          title: title,
          description: description,
          content: content,
          imageUrl: imageUrl,
          author: author,
          source: source,
          publishedAt: publishedAt,
          articleUrl: articleUrl,
        );

  factory NewsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NewsModelToJson(this);

  static String _sourceFromJson(
    Map<String, dynamic>? source,
  ) {
    return source?['name'] ?? '';
  }
}

