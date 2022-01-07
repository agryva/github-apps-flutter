import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_apps/repository/remote/github_repository.dart';

import 'bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GithubRepository repository;

  UserBloc({required this.repository}) : super(InitialUserState()) {
    on<UserFetchFromRemote>((event, emit) => _onEvent(event, emit), transformer: sequential());
  }

  FutureOr<void> _onEvent(UserEvent event, Emitter<UserState> state) async {
    if (event is UserFetchFromRemote) {
      emit(UserLoading());
      try {
        final response = await repository.getUserData(event.page, event.query);
        emit(UserLoaded(response));
      } catch (e) {
        emit(UserNotLoaded(e.toString()));
      }
    }
  }
}
