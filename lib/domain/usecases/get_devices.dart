import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/entities/connection.dart';
import 'package:nearby_starter/domain/repositories/connection_repository.dart';

class GetDevices extends UseCase<List<Connection>, NoParams> {
  final ConnectionRepository connectionRepository;

  GetDevices({required this.connectionRepository});

  @override
  Future<Either<Failure, List<Connection>>> call(NoParams params) {
    return connectionRepository.getConnections();
  }
}
