// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConnectionMessage _$ConnectionMessageFromJson(Map<String, dynamic> json) =>
    _ConnectionMessage(
      id: json['id'] as String,
      receivedAt: DateTime.parse(json['receivedAt'] as String),
      senderId: json['senderId'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$ConnectionMessageToJson(_ConnectionMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receivedAt': instance.receivedAt.toIso8601String(),
      'senderId': instance.senderId,
      'data': instance.data,
    };
