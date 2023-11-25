import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/core/utils/api.service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  serviceLocator.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(
    serviceLocator.get<ApiService>(),
  ));
}