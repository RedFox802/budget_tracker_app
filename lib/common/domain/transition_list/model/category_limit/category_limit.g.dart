// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_limit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryLimit _$$_CategoryLimitFromJson(Map<String, dynamic> json) =>
    _$_CategoryLimit(
      installationDate: DateTime.parse(json['installationDate'] as String),
      limit: json['limit'] as num,
    );

Map<String, dynamic> _$$_CategoryLimitToJson(_$_CategoryLimit instance) =>
    <String, dynamic>{
      'installationDate': instance.installationDate.toIso8601String(),
      'limit': instance.limit,
    };
