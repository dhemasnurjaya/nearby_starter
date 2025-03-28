import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_connection_status_model.freezed.dart';
part 'nearby_connection_status_model.g.dart';

@freezed
sealed class NearbyConnectionStatusModel with _$NearbyConnectionStatusModel {
  const factory NearbyConnectionStatusModel({
    @JsonKey(name: 'service_name') required String? serviceName,
    @JsonKey(name: 'status_name') required String statusName,
  }) = _NearbyConnectionStatusModel;

  factory NearbyConnectionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyConnectionStatusModelFromJson(json);
}
