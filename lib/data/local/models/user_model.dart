import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nearby_starter/domain/entities/user.dart';

part 'user_model.freezed.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({required String id, required String name}) =
      _UserModel;

  factory UserModel.fromEntity(User model) {
    return UserModel(id: model.id, name: model.name);
  }
}
