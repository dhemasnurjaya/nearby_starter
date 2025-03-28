// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_connection_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyConnectionStatusModel _$NearbyConnectionStatusModelFromJson(
  Map<String, dynamic> json,
) => _NearbyConnectionStatusModel(
  serviceName: json['service_name'] as String?,
  statusName: json['status_name'] as String,
);

Map<String, dynamic> _$NearbyConnectionStatusModelToJson(
  _NearbyConnectionStatusModel instance,
) => <String, dynamic>{
  'service_name': instance.serviceName,
  'status_name': instance.statusName,
};
