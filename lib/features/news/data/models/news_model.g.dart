// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  content: json['content'] as String? ?? '',
  imageUrl: json['urlToImage'] as String? ?? '',
  author: json['author'] as String? ?? '',
  source: NewsModel._sourceFromJson(json['source'] as Map<String, dynamic>?),
  publishedAt: json['publishedAt'] as String? ?? '',
  articleUrl: json['articleUrl'] as String? ?? '',
);

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'content': instance.content,
  'urlToImage': instance.imageUrl,
  'author': instance.author,
  'articleUrl': instance.articleUrl,
  'publishedAt': instance.publishedAt,
  'source': instance.source,
};
