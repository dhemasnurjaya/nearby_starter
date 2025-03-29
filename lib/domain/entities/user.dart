import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_starter/data/local/models/user_model.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({required String id, required String name}) = _User;

  factory User.fromModel(UserModel model) {
    return User(id: model.id, name: model.name);
  }
}
