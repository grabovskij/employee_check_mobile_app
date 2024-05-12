// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_transfer_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportTOImpl _$$ReportTOImplFromJson(Map<String, dynamic> json) =>
    _$ReportTOImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      isEnter: json['enter'] as bool? ?? true,
      photo: json['photo'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ReportTOImplToJson(_$ReportTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'enter': instance.isEnter,
      'photo': instance.photo,
      'user_id': instance.userId,
      'lat': instance.lat,
      'lon': instance.lon,
    };
