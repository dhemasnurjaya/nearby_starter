import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/data/remote/data_sources/nearby_connection_remote_data_source.dart';
import 'package:nearby_starter/domain/entities/connection.dart';
import 'package:nearby_starter/domain/entities/connection_message.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';

class ConnectionRepositoryImpl implements ConnectionRepository {
  final NearbyConnectionRemoteDataSource connectionRemoteDataSource;

  ConnectionRepositoryImpl({required this.connectionRemoteDataSource});

  @override
  Future<Either<Failure, void>> startAdvertising(String serviceName) async {
    try {
      await connectionRemoteDataSource.startAdvertising(serviceName);
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to start advertising', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> stopAdvertising() async {
    try {
      await connectionRemoteDataSource.stopAdvertising();
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to stop advertising', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> startDiscovering(String clientName) async {
    try {
      await connectionRemoteDataSource.startDiscovering(clientName);
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to start discovering', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> stopDiscovering() async {
    try {
      await connectionRemoteDataSource.stopDiscovering();
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to start discovering', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> openConnection({
    required String clientName,
    required String deviceId,
  }) async {
    try {
      await connectionRemoteDataSource.openConnection(
        clientName: clientName,
        deviceId: deviceId,
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to open connection', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> closeConnection(String deviceId) async {
    try {
      await connectionRemoteDataSource.closeConnection(deviceId);
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to close connection', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, List<Connection>>> getConnections() async {
    try {
      final connections = await connectionRemoteDataSource.getConnections();
      return Right(
        connections
            .map((e) => Connection(id: e.id, name: e.name, status: e.status))
            .toList(),
      );
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to get devices', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, List<ConnectionMessage>>> getMessages() async {
    try {
      final messages = await connectionRemoteDataSource.getMessages();
      return Right(
        messages.map((e) => ConnectionMessage.fromModel(e)).toList(),
      );
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to get messages', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> acceptConnection(String deviceId) async {
    try {
      await connectionRemoteDataSource.acceptConnection(deviceId);
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to accept connection', cause: e),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required String receiverId,
    required String message,
  }) async {
    try {
      await connectionRemoteDataSource.sendMessage(
        receiverId: receiverId,
        message: message,
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CommunicationFailure(message: 'Failed to send message', cause: e),
      );
    }
  }
}
