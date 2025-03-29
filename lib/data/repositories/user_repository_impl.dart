import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/data/local/data_sources/user_local_data_source.dart';
import 'package:nearby_starter/data/local/models/user_model.dart';
import 'package:nearby_starter/domain/entities/user.dart';
import 'package:nearby_starter/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required UserLocalDataSource userLocalDataSource})
    : _userLocalDataSource = userLocalDataSource;

  final UserLocalDataSource _userLocalDataSource;

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final userModel = await _userLocalDataSource.get();
      return Right(User.fromModel(userModel));
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString(), cause: e));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(User user) async {
    try {
      final userModel = UserModel.fromEntity(user);
      await _userLocalDataSource.save(userModel);
      return Right(null);
    } on Exception catch (e) {
      return Left(CacheFailure(message: e.toString(), cause: e));
    }
  }
}
