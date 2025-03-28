// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_connection_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyConnectionMessageModel _$NearbyConnectionMessageModelFromJson(
  Map<String, dynamic> json,
) => _NearbyConnectionMessageModel(
  id: json['message_id'] as String,
  senderId: json['sender_id'] as String,
  data: json['data'] as String,
  receivedAt: DateTime.parse(json['received_at'] as String),
);

Map<String, dynamic> _$NearbyConnectionMessageModelToJson(
  _NearbyConnectionMessageModel instance,
) => <String, dynamic>{
  'message_id': instance.id,
  'sender_id': instance.senderId,
  'data': instance.data,
  'received_at': instance.receivedAt.toIso8601String(),
};
