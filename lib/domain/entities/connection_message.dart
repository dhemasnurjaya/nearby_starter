import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_message_model.dart';

part 'connection_message.freezed.dart';
part 'connection_message.g.dart';

@freezed
sealed class ConnectionMessage with _$ConnectionMessage {
  const factory ConnectionMessage({
    required String id,
    required DateTime receivedAt,
    required String senderId,
    required String data,
  }) = _ConnectionMessage;

  factory ConnectionMessage.fromJson(Map<String, dynamic> json) =>
      _$ConnectionMessageFromJson(json);

  factory ConnectionMessage.fromModel(NearbyConnectionMessageModel model) {
    return ConnectionMessage(
      id: model.id,
      receivedAt: model.receivedAt,
      senderId: model.senderId,
      data: model.data,
    );
  }
}
