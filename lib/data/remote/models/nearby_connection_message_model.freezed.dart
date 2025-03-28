// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_connection_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyConnectionMessageModel {

@JsonKey(name: 'message_id') String get id;@JsonKey(name: 'sender_id') String get senderId; String get data;@JsonKey(name: 'received_at') DateTime get receivedAt;
/// Create a copy of NearbyConnectionMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyConnectionMessageModelCopyWith<NearbyConnectionMessageModel> get copyWith => _$NearbyConnectionMessageModelCopyWithImpl<NearbyConnectionMessageModel>(this as NearbyConnectionMessageModel, _$identity);

  /// Serializes this NearbyConnectionMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyConnectionMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.data, data) || other.data == data)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,data,receivedAt);

@override
String toString() {
  return 'NearbyConnectionMessageModel(id: $id, senderId: $senderId, data: $data, receivedAt: $receivedAt)';
}


}

/// @nodoc
abstract mixin class $NearbyConnectionMessageModelCopyWith<$Res>  {
  factory $NearbyConnectionMessageModelCopyWith(NearbyConnectionMessageModel value, $Res Function(NearbyConnectionMessageModel) _then) = _$NearbyConnectionMessageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'message_id') String id,@JsonKey(name: 'sender_id') String senderId, String data,@JsonKey(name: 'received_at') DateTime receivedAt
});




}
/// @nodoc
class _$NearbyConnectionMessageModelCopyWithImpl<$Res>
    implements $NearbyConnectionMessageModelCopyWith<$Res> {
  _$NearbyConnectionMessageModelCopyWithImpl(this._self, this._then);

  final NearbyConnectionMessageModel _self;
  final $Res Function(NearbyConnectionMessageModel) _then;

/// Create a copy of NearbyConnectionMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderId = null,Object? data = null,Object? receivedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NearbyConnectionMessageModel implements NearbyConnectionMessageModel {
  const _NearbyConnectionMessageModel({@JsonKey(name: 'message_id') required this.id, @JsonKey(name: 'sender_id') required this.senderId, required this.data, @JsonKey(name: 'received_at') required this.receivedAt});
  factory _NearbyConnectionMessageModel.fromJson(Map<String, dynamic> json) => _$NearbyConnectionMessageModelFromJson(json);

@override@JsonKey(name: 'message_id') final  String id;
@override@JsonKey(name: 'sender_id') final  String senderId;
@override final  String data;
@override@JsonKey(name: 'received_at') final  DateTime receivedAt;

/// Create a copy of NearbyConnectionMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyConnectionMessageModelCopyWith<_NearbyConnectionMessageModel> get copyWith => __$NearbyConnectionMessageModelCopyWithImpl<_NearbyConnectionMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyConnectionMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyConnectionMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.data, data) || other.data == data)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,data,receivedAt);

@override
String toString() {
  return 'NearbyConnectionMessageModel(id: $id, senderId: $senderId, data: $data, receivedAt: $receivedAt)';
}


}

/// @nodoc
abstract mixin class _$NearbyConnectionMessageModelCopyWith<$Res> implements $NearbyConnectionMessageModelCopyWith<$Res> {
  factory _$NearbyConnectionMessageModelCopyWith(_NearbyConnectionMessageModel value, $Res Function(_NearbyConnectionMessageModel) _then) = __$NearbyConnectionMessageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'message_id') String id,@JsonKey(name: 'sender_id') String senderId, String data,@JsonKey(name: 'received_at') DateTime receivedAt
});




}
/// @nodoc
class __$NearbyConnectionMessageModelCopyWithImpl<$Res>
    implements _$NearbyConnectionMessageModelCopyWith<$Res> {
  __$NearbyConnectionMessageModelCopyWithImpl(this._self, this._then);

  final _NearbyConnectionMessageModel _self;
  final $Res Function(_NearbyConnectionMessageModel) _then;

/// Create a copy of NearbyConnectionMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderId = null,Object? data = null,Object? receivedAt = null,}) {
  return _then(_NearbyConnectionMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
