import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String author;
  final String publishedAt;
  final String source;
  final String articleUrl;


  const NewsEntity({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishedAt,
    required this.source,
    required this.articleUrl,

  });


  @override
  List<Object?> get props => [
    title ,
    description,
    content,
    imageUrl,
    author,
    publishedAt,
    source,
    articleUrl,
  ];
}
