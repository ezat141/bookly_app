part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure(this.errMessage);
}

class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess(this.books);

  @override
  List<Object> get props => [books];
}
