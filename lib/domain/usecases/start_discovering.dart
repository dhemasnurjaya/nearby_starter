import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';

/// This will start device advertisement so it can begin to discover nearby
/// advertisers.
class StartDiscovering extends UseCase<void, StartDiscoveringParams> {
  final ConnectionRepository connectionRepository;

  StartDiscovering({required this.connectionRepository});

  @override
  Future<Either<Failure, void>> call(StartDiscoveringParams params) async {
    return connectionRepository.startDiscovering(params.clientName);
  }
}

class StartDiscoveringParams extends Equatable {
  /// The name of the discoverer visible to the advertiser.
  final String clientName;

  const StartDiscoveringParams(this.clientName);

  @override
  List<Object?> get props => [clientName];
}
