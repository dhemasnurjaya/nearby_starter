// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_connection_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyConnectionStatusModel {

@JsonKey(name: 'service_name') String? get serviceName;@JsonKey(name: 'status_name') String get statusName;
/// Create a copy of NearbyConnectionStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyConnectionStatusModelCopyWith<NearbyConnectionStatusModel> get copyWith => _$NearbyConnectionStatusModelCopyWithImpl<NearbyConnectionStatusModel>(this as NearbyConnectionStatusModel, _$identity);

  /// Serializes this NearbyConnectionStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyConnectionStatusModel&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.statusName, statusName) || other.statusName == statusName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceName,statusName);

@override
String toString() {
  return 'NearbyConnectionStatusModel(serviceName: $serviceName, statusName: $statusName)';
}


}

/// @nodoc
abstract mixin class $NearbyConnectionStatusModelCopyWith<$Res>  {
  factory $NearbyConnectionStatusModelCopyWith(NearbyConnectionStatusModel value, $Res Function(NearbyConnectionStatusModel) _then) = _$NearbyConnectionStatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'service_name') String? serviceName,@JsonKey(name: 'status_name') String statusName
});




}
/// @nodoc
class _$NearbyConnectionStatusModelCopyWithImpl<$Res>
    implements $NearbyConnectionStatusModelCopyWith<$Res> {
  _$NearbyConnectionStatusModelCopyWithImpl(this._self, this._then);

  final NearbyConnectionStatusModel _self;
  final $Res Function(NearbyConnectionStatusModel) _then;

/// Create a copy of NearbyConnectionStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceName = freezed,Object? statusName = null,}) {
  return _then(_self.copyWith(
serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,statusName: null == statusName ? _self.statusName : statusName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NearbyConnectionStatusModel implements NearbyConnectionStatusModel {
  const _NearbyConnectionStatusModel({@JsonKey(name: 'service_name') required this.serviceName, @JsonKey(name: 'status_name') required this.statusName});
  factory _NearbyConnectionStatusModel.fromJson(Map<String, dynamic> json) => _$NearbyConnectionStatusModelFromJson(json);

@override@JsonKey(name: 'service_name') final  String? serviceName;
@override@JsonKey(name: 'status_name') final  String statusName;

/// Create a copy of NearbyConnectionStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyConnectionStatusModelCopyWith<_NearbyConnectionStatusModel> get copyWith => __$NearbyConnectionStatusModelCopyWithImpl<_NearbyConnectionStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyConnectionStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyConnectionStatusModel&&(identical(other.serviceName, serviceName) || other.serviceName == serviceName)&&(identical(other.statusName, statusName) || other.statusName == statusName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceName,statusName);

@override
String toString() {
  return 'NearbyConnectionStatusModel(serviceName: $serviceName, statusName: $statusName)';
}


}

/// @nodoc
abstract mixin class _$NearbyConnectionStatusModelCopyWith<$Res> implements $NearbyConnectionStatusModelCopyWith<$Res> {
  factory _$NearbyConnectionStatusModelCopyWith(_NearbyConnectionStatusModel value, $Res Function(_NearbyConnectionStatusModel) _then) = __$NearbyConnectionStatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'service_name') String? serviceName,@JsonKey(name: 'status_name') String statusName
});




}
/// @nodoc
class __$NearbyConnectionStatusModelCopyWithImpl<$Res>
    implements _$NearbyConnectionStatusModelCopyWith<$Res> {
  __$NearbyConnectionStatusModelCopyWithImpl(this._self, this._then);

  final _NearbyConnectionStatusModel _self;
  final $Res Function(_NearbyConnectionStatusModel) _then;

/// Create a copy of NearbyConnectionStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceName = freezed,Object? statusName = null,}) {
  return _then(_NearbyConnectionStatusModel(
serviceName: freezed == serviceName ? _self.serviceName : serviceName // ignore: cast_nullable_to_non_nullable
as String?,statusName: null == statusName ? _self.statusName : statusName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
