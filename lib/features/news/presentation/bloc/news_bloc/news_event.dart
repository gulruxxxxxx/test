part of 'news_bloc.dart';

abstract class NewsEvent {}

class NewsStarted extends NewsEvent {
final ValueChanged<String> onFailure;
NewsStarted({required this.onFailure});
}
