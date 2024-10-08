// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorymodel _$CategorymodelFromJson(Map<String, dynamic> json) =>
    Categorymodel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      allcategory: (json['allcategory'] as List<dynamic>?)
          ?.map((e) => Allcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategorymodelToJson(Categorymodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'allcategory': instance.allcategory,
    };

Allcategory _$AllcategoryFromJson(Map<String, dynamic> json) => Allcategory(
      id: (json['id'] as num?)?.toInt(),
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AllcategoryToJson(Allcategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
    };
