import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/features/home/logic/models/responses/news_model.dart';
import 'package:qr_pay_app/src/features/home/logic/repository/home_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final HomeRepository _homeRepository;
  NewsBloc({required final HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const _Loading()) {
    on<NewsEvent>((event, emit) => event.map(
          fetchNews: (event) => _fetchNews(event, emit),
        ));
  }

  Future<void> _fetchNews(
    NewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.loading());
    try {
      final result = await _homeRepository.fetchNews();
      result.when(
          success: (response) => emit(NewsState.success(newsModel: response)),
          failure: (error) => emit(NewsState.failed(
              message: error.msg ?? 'Ошибка загурзки данных')));
    } on Object {
      emit(const NewsState.failed());
    }
  }
}
