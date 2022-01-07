class RepositoriesEvent {
}

class RepositoriesFetchFromRemote extends RepositoriesEvent {
  final int page;
  final String query;

  RepositoriesFetchFromRemote({required this.page,required  this.query});
}

class RepositoriesFetchFromLocal extends RepositoriesEvent {
}