import "package:freezed_annotation/freezed_annotation.dart";

import "source.dart";

part "article.freezed.dart";
part "article.g.dart";

@freezed
class Article with _$Article {
  const factory Article({
    required String? author,
    required String title,
    required String? description,
    required String url,
    required String? urlToImage,
    required String? content,
    required DateTime publishedAt,
    required Source source,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
