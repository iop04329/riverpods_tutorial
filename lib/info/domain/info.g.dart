// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$infoImpl _$$infoImplFromJson(Map<String, dynamic> json) => _$infoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? '',
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$infoImplToJson(_$infoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'date': instance.date,
    };
