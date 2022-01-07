// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseRepositoryBody _$ResponseRepositoryBodyFromJson(
    Map<String, dynamic> json) {
  return ResponseRepositoryBody(
    total_count: json['total_count'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => RepositoryBody.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseRepositoryBodyToJson(
        ResponseRepositoryBody instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'items': instance.items,
    };

RepositoryBody _$RepositoryBodyFromJson(Map<String, dynamic> json) {
  return RepositoryBody(
    name: json['name'] as String?,
    full_name: json['full_name'] as String?,
    owner: json['owner'] == null
        ? null
        : UserBody.fromJson(json['owner'] as Map<String, dynamic>),
    watchers_count: json['watchers_count'] as int?,
    stargazers_count: json['stargazers_count'] as int?,
    created_at: json['created_at'] as String?,
    forks_count: json['forks_count'] as int?,
  );
}

Map<String, dynamic> _$RepositoryBodyToJson(RepositoryBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.full_name,
      'owner': instance.owner,
      'watchers_count': instance.watchers_count,
      'stargazers_count': instance.stargazers_count,
      'forks_count': instance.forks_count,
      'created_at': instance.created_at,
    };
