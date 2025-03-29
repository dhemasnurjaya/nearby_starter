part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {
  const RegistrationInitial();
}

class RegistrationLoading extends RegistrationState {
  const RegistrationLoading();
}

class UserRegistered extends RegistrationState {
  const UserRegistered({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

class RegistrationError extends RegistrationState implements ErrorState {
  const RegistrationError({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
