// lib/screens/article_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/article.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailScreen({super.key, required this.article});

  String _formatDate(DateTime? dt) {
    if (dt == null) return '';
    return DateFormat.yMMMMd().add_jm().format(dt.toLocal());
  }

  Future<void> _openUrl(BuildContext ctx) async {
    try {
      String rawUrl = article.url.trim();

      // Убираем возможные обратные слэши и пробелы
      rawUrl = rawUrl.replaceAll(r'\', '');

      // Проверяем, начинается ли ссылка с http/https
      if (!rawUrl.startsWith('http')) {
        rawUrl = 'https://$rawUrl';
      }

      final uri = Uri.tryParse(rawUrl);

      if (uri == null || !uri.hasAbsolutePath) {
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(const SnackBar(content: Text('Invalid URL')));
        return;
      }

      // Пробуем открыть встроенным браузером
      bool launched = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);

      // Если не сработало — пробуем внешним
      if (!launched) {
        launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      }

      if (!launched) {
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        ctx,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Article'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (article.urlToImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage!,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (c, s) =>
                    Container(height: 220, color: Colors.grey[800]),
                errorWidget: (c, u, e) =>
                    Container(height: 220, color: Colors.grey[800]),
              ),
            ),
          const SizedBox(height: 12),
          Text(
            article.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                article.sourceName ?? '',
                style: TextStyle(color: Colors.grey[400]),
              ),
              const SizedBox(width: 10),
              Text(
                _formatDate(article.publishedAt),
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            article.description ?? article.content ?? '',
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _openUrl(context),
            child: const Text('Read original'),
          ),
        ],
      ),
    );
  }
}
