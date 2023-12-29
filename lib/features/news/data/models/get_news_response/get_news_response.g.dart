// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNewsResponseModel _$GetNewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetNewsResponseModel(
      status: json['status'] as String? ?? '',
      totalResults: json['totalResults'] as int? ?? 0,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => NewsArticleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
