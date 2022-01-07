import 'package:github_apps/domain/models/body/repository_body.dart';

class RepositoriesState {
}

class InitialRepositoriesState extends RepositoriesState {
}

class RepositoriesLoading extends RepositoriesState {
}

class RepositoriesLoaded extends RepositoriesState{
    final ResponseRepositoryBody response;
    RepositoriesLoaded(this.response);
}


class RepositoriesNotLoaded extends RepositoriesState{
    final String error;

    RepositoriesNotLoaded(this.error);

}

