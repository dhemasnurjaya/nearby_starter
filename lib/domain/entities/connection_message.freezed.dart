// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionMessage {

 String get id; DateTime get receivedAt; String get senderId; String get data;
/// Create a copy of ConnectionMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionMessageCopyWith<ConnectionMessage> get copyWith => _$ConnectionMessageCopyWithImpl<ConnectionMessage>(this as ConnectionMessage, _$identity);

  /// Serializes this ConnectionMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receivedAt,senderId,data);

@override
String toString() {
  return 'ConnectionMessage(id: $id, receivedAt: $receivedAt, senderId: $senderId, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConnectionMessageCopyWith<$Res>  {
  factory $ConnectionMessageCopyWith(ConnectionMessage value, $Res Function(ConnectionMessage) _then) = _$ConnectionMessageCopyWithImpl;
@useResult
$Res call({
 String id, DateTime receivedAt, String senderId, String data
});




}
/// @nodoc
class _$ConnectionMessageCopyWithImpl<$Res>
    implements $ConnectionMessageCopyWith<$Res> {
  _$ConnectionMessageCopyWithImpl(this._self, this._then);

  final ConnectionMessage _self;
  final $Res Function(ConnectionMessage) _then;

/// Create a copy of ConnectionMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? receivedAt = null,Object? senderId = null,Object? data = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ConnectionMessage implements ConnectionMessage {
  const _ConnectionMessage({required this.id, required this.receivedAt, required this.senderId, required this.data});
  factory _ConnectionMessage.fromJson(Map<String, dynamic> json) => _$ConnectionMessageFromJson(json);

@override final  String id;
@override final  DateTime receivedAt;
@override final  String senderId;
@override final  String data;

/// Create a copy of ConnectionMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionMessageCopyWith<_ConnectionMessage> get copyWith => __$ConnectionMessageCopyWithImpl<_ConnectionMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receivedAt,senderId,data);

@override
String toString() {
  return 'ConnectionMessage(id: $id, receivedAt: $receivedAt, senderId: $senderId, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ConnectionMessageCopyWith<$Res> implements $ConnectionMessageCopyWith<$Res> {
  factory _$ConnectionMessageCopyWith(_ConnectionMessage value, $Res Function(_ConnectionMessage) _then) = __$ConnectionMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime receivedAt, String senderId, String data
});




}
/// @nodoc
class __$ConnectionMessageCopyWithImpl<$Res>
    implements _$ConnectionMessageCopyWith<$Res> {
  __$ConnectionMessageCopyWithImpl(this._self, this._then);

  final _ConnectionMessage _self;
  final $Res Function(_ConnectionMessage) _then;

/// Create a copy of ConnectionMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? receivedAt = null,Object? senderId = null,Object? data = null,}) {
  return _then(_ConnectionMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
