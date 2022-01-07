// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseIssuesBody _$ResponseIssuesBodyFromJson(Map<String, dynamic> json) {
  return ResponseIssuesBody(
    total_count: json['total_count'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => IssuesBody.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseIssuesBodyToJson(ResponseIssuesBody instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'items': instance.items,
    };

IssuesBody _$IssuesBodyFromJson(Map<String, dynamic> json) {
  return IssuesBody(
    created_at: json['created_at'] as String?,
    state: json['state'] as String?,
    user: json['user'] == null
        ? null
        : UserBody.fromJson(json['user'] as Map<String, dynamic>),
    title: json['title'] as String?,
    author_association: json['author_association'] as String?,
  );
}

Map<String, dynamic> _$IssuesBodyToJson(IssuesBody instance) =>
    <String, dynamic>{
      'created_at': instance.created_at,
      'state': instance.state,
      'user': instance.user,
      'title': instance.title,
      'author_association': instance.author_association,
    };
