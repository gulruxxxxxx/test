import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_tdd/core/failure/failure.dart';

import 'package:news_tdd/features/news/data/repository/news.dart';

import 'package:flutter/foundation.dart';

import '../../../../../core/use_cases/usecase.dart';
import '../../../domain/entities/news.dart';
import '../../../domain/use_cases/get_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState.empty()) {
    on<NewsStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final usecase = await GetNewsUseCase(NewsRepositoryImpl()).call(NoParams());

      usecase.either(
            (failure) {
          emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
          event.onFailure((failure as ServerFailure).failureMessage);
        },
            (news) {
          emit(state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            news: news,
          ));
        },
      );
    });
  }
}
// class NewsBloc extends Bloc<NewsEvent, NewsState> {
//   NewsBloc() : super(NewsState.empty()) {
    // on<NewsStarted>((event, emit) async {
    //   emit(state.copyWith(status: LoadingStatus.loading));
    //
    //   try {
    //     final usecase = await GetNewsUseCase(NewsRepositoryImpl()).call(NoParams());
    //
    //     if (state.status == LoadingStatus.loading) {
    //       usecase.either(
    //             (failure) {
    //           if (state.status == LoadingStatus.loading) {
    //             emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
    //           }
    //         },
    //             (news) {
    //           if (state.status == LoadingStatus.loading) {
    //             emit(state.copyWith(
    //               status: LoadingStatus.loadedWithSuccess,
    //               news: news,
    //             ));
    //           }
    //         },
    //       );
    //     }
    //   } catch (e) {
    //     // Handle other exceptions if needed
    //   }
    // });
//     on<NewsStarted>((event, emit) async {
//       emit(state.copyWith(status: LoadingStatus.loading));
//
//       try {
//         final usecase = await GetNewsUseCase(NewsRepositoryImpl()).call(NoParams());
//         usecase.either(
//               (failure) {
//             emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
//           },
//               (news) {
//             emit(state.copyWith(
//               status: LoadingStatus.loadedWithSuccess,
//               news: news,
//             ));
//           },
//         );
//       } catch (error) {
//         // Handle other errors if needed
//         emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
//       }
//     });
//
//   }
// }
