// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginmodel _$LoginmodelFromJson(Map<String, dynamic> json) => Loginmodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginmodelToJson(Loginmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };
