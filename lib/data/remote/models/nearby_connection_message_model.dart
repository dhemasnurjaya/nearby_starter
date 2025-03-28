import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_connection_message_model.freezed.dart';
part 'nearby_connection_message_model.g.dart';

@freezed
sealed class NearbyConnectionMessageModel with _$NearbyConnectionMessageModel {
  const factory NearbyConnectionMessageModel({
    @JsonKey(name: 'message_id') required String id,
    @JsonKey(name: 'sender_id') required String senderId,
    required String data,
    @JsonKey(name: 'received_at') required DateTime receivedAt,
  }) = _NearbyConnectionMessageModel;

  factory NearbyConnectionMessageModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyConnectionMessageModelFromJson(json);
}
