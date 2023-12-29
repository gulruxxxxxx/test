import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:news_tdd/core/exception/exception.dart';
import 'package:news_tdd/features/news/data/data_source/news_remote.dart';
import 'package:news_tdd/features/news/data/models/get_news_response/get_news_response.dart';

void main(){

  final dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2'));

  final dioAdapter = DioAdapter(dio: dio);
  late NewsRemoteDataSource systemUnderTest;

  setUp((){
    systemUnderTest = NewsRemoteDataSource(dioAdapter.dio);
  });

  test(
    "returning model when the info from server comes with status 200",
      ()async{
      dioAdapter.onGet(
          '/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5',
              (server) => server.reply(200, {'message' : 'Success!',},
                delay: const Duration(seconds :1 ),
              ),
      );
      final response = await systemUnderTest.getNews();
      expect(response, isA<GetNewsResponseModel>());
    }
  );
  test(
      "returning ServerException when the info from server comes with status 400",
          ()async{
        dioAdapter.onGet(
          '/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5',
              (server) => server.reply(200, {'message' : 'Failure',},
            delay: const Duration(seconds :1 ),
          ),
        );
        final response = await systemUnderTest.getNews();
        expect(response, throwsA(response));
      }
  );
}