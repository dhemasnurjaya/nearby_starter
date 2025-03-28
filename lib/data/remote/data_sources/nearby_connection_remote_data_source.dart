import 'dart:async';

import 'package:nearby_starter/core/data/local/cache.dart';
import 'package:nearby_starter/core/id_generator.dart';
import 'package:nearby_starter/core/nearby/nearby.dart';
import 'package:nearby_starter/core/nearby/nearby_events.dart';
import 'package:nearby_starter/core/time.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_message_model.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_model.dart';
import 'package:nearby_starter/data/remote/models/nearby_connection_status_model.dart';
import 'package:nearby_starter/enums.dart';

abstract class NearbyConnectionRemoteDataSource {
  /// Starts advertising the [serviceName] to nearby devices.
  /// It will continue to advertise until [stopAdvertising] is called.
  Future<void> startAdvertising(String serviceName);

  /// Stops advertising the service.
  Future<void> stopAdvertising();

  /// Starts discovering nearby devices.
  /// Advertised services will see this discovering device as [clientName]
  /// It will continue to discover until [stopDiscovering] is called.
  Future<void> startDiscovering(String clientName);

  Future<void> stopDiscovering();

  Future<List<NearbyConnectionMessageModel>> getMessages();

  Future<void> deleteMessage(String messageId);

  Future<List<NearbyConnectionModel>> getConnections();

  /// Connect to a device with the given [deviceId].
  Future<void> openConnection({
    required String clientName,
    required String deviceId,
  });

  /// Accept an incoming connection from the device with the given [deviceId].
  Future<void> acceptConnection(String deviceId);

  /// Disconnect from the device with the given [deviceId].
  Future<void> closeConnection(String deviceId);

  /// Send a message to the device with the given [receiverId].
  Future<void> sendMessage({
    required String receiverId,
    required String message,
  });
}

class NearbyConnectionRemoteDataSourceImpl
    implements NearbyConnectionRemoteDataSource {
  final Nearby nearby;
  final Time time;
  final IdGenerator idGenerator;

  final Cache<String, NearbyConnectionStatusModel> statusCache;
  final Cache<String, NearbyConnectionModel> deviceCache;
  final Cache<String, NearbyConnectionMessageModel> messageCache;

  StreamSubscription<NearbyEvent>? _nearbyAdvertiserSubscription;
  StreamSubscription<NearbyEvent>? _nearbyDiscovererSubscription;

  NearbyConnectionRemoteDataSourceImpl({
    required this.nearby,
    required this.time,
    required this.idGenerator,
    required this.statusCache,
    required this.deviceCache,
    required this.messageCache,
  });

  @override
  Future<void> startAdvertising(String serviceName) async {
    if (_nearbyAdvertiserSubscription != null) {
      throw Exception('Already advertising');
    }

    final stream = await nearby.startAdvertising(serviceName);

    _nearbyAdvertiserSubscription = stream.listen((event) async {
      if (event is NearbyAdvertisingStartedEvent) {
        statusCache.write(
          time.now().toIso8601String(),
          NearbyConnectionStatusModel(
            serviceName: event.serviceName,
            statusName: '$NearbyAdvertisingStartedEvent',
          ),
        );
      }

      if (event is NearbyDeviceFoundEvent) {
        // a client is requesting a connection, save the device in the cache
        // and set the status to connecting (awaiting server confirmation)
        deviceCache.write(
          event.device.id,
          NearbyConnectionModel(
            id: event.device.id,
            name: event.device.name,
            status: ConnectionStatus.connecting,
          ),
        );
      }

      if (event is NearbyDeviceConnectedEvent) {
        // a client connection request has been accepted, set the status to connected
        final device = await deviceCache.read(event.deviceId);
        deviceCache.write(
          event.deviceId,
          device.copyWith(status: ConnectionStatus.connected),
        );
      }

      if (event is NearbyDeviceLostEvent) {
        await deviceCache.delete(event.deviceId);
      }

      if (event is NearbyDeviceDisconnectedEvent) {}

      if (event is NearbyMessageEvent) {
        // a message received, save the message in the cache
        final messageId = idGenerator.generateId();
        messageCache.write(
          messageId,
          NearbyConnectionMessageModel(
            id: messageId,
            senderId: event.deviceId,
            receivedAt: time.now(),
            data: event.message,
          ),
        );
      }
    });
  }

  @override
  Future<void> startDiscovering(String clientName) async {
    if (_nearbyDiscovererSubscription != null) {
      throw Exception('Already discovering');
    }

    final stream = await nearby.startDiscovering(clientName);

    _nearbyDiscovererSubscription = stream.listen((event) async {
      if (event is NearbyDeviceFoundEvent) {
        // found a server (advertiser), save the device in the cache
        deviceCache.write(
          event.device.id,
          NearbyConnectionModel(
            id: event.device.id,
            name: event.device.name,
            broadcasting: true,
          ),
        );
      }

      if (event is NearbyDeviceLostEvent) {
        // a server (advertiser) is no longer visible on the network
        // or an error has occurred when requesting the connection
        // set the broadcasting to false
        final device = await deviceCache.read(event.deviceId);
        deviceCache.write(event.deviceId, device.copyWith(broadcasting: false));
      }

      if (event is NearbyDeviceConnectedEvent) {
        // a server connection request has been accepted
        // set the status to connected
        final device = await deviceCache.read(event.deviceId);
        deviceCache.write(
          event.deviceId,
          device.copyWith(status: ConnectionStatus.connected),
        );
      }

      if (event is NearbyDeviceDisconnectedEvent) {
        // disconnected from the server
        // or the server rejected the connection request
        final device = await deviceCache.read(event.deviceId);
        deviceCache.write(
          event.deviceId,
          device.copyWith(status: ConnectionStatus.disconnected),
        );
      }

      if (event is NearbyMessageEvent) {
        // a message received, save the message in the cache
        final messageId = idGenerator.generateId();
        messageCache.write(
          messageId,
          NearbyConnectionMessageModel(
            id: messageId,
            senderId: event.deviceId,
            receivedAt: time.now(),
            data: event.message,
          ),
        );
      }
    });
  }

  @override
  Future<void> stopAdvertising() async {
    await nearby.stopAdvertising();
    await _nearbyAdvertiserSubscription?.cancel();
    _nearbyAdvertiserSubscription = null;
  }

  @override
  Future<void> stopDiscovering() async {
    await nearby.stopDiscovering();
    await _nearbyDiscovererSubscription?.cancel();
    _nearbyDiscovererSubscription = null;
  }

  @override
  Future<List<NearbyConnectionModel>> getConnections() async {
    return deviceCache.values();
  }

  @override
  Future<void> acceptConnection(String deviceId) async {
    await nearby.acceptConnection(deviceId);
  }

  @override
  Future<void> openConnection({
    required String clientName,
    required String deviceId,
  }) async {
    final device = await deviceCache.read(deviceId);
    await deviceCache.write(
      deviceId,
      device.copyWith(status: ConnectionStatus.connecting),
    );
    await nearby.connectToDevice(clientName, deviceId);
  }

  @override
  Future<void> closeConnection(String deviceId) async {
    await nearby.disconnectFromDevice(deviceId);
  }

  @override
  Future<List<NearbyConnectionMessageModel>> getMessages() async {
    return messageCache.values();
  }

  @override
  Future<void> deleteMessage(String messageId) {
    return messageCache.delete(messageId);
  }

  @override
  Future<void> sendMessage({
    required String receiverId,
    required String message,
  }) async {
    await nearby.write(receiverId, message);
  }
}
