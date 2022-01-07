import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_apps/repository/remote/github_repository.dart';

import 'bloc.dart';

class RepositoriesBloc extends  Bloc<RepositoriesEvent, RepositoriesState> {
  final GithubRepository repository;

  RepositoriesBloc({required this.repository}) : super(InitialRepositoriesState()) {
    on<RepositoriesFetchFromRemote>((event, emit) => _onEvent(event, emit));
  }

  FutureOr<void> _onEvent(RepositoriesEvent event, Emitter<RepositoriesState> state) async {
    if (event is RepositoriesFetchFromRemote) {
      emit(RepositoriesLoading());
      try {
        final response = await repository.getRepositoriesData(event.page, event.query);
        emit(RepositoriesLoaded(response));
      } catch (e) {
        emit(RepositoriesNotLoaded(e.toString()));
      }
    }
  }

}