// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserBody _$ResponseUserBodyFromJson(Map<String, dynamic> json) {
  return ResponseUserBody(
    total_count: json['total_count'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => UserBody.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResponseUserBodyToJson(ResponseUserBody instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'items': instance.items,
    };

UserBody _$UserBodyFromJson(Map<String, dynamic> json) {
  return UserBody(
    login: json['login'] as String?,
    id: json['id'] as int?,
    avatar_url: json['avatar_url'] as String?,
  );
}

Map<String, dynamic> _$UserBodyToJson(UserBody instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatar_url,
    };
