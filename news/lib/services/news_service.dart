// lib/services/news_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import '../.env.dart';

class NewsService {
  static const String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlines({
    String country = 'us',
    String? category,
  }) async {
    final Map<String, String> params = {
      'apiKey': NEWS_API_KEY,
      'country': country,
      'pageSize': '50',
    };
    if (category != null) params['category'] = category;

    final uri = Uri.parse(
      '$_baseUrl/top-headlines',
    ).replace(queryParameters: params);
    final res = await http.get(uri);

    if (res.statusCode != 200) {
      throw Exception('Failed to load news: ${res.statusCode}');
    }
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final articles = (data['articles'] as List<dynamic>?)
        ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList();
    return articles ?? [];
  }

  Future<List<Article>> searchNews(String query) async {
    final uri = Uri.parse('$_baseUrl/everything').replace(
      queryParameters: {'apiKey': NEWS_API_KEY, 'q': query, 'pageSize': '50'},
    );
    final res = await http.get(uri);
    if (res.statusCode != 200) {
      throw Exception('Search failed: ${res.statusCode}');
    }
    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final articles = (data['articles'] as List<dynamic>?)
        ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
        .toList();
    return articles ?? [];
  }
}
