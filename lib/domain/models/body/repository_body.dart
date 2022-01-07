

import 'package:github_apps/domain/models/body/user_body.dart';
import 'package:json_annotation/json_annotation.dart';
part 'repository_body.g.dart';

@JsonSerializable()
class ResponseRepositoryBody {
  final int? total_count;
  final List<RepositoryBody>? items;

  ResponseRepositoryBody({this.total_count, this.items});

  Map<String, dynamic> toJson() => _$ResponseRepositoryBodyToJson(this);

  factory ResponseRepositoryBody.fromJson(Map<String, dynamic> json) =>
      _$ResponseRepositoryBodyFromJson(json);
}

@JsonSerializable()
class RepositoryBody {
  final String? name;
  final String? full_name;
  final UserBody? owner;
  final int? watchers_count;
  final int? stargazers_count;
  final int? forks_count;
  final String? created_at;

  RepositoryBody(
      {this.name,
      this.full_name,
      this.owner,
      this.watchers_count,
      this.stargazers_count,
      this.created_at,
      this.forks_count});

  Map<String, dynamic> toJson() => _$RepositoryBodyToJson(this);

  factory RepositoryBody.fromJson(Map<String, dynamic> json) =>
      _$RepositoryBodyFromJson(json);

}

