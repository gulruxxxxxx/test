import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/news.dart';

part 'news_article.g.dart';

@JsonSerializable(fieldRename: FieldRename.none,createToJson: false)
class NewsArticleModel extends NewsEntity{
  @JsonKey(defaultValue: '')
  final String author;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String url;
  @JsonKey(defaultValue: '')
  final String urlToImage;
  @JsonKey(defaultValue: '')
  final String publishedAt;
  @JsonKey(defaultValue: '')
  final String content;
  NewsArticleModel({
    required this.publishedAt,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  }) : super(
    author: author,
    content: content,
    description: description,
    publishedAt: publishedAt,
    title: title,
    url: url,
    urlToImage: urlToImage,
  );

  factory NewsArticleModel.fromJson(Map<String,dynamic> data) =>
      _$NewsArticleModelFromJson(data);
}