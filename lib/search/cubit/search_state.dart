
part of 'search_cubit.dart';

enum SearchStatus { initial, success, timeout, failure }


class SearchState extends Equatable {

  final FullWord? fullWord;
  final String? searchField;
  final SearchStatus searchStatus;

  const SearchState( {
    this.fullWord,
    this.searchField,
    this.searchStatus = SearchStatus.initial,
  });

  SearchState copyWith({
    SearchStatus? searchStatus,
    FullWord? fullWord,
    String? searchField,
  }) => SearchState(
    fullWord: fullWord,
    searchStatus: searchStatus ?? this.searchStatus,

    searchField: searchField ?? this.searchField,
  );

  @override
  List<Object?> get props => [];
}