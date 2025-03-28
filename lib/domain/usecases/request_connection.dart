import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';

class RequestConnection extends UseCase<void, RequestConnectionParams> {
  final ConnectionRepository connectionRepository;

  RequestConnection({required this.connectionRepository});

  @override
  Future<Either<Failure, void>> call(RequestConnectionParams params) {
    return connectionRepository.openConnection(
      clientName: params.clientName,
      deviceId: params.deviceId,
    );
  }
}

class RequestConnectionParams extends Equatable {
  final String clientName;
  final String deviceId;

  const RequestConnectionParams({
    required this.clientName,
    required this.deviceId,
  });

  @override
  List<Object> get props => [deviceId];
}
