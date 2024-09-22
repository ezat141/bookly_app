import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> searchBooks(String query) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query);
    result.fold(
      (failure) => emit(SearchFailure(failure.errMessage)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
