// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultCategoryModel _$DefaultCategoryModelFromJson(
        Map<String, dynamic> json) =>
    DefaultCategoryModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => DefaultCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DefaultCategoryModelToJson(
        DefaultCategoryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'category': instance.category,
    };

DefaultCategory _$DefaultCategoryFromJson(Map<String, dynamic> json) =>
    DefaultCategory(
      id: (json['id'] as num?)?.toInt(),
      isactive: json['isactive'] as bool?,
      engTitle: json['eng_title'] as String?,
      arbTitle: json['arb_title'] as String?,
      image: json['image'] as String?,
      productscount: (json['productscount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DefaultCategoryToJson(DefaultCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isactive': instance.isactive,
      'eng_title': instance.engTitle,
      'arb_title': instance.arbTitle,
      'image': instance.image,
      'productscount': instance.productscount,
    };
