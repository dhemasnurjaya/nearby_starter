// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_connection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyConnectionModel {

/// The ID of the device.
 String get id;/// The name of the device.
 String get name;/// Indicates if the device is connected or not.
 ConnectionStatus get status;/// Indicates that the device is broadcasting its presence.
/// This is used for server connections.
 bool get broadcasting;
/// Create a copy of NearbyConnectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyConnectionModelCopyWith<NearbyConnectionModel> get copyWith => _$NearbyConnectionModelCopyWithImpl<NearbyConnectionModel>(this as NearbyConnectionModel, _$identity);

  /// Serializes this NearbyConnectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyConnectionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.broadcasting, broadcasting) || other.broadcasting == broadcasting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,broadcasting);



}

/// @nodoc
abstract mixin class $NearbyConnectionModelCopyWith<$Res>  {
  factory $NearbyConnectionModelCopyWith(NearbyConnectionModel value, $Res Function(NearbyConnectionModel) _then) = _$NearbyConnectionModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, ConnectionStatus status, bool broadcasting
});




}
/// @nodoc
class _$NearbyConnectionModelCopyWithImpl<$Res>
    implements $NearbyConnectionModelCopyWith<$Res> {
  _$NearbyConnectionModelCopyWithImpl(this._self, this._then);

  final NearbyConnectionModel _self;
  final $Res Function(NearbyConnectionModel) _then;

/// Create a copy of NearbyConnectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? broadcasting = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConnectionStatus,broadcasting: null == broadcasting ? _self.broadcasting : broadcasting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NearbyConnectionModel implements NearbyConnectionModel {
  const _NearbyConnectionModel({required this.id, required this.name, this.status = ConnectionStatus.disconnected, this.broadcasting = false});
  factory _NearbyConnectionModel.fromJson(Map<String, dynamic> json) => _$NearbyConnectionModelFromJson(json);

/// The ID of the device.
@override final  String id;
/// The name of the device.
@override final  String name;
/// Indicates if the device is connected or not.
@override@JsonKey() final  ConnectionStatus status;
/// Indicates that the device is broadcasting its presence.
/// This is used for server connections.
@override@JsonKey() final  bool broadcasting;

/// Create a copy of NearbyConnectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyConnectionModelCopyWith<_NearbyConnectionModel> get copyWith => __$NearbyConnectionModelCopyWithImpl<_NearbyConnectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyConnectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyConnectionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.broadcasting, broadcasting) || other.broadcasting == broadcasting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,status,broadcasting);



}

/// @nodoc
abstract mixin class _$NearbyConnectionModelCopyWith<$Res> implements $NearbyConnectionModelCopyWith<$Res> {
  factory _$NearbyConnectionModelCopyWith(_NearbyConnectionModel value, $Res Function(_NearbyConnectionModel) _then) = __$NearbyConnectionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ConnectionStatus status, bool broadcasting
});




}
/// @nodoc
class __$NearbyConnectionModelCopyWithImpl<$Res>
    implements _$NearbyConnectionModelCopyWith<$Res> {
  __$NearbyConnectionModelCopyWithImpl(this._self, this._then);

  final _NearbyConnectionModel _self;
  final $Res Function(_NearbyConnectionModel) _then;

/// Create a copy of NearbyConnectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? broadcasting = null,}) {
  return _then(_NearbyConnectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ConnectionStatus,broadcasting: null == broadcasting ? _self.broadcasting : broadcasting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
