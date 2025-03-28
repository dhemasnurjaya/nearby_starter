import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_starter/enums.dart';

part 'nearby_connection_model.freezed.dart';
part 'nearby_connection_model.g.dart';

@freezed
sealed class NearbyConnectionModel with _$NearbyConnectionModel {
  const factory NearbyConnectionModel({
    /// The ID of the device.
    required String id,

    /// The name of the device.
    required String name,

    /// Indicates if the device is connected or not.
    @Default(ConnectionStatus.disconnected) ConnectionStatus status,

    /// Indicates that the device is broadcasting its presence.
    /// This is used for server connections.
    @Default(false) bool broadcasting,
  }) = _NearbyConnectionModel;

  factory NearbyConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyConnectionModelFromJson(json);

  @override
  String toString() => 'NearbyDevice(id: $id, name: $name, status: $status)';
}
