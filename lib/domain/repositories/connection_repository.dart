import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/entities/connection.dart';
import 'package:nearby_starter/domain/entities/connection_message.dart';

abstract class ConnectionRepository {
  /// Begins advertising this device's services on the local network.
  Future<Either<Failure, void>> startAdvertising(String serviceName);

  /// Stops advertising this device's services on the local network.
  Future<Either<Failure, void>> stopAdvertising();

  /// Starts looking for servers nearby.
  /// [clientName] is used as the name of the discovering device.
  Future<Either<Failure, void>> startDiscovering(String clientName);

  /// Stops looking for servers.
  Future<Either<Failure, void>> stopDiscovering();

  /// Opens a connection with the server with [deviceId],
  /// the server can see this device with name [clientName].
  Future<Either<Failure, void>> openConnection({
    required String clientName,
    required String deviceId,
  });

  /// Accepts an incoming connection from the device with the given [deviceId].
  Future<Either<Failure, void>> acceptConnection(String deviceId);

  /// Disconnects from the device with the given [deviceId].
  Future<Either<Failure, void>> closeConnection(String deviceId);

  /// Get saved messages from the local storage that were sent to this device.
  Future<Either<Failure, List<ConnectionMessage>>> getMessages();

  /// Get the list of devices.
  Future<Either<Failure, List<Connection>>> getConnections();

  /// Sends a message to the device with the given [receiverId].
  Future<Either<Failure, void>> sendMessage({
    required String receiverId,
    required String message,
  });
}
