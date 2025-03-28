import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';

/// This will stop device advertisement so it can stop accepting and
/// communicating with another devices.
class StopAdvertising extends UseCase<void, NoParams> {
  final ConnectionRepository connectionRepository;

  StopAdvertising({required this.connectionRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return connectionRepository.stopAdvertising();
  }
}
