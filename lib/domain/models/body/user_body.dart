
import 'package:json_annotation/json_annotation.dart';
part 'user_body.g.dart';

@JsonSerializable()
class ResponseUserBody {
  final int? total_count;
  final List<UserBody>? items;

  ResponseUserBody({this.total_count, this.items});

  Map<String, dynamic> toJson() => _$ResponseUserBodyToJson(this);

  factory ResponseUserBody.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserBodyFromJson(json);
}

@JsonSerializable()
class UserBody {
  final String? login;
  final int? id;
  final String? avatar_url;

  UserBody({this.login, this.id, this.avatar_url});

  Map<String, dynamic> toJson() => _$UserBodyToJson(this);

  factory UserBody.fromJson(Map<String, dynamic> json) =>
      _$UserBodyFromJson(json);
}