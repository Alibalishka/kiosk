import 'package:bloc/bloc.dart';
import 'package:qr_pay_app/src/features/search/logic/models/response/search_model.dart';
import 'package:qr_pay_app/src/features/search/logic/repository/search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  SearchBloc({required final SearchRepository searchRepository})
      : _searchRepository = searchRepository,
        super(const _Initial()) {
    on<SearchEvent>(
      (event, emit) => event.map(
        started: (event) => _fetchSearch(event, emit),
      ),
    );
  }

  Future<void> _fetchSearch(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(const SearchState.initial());
      final result =
          await _searchRepository.searchRequest(keyword: event.keyword);
      result.when(success: (response) {
        emit(SearchState.success(searchModel: response));
      }, failure: (error) {
        emit(SearchState.error(message: error.msg ?? 'Ошибка загурзки данных'));
      });
    } on Object {
      emit(const SearchState.error());
      rethrow;
    }
  }
}
