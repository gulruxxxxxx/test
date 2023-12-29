import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc/news_bloc.dart';
import 'news_item.dart';

class NewsListWidget extends StatelessWidget {
  NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.status == LoadingStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == LoadingStatus.loadedWithSuccess) {
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              return NewsItemWidget(news: state.news[index]);
            },
          );
        } else if (state.status == LoadingStatus.loadedWithFailure) {
          return Center(child: Text('Failed to load news'));
        } else {
          return Center(child: Text('No news available'));
        }
      },
    );
  }
}
