// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportTOImpl _$$ReportTOImplFromJson(Map<String, dynamic> json) =>
    _$ReportTOImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      isEnter: json['isEnter'] as bool? ?? true,
      photo: json['photo'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
    );

Map<String, dynamic> _$$ReportTOImplToJson(_$ReportTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'isEnter': instance.isEnter,
      'photo': instance.photo,
      'user_id': instance.userId,
    };
