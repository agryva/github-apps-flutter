import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_apps/di/inject_container.dart';
import 'package:github_apps/repository/remote/config/api_constant.dart';
import 'package:github_apps/service/display/change_display.dart';
import 'package:github_apps/service/repositories/bloc.dart';
import 'package:github_apps/service/search/search_bloc.dart';
import 'package:github_apps/service/tabbar/tab_bar_cubit.dart';
import 'package:github_apps/service/user/bloc.dart';
import 'package:github_apps/view/home/home_page.dart';
import 'package:github_apps/view/utils/observer.dart';
import 'package:github_apps/view/utils/ui_lib.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'service/issue/bloc.dart';

void main() async {
  BlocOverrides.runZoned(() async {
          WidgetsFlutterBinding.ensureInitialized();
          await init(ApiConstant.baseUrl);
          runApp(const MyApp());
    },
    blocObserver: GithubBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_En', null);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => inject<TabBarCubit>(),
        ),
        BlocProvider(
          create: (context) => inject<UserBloc>(),
        ),
        BlocProvider(
          create: (context) => inject<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => inject<RepositoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => inject<IssueBloc>(),
        ),
        BlocProvider(
          create: (context) => inject<ChangeDisplay>(),
        ),
      ],
      child: MaterialApp(
        title: 'Github Apps',
        theme: ThemeData(
          primaryColor: UiLib.colorPrimary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.transparent,
        ),
        home: const HomePage(),
      ),
    );
  }
}
