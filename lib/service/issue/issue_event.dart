class IssueEvent {
}

class IssueFetchFromRemote extends IssueEvent {
  final int page;
  final String query;

  IssueFetchFromRemote({required this.page, required this.query});
}

class IssueFetchFromLocal extends IssueEvent {
}