class UserEvent {
}

class UserFetchFromRemote extends UserEvent {
  final String query;
  final int page;

  UserFetchFromRemote({required this.page, required this.query});

  @override
  String toString() {
    print("page $page query $query");
    return super.toString();
  }
}

class UserFetchFromLocal extends UserEvent {
}