import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/error/failures.dart';

/// [Type] is the return type of a successful use case call.
/// [Params] are the parameters that are required to call the use case.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
