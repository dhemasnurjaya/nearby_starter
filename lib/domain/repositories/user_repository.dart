import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();

  Future<Either<Failure, void>> saveUser(User user);
}
