import 'package:bookly_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/api.service.dart';
import '../../data/repos/search_repo_impl.dart';
import '../manager/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
        child:  SearchViewBody(),
      ),
    );
  }
}
