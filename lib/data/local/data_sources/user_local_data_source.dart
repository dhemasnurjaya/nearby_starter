import 'package:nearby_starter/core/data/local/cache.dart';
import 'package:nearby_starter/data/local/models/user_model.dart';

/// Current logged user data source
abstract class UserLocalDataSource {
  /// Get current logged user
  Future<UserModel> get();

  /// Save current logged user
  Future<void> save(UserModel user);

  /// Delete current logged user
  Future<void> delete();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  UserLocalDataSourceImpl({required Cache<String, UserModel> userCache})
    : _userCache = userCache;

  final Cache<String, UserModel> _userCache;

  @override
  Future<void> delete() {
    return _userCache.clear();
  }

  @override
  Future<UserModel> get() async {
    final users = await _userCache.values();
    return users.first;
  }

  @override
  Future<void> save(UserModel user) {
    return _userCache.write(user.id, user);
  }
}
