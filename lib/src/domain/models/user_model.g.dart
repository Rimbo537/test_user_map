// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'displayName': instance.displayName,
    };
