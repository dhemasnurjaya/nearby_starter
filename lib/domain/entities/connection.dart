import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_model.dart';
import 'package:nearby_starter/enums.dart';

part 'connection.freezed.dart';

@freezed
sealed class Connection with _$Connection {
  const factory Connection({
    required String id,
    required String name,
    @Default(ConnectionStatus.disconnected) ConnectionStatus status,
  }) = _Connection;

  factory Connection.fromModel(NearbyConnectionModel model) {
    return Connection(id: model.id, name: model.name, status: model.status);
  }
}
