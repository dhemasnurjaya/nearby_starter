import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nearby_connections/nearby_connections.dart' as io;
import 'package:nearby_starter/core/nearby/nearby_device.dart';
import 'package:nearby_starter/core/nearby/nearby_events.dart';

/// This wrapper class simplifies some of the Nearby Connection logic.
/// A server device begins by advertising on the network, after this a client can begin discovering to find the server on the network.
/// Connections are always initiated by the client, and must be manually approved by the server before the connection can be established.
/// Once a connection has been requested and approved, the client and server will be able to send messages to each other.
abstract class Nearby {
  /// Starts advertising as [deviceName] so clients can find it and connect to it.
  /// Advertising will stop when the stream is closed.
  ///
  /// When a client disconnects, or some other event occurs that causes it to be unable to communicate with the server,
  /// the device is reported as "lost", so the client has to attempt connecting again.
  Future<Stream<NearbyEvent>> startAdvertising(String deviceName);

  /// Starts discovering nearby advertised services.
  /// Advertised services will see this discovering device as [clientName].
  /// Discovering will stop when the stream is closed
  Future<Stream<NearbyEvent>> startDiscovering(String clientName);

  Future<void> stopAdvertising();

  Future<void> stopDiscovering();

  /// Used by a client device to connect to a server's [deviceId]
  /// The server will see this connecting device as [clientName]
  Future<void> connectToDevice(String clientName, String deviceId);

  /// Used by the server to accept an incoming connection.
  Future<void> acceptConnection(String deviceId);

  /// Disconnects from the [deviceId]
  Future<void> disconnectFromDevice(String deviceId);

  /// Sends a message to a device.
  Future<void> write(String deviceId, String message);
}

class NearbyImpl implements Nearby {
  final _nearby = io.Nearby();

  StreamController<NearbyEvent>? _advertiserController;
  StreamController<NearbyEvent>? _discovererController;

  @override
  Future<Stream<NearbyEvent>> startAdvertising(String serviceName) async {
    _advertiserController = StreamController<NearbyEvent>();

    // start advertising
    await _nearby.startAdvertising(
      serviceName,
      io.Strategy.P2P_CLUSTER,
      onConnectionInitiated: (endpointId, connectionInfo) {
        // a client is requesting a connection,
        _advertiserController?.add(
          NearbyDeviceFoundEvent(
            device: NearbyDevice(
              id: endpointId,
              name: connectionInfo.endpointName,
            ),
          ),
        );

        // always accept connection request
        acceptConnection(endpointId);
      },
      onConnectionResult: (endpointId, status) {
        // the state of a client connection has changed
        switch (status) {
          case io.Status.CONNECTED:
            _advertiserController?.add(
              NearbyDeviceConnectedEvent(deviceId: endpointId),
            );
            break;
          case io.Status.REJECTED:
            // the server rejected the connection
            _advertiserController?.add(
              NearbyDeviceLostEvent(deviceId: endpointId),
            );
          case io.Status.ERROR:
            _advertiserController?.add(
              NearbyDeviceLostEvent(deviceId: endpointId),
            );
            break;
        }
      },
      onDisconnected: (endpointId) {
        // a client disconnected
        _advertiserController?.add(NearbyDeviceLostEvent(deviceId: endpointId));
      },
    );

    if (_advertiserController != null && !_advertiserController!.isClosed) {
      _advertiserController?.add(
        NearbyAdvertisingStartedEvent(serviceName: serviceName),
      );
    }

    return _advertiserController!.stream;
  }

  @override
  Future<Stream<NearbyEvent>> startDiscovering(String clientName) async {
    _discovererController = StreamController<NearbyEvent>();

    // start discovering
    await _nearby.startDiscovery(
      clientName,
      io.Strategy.P2P_CLUSTER,
      onEndpointFound: (endpointId, endpointName, serviceId) {
        // a server was discovered
        _discovererController?.add(
          NearbyDeviceFoundEvent(
            device: NearbyDevice(id: endpointId, name: endpointName),
          ),
        );
      },
      onEndpointLost: (endpointId) {
        // a server can no longer be found on the network.
        _discovererController?.add(
          NearbyDeviceLostEvent(deviceId: endpointId!),
        );
      },
    );

    return _discovererController!.stream;
  }

  @override
  Future<void> connectToDevice(String clientName, String deviceId) async {
    await _nearby.requestConnection(
      clientName,
      deviceId,
      onConnectionInitiated: (endpointId, connectionInfo) {
        // The server responded with it's own connection request (basically an approval),
        // so we can accept it automatically.
        _nearby.acceptConnection(
          endpointId,
          onPayLoadRecieved: (endpointId, payload) {
            // a message was received from the server.
            if (payload.type == io.PayloadType.BYTES) {
              final message = String.fromCharCodes(payload.bytes!);
              _discovererController?.add(
                NearbyMessageEvent(message: message, deviceId: endpointId),
              );
            }
          },
        );
      },
      // called when a connection request is accepted/rejected
      onConnectionResult: (endpointId, status) {
        switch (status) {
          case io.Status.CONNECTED:
            _discovererController?.add(
              NearbyDeviceConnectedEvent(deviceId: endpointId),
            );
            break;
          case io.Status.REJECTED:
            _discovererController?.add(
              NearbyDeviceDisconnectedEvent(deviceId: endpointId),
            );
          case io.Status.ERROR:
            _discovererController?.add(
              NearbyDeviceLostEvent(deviceId: endpointId),
            );
            break;
        }
      },
      // called when an endpoint disconnects
      onDisconnected: (endpointId) {
        _discovererController?.add(
          NearbyDeviceDisconnectedEvent(deviceId: endpointId),
        );
      },
    );
  }

  @override
  Future<void> disconnectFromDevice(String deviceId) {
    return _nearby.disconnectFromEndpoint(deviceId);
  }

  @override
  Future<void> stopAdvertising() async {
    await _nearby.stopAdvertising();
    await _advertiserController?.close();
    _advertiserController = null;
  }

  @override
  Future<void> stopDiscovering() async {
    await _nearby.stopDiscovery();
    await _discovererController?.close();
    _discovererController = null;
  }

  @override
  Future<void> acceptConnection(String deviceId) async {
    await _nearby.acceptConnection(
      deviceId,
      onPayLoadRecieved: (endpointId, payload) {
        // a message was received from the client.
        if (payload.type == io.PayloadType.BYTES) {
          final message = String.fromCharCodes(payload.bytes!);
          _advertiserController?.add(
            NearbyMessageEvent(message: message, deviceId: endpointId),
          );
        }
      },
    );
  }

  @override
  Future<void> write(String deviceId, String message) async {
    final payloadBytes = Uint8List.fromList(message.codeUnits);
    await _nearby.sendBytesPayload(deviceId, payloadBytes);
  }
}
