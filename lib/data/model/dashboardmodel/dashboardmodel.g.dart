// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboardmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboardmodel _$DashboardmodelFromJson(Map<String, dynamic> json) =>
    Dashboardmodel(
      status: json['status'] as bool?,
      totalproduct: (json['totalproduct'] as num?)?.toInt(),
      totalcategory: (json['totalcategory'] as num?)?.toInt(),
      totalorder: (json['totalorder'] as num?)?.toInt(),
      activeorder: (json['activeorder'] as num?)?.toInt(),
      completeorder: (json['completeorder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardmodelToJson(Dashboardmodel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalproduct': instance.totalproduct,
      'totalcategory': instance.totalcategory,
      'totalorder': instance.totalorder,
      'activeorder': instance.activeorder,
      'completeorder': instance.completeorder,
    };
