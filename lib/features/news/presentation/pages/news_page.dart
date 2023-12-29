import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/news_bloc/news_bloc.dart';
import '../widgets/news_item.dart';
import '../widgets/news_list_widget.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          switch (state.status) {
            case LoadingStatus.pure:
              context.read<NewsBloc>().add(NewsStarted(
                onFailure:(message){
                  setState(() {
                    errorMessage = message;
                  });
                }
              ));
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case LoadingStatus.loadedWithSuccess:
              return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  return NewsItemWidget(news: state.news[index]);
                },
              );
            case LoadingStatus.loadedWithFailure:
              return Center(child: Text('Failed to load news'));
            default:
              return Center(child: Text('No news available'));
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(NewsStarted(onFailure: (String value) {  }));
  }
}
