import 'package:flutter/material.dart';
import 'package:news_tdd/features/news/domain/entities/news.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsEntity news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Author: ${news.author}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Title: ${news.title}'),
            Text('Description: ${news.description}'),
            Text('URL: ${news.url}'),
            Text('URL To Image: ${news.urlToImage}'),
            Text('Published At: ${news.publishedAt}'),
            Text('Content: ${news.content}'),
            // Include other information as needed
          ],
        ),
      ),
    );
  }
}
