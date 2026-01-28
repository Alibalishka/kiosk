part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
    const factory SearchState.success({required SearchModel searchModel}) =
      _Success;
  const factory SearchState.error(
      {@Default('Произошла ошибка') String message}) = _Error;
}
