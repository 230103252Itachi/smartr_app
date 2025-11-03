// lib/providers/news_provider.dart
import 'package:flutter/foundation.dart';
import '../models/article.dart';
import '../services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _service = NewsService();
  List<Article> _articles = [];
  bool _loading = false;
  String? _error;

  List<Article> get articles => _articles;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadTopHeadlines({String country = 'us'}) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final res = await _service.fetchTopHeadlines(country: country);
      _articles = res;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadTopHeadlines();
  }

  Future<void> search(String query) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final res = await _service.searchNews(query);
      _articles = res;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
