import 'package:equatable/equatable.dart';
import 'nearby_device.dart';

abstract class NearbyEvent extends Equatable {
  const NearbyEvent();
}

class NearbyMessageEvent extends NearbyEvent {
  final String message;
  final String deviceId;

  const NearbyMessageEvent({required this.message, required this.deviceId});

  @override
  List<Object?> get props => [message, deviceId];
}

class NearbyDeviceFoundEvent extends NearbyEvent {
  final NearbyDevice device;

  const NearbyDeviceFoundEvent({required this.device});

  @override
  List<Object?> get props => [device];
}

class NearbyDeviceLostEvent extends NearbyEvent {
  final String deviceId;

  const NearbyDeviceLostEvent({required this.deviceId});

  @override
  List<Object?> get props => [deviceId];
}

class NearbyDeviceConnectedEvent extends NearbyEvent {
  final String deviceId;

  const NearbyDeviceConnectedEvent({required this.deviceId});

  @override
  List<Object?> get props => [deviceId];
}

class NearbyDeviceDisconnectedEvent extends NearbyEvent {
  final String deviceId;

  const NearbyDeviceDisconnectedEvent({required this.deviceId});

  @override
  List<Object?> get props => [deviceId];
}

class NearbyAdvertisingStartedEvent extends NearbyEvent {
  final String serviceName;

  const NearbyAdvertisingStartedEvent({required this.serviceName});

  @override
  List<Object?> get props => [serviceName];
}
