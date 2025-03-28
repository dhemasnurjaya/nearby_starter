// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyConnectionModel _$NearbyConnectionModelFromJson(
  Map<String, dynamic> json,
) => _NearbyConnectionModel(
  id: json['id'] as String,
  name: json['name'] as String,
  status:
      $enumDecodeNullable(_$ConnectionStatusEnumMap, json['status']) ??
      ConnectionStatus.disconnected,
  broadcasting: json['broadcasting'] as bool? ?? false,
);

Map<String, dynamic> _$NearbyConnectionModelToJson(
  _NearbyConnectionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': _$ConnectionStatusEnumMap[instance.status]!,
  'broadcasting': instance.broadcasting,
};

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.connecting: 'connecting',
  ConnectionStatus.connected: 'connected',
  ConnectionStatus.disconnected: 'disconnected',
};
