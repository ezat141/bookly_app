import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/api.service.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import '../../../data/repos/search_repo_impl.dart';
import '../../manager/search_cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (query) {
                  // You can handle real-time search if needed
                },
                onSubmitted: (query) {
                  BlocProvider.of<SearchCubit>(context).searchBooks(query);
                },
                decoration: const InputDecoration(
                  hintText: 'Enter book title...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const CustomLoadingIndicator();
                    } else if (state is SearchFailure) {
                      return CustomErrorWidget(errMessage: state.errMessage);
                    } else if (state is SearchSuccess) {
                      return ListView.builder(
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: BookListViewItemSearch(
                              bookModel: state.books[index],
                            ),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key, required this.books});
//   final List<BookModel> books;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       itemCount: books.length,
//       itemBuilder: (context, index) {
//         return  Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Text(books[index].volumeInfo.title!),
//         );
//       },
//     );
//   }
// }
