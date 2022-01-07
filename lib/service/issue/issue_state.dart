import 'package:github_apps/domain/models/body/issues_body.dart';

class IssueState {
}

class InitialIssueState extends IssueState {
}

class IssueLoading extends IssueState {
}

class IssueLoaded extends IssueState{
  final ResponseIssuesBody response;

  IssueLoaded(this.response);
}


class IssueNotLoaded extends IssueState{
    final String error;

    IssueNotLoaded(this.error);

}

