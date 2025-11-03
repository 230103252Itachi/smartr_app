// lib/models/article.dart
class Article {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? sourceName;
  final String? content;

  Article({
    required this.title,
    required this.url,
    this.author,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.sourceName,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] as String?,
      title: json['title'] ?? '',
      description: json['description'] as String?,
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] != null
          ? DateTime.tryParse(json['publishedAt'])
          : null,
      sourceName: json['source'] != null
          ? json['source']['name'] as String?
          : null,
      content: json['content'] as String?,
    );
  }
}
