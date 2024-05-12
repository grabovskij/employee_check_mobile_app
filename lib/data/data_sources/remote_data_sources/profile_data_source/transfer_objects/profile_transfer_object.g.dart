// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_transfer_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileTransferObjectImpl _$$ProfileTransferObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileTransferObjectImpl(
      id: json['user_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      secondName: json['second_name'] as String? ?? '',
      isAdmin: json['is_admin'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProfileTransferObjectImplToJson(
        _$ProfileTransferObjectImpl instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'email': instance.email,
      'photo': instance.photo,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'second_name': instance.secondName,
      'is_admin': instance.isAdmin,
    };
