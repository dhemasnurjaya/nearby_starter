import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nearby_starter/core/domain/use_case.dart';
import 'package:nearby_starter/core/error/failures.dart';
import 'package:nearby_starter/domain/entities/user.dart';
import 'package:nearby_starter/domain/repositories/user_repository.dart';

class RegisterUser extends UseCase<void, RegisterUserParams> {
  RegisterUser({required this.userRepository});

  final UserRepository userRepository;

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    return userRepository.saveUser(params.user);
  }
}

class RegisterUserParams extends Equatable {
  const RegisterUserParams({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}
