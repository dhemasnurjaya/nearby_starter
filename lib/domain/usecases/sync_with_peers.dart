import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';

class SyncWithPeers extends UseCase<void, NoParams> {
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return Right(null);
  }
}
