
import 'package:get_it/get_it.dart';
import 'package:github_apps/repository/remote/dio_client.dart';
import 'package:github_apps/repository/remote/github_repository.dart';
import 'package:github_apps/service/display/change_display.dart';
import 'package:github_apps/service/issue/bloc.dart';
import 'package:github_apps/service/repositories/bloc.dart';
import 'package:github_apps/service/search/search_bloc.dart';
import 'package:github_apps/service/tabbar/tab_bar_cubit.dart';
import 'package:github_apps/service/user/bloc.dart';

final inject = GetIt.instance;

Future<void> init(String baseUrl) async {
  //BLOC
  inject.registerLazySingleton(() => TabBarCubit());
  inject.registerLazySingleton(() => UserBloc(repository: inject()));
  inject.registerLazySingleton(() => RepositoriesBloc(repository: inject()));
  inject.registerLazySingleton(() => IssueBloc(repository: inject()));
  inject.registerLazySingleton(() => ChangeDisplay());
  inject.registerLazySingleton(() => SearchBloc());

  //Remote
  inject.registerLazySingleton(() => DioClient(baseUrl));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => GithubRepository(inject()));
}