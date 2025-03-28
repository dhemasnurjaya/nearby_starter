import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';

/// This will start device advertisement so it can begin
/// accepting and communicating with another devices.
class StartAdvertising extends UseCase<void, StartAdvertisingParams> {
  final ConnectionRepository connectionRepository;

  StartAdvertising({required this.connectionRepository});

  @override
  Future<Either<Failure, void>> call(StartAdvertisingParams params) async {
    return connectionRepository.startAdvertising(params.name);
  }
}

class StartAdvertisingParams extends Equatable {
  /// The name of the advertiser visible to the clients.
  final String name;

  const StartAdvertisingParams(this.name);

  @override
  List<Object?> get props => [name];
}
