import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/either_extensions.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/core/presentation/bloc/error_state.dart';
import 'package:nearby_starter/domain/entities/connection.dart';
import 'package:nearby_starter/domain/usecases/get_devices.dart';
import 'package:nearby_starter/domain/usecases/request_connection.dart';
import 'package:nearby_starter/enums.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  ConnectionBloc({required this.getDevices, required this.requestConnection})
    : super(const ConnectionInitial()) {
    on<SendConnectionRequestsEvent>(
      _onSendConnectionRequests,
      transformer: droppable(),
    );
  }

  final GetDevices getDevices;
  final RequestConnection requestConnection;

  FutureOr<void> _onSendConnectionRequests(
    SendConnectionRequestsEvent event,
    Emitter<ConnectionState> emit,
  ) async {
    emit(const ConnectionLoading());
    final devices = <Connection>[];
    final result = await getDevices(
      const NoParams(),
    ).chain(_getDevicesToConnect).chain((d) {
      devices.addAll(d);
      return _sendConnectionRequests(event.username, d);
    });
    result.fold(
      (failure) => emit(ConnectionError(failure.message)),
      (_) => emit(ConnectionRequestsSent(devices)),
    );
  }

  Future<Either<Failure, List<Connection>>> _getDevicesToConnect(
    Iterable<Connection> devices,
  ) async {
    try {
      final deviceToConnect = devices.where(
        (device) => device.status == ConnectionStatus.disconnected,
      );
      return Right(deviceToConnect.toList());
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString(), cause: e));
    }
  }

  Future<Either<Failure, List<void>>> _sendConnectionRequests(
    String username,
    Iterable<Connection> devices,
  ) async {
    final connectionRequests = devices.map(
      (device) async => requestConnection(
        RequestConnectionParams(clientName: username, deviceId: device.id),
      ),
    );
    final result = await Future.wait(connectionRequests);
    return result.combineRight();
  }
}
